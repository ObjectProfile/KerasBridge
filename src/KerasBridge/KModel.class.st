Class {
	#name : #KModel,
	#superclass : #KObject,
	#instVars : [
		'optimizer',
		'lossFunction',
		'metrics'
	],
	#category : #'KerasBridge-Model'
}

{ #category : #compiling }
KModel >> compileLoss: aLossFunction optimizer: anOptimizer [
	self compileLoss: aLossFunction optimizer: anOptimizer metrics: #()
]

{ #category : #compiling }
KModel >> compileLoss: aLossFunction optimizer: anOptimizer metrics: arrayOfMetrics [
	lossFunction := aLossFunction.
	optimizer := anOptimizer.
	metrics := arrayOfMetrics.
	KCF << (self => #compile 
					callWith: #()
					with: (Array 
								with: #optimizer -> optimizer
								with: #loss -> lossFunction
								with: #metrics -> metrics) asDictionary ).
	KCF send
]

{ #category : #utilities }
KModel >> createProgressBarForEpochs: numberOfEpochs withSemaphore: fitSemaphore [
	| job |
	job := [ :j | 
		j
			title: 'Training model (Epochs)';
			min: 0;
			max: numberOfEpochs.
		World doOneCycle.
		fitSemaphore wait ] asJob.
	[ job run ] fork.
	^ job
]

{ #category : #compiling }
KModel >> evaluate: inputs labels: labels [
	^ self evaluate: inputs labels: labels batchSize: 1
]

{ #category : #compiling }
KModel >> evaluate: inputs labels: labels batchSize: batchSize [
	| inputsBinding labelsBinding |
	inputsBinding := KCF addBinding: (PBBinding wrap: inputs).
	labelsBinding := KCF addBinding: (PBBinding wrap: labels).
	KCF << (
		self => #evaluate 
			callWith: (Array 
					with: (KNumpyArray on: inputsBinding)
					with: (KNumpyArray on: labelsBinding))
			with: (Array 
					with: #batch_size -> batchSize) asDictionary) .
	^ KCF send
]

{ #category : #compiling }
KModel >> fit: trainData labels: trainLabels epochs: numberOfEpochs [
	^ self fit: trainData labels: trainLabels epochs: numberOfEpochs batchSize: 1
]

{ #category : #compiling }
KModel >> fit: trainData labels: trainLabels epochs: numberOfEpochs batchSize: batchSize [
	| trainDataBinding trainLabelsBinding observer callback progressBar fitSemaphore |
	trainDataBinding := KCF addBinding: (PBBinding wrap: trainData).
	trainLabelsBinding := KCF addBinding: (PBBinding wrap: trainLabels).
	fitSemaphore := Semaphore new.
	progressBar := self createProgressBarForEpochs: numberOfEpochs withSemaphore: fitSemaphore.
	observer := KCF observerFromCallback: [ progressBar increment. World doOneCycle ].
	callback := #pharo_keras_hooks asP3GI => #Pharo_Fit_Notifier callWith: (Array with: observer).
	KCF << ((
		self => #fit 
			callWith: (Array 
					with: (KNumpyArray on: trainDataBinding)
					with: (KNumpyArray on: trainLabelsBinding))
			with: (Array 
					with: #verbose -> 0
					with: #batch_size -> batchSize
					with: #epochs -> numberOfEpochs
					with: #callbacks -> (Array with: callback)) asDictionary) 
			=> #history).
		KCF transformBlock: [ :history | 
			fitSemaphore signal.
			KTrainingHistory model: self history: history ].
		^ KCF send
]

{ #category : #accessing }
KModel >> lossFunction [
	^ lossFunction
]

{ #category : #accessing }
KModel >> metrics [
	^ metrics
]

{ #category : #accessing }
KModel >> optimizer [
	^ optimizer
]

{ #category : #compiling }
KModel >> predict: inputs [
	^ self predict: inputs transformBlock: #yourself
]

{ #category : #compiling }
KModel >> predict: inputs transformBlock: aBlock [
	| inputsBinding |
	inputsBinding := KCF addBinding: (PBBinding wrap: inputs).
	KCF << ((
		self => #predict 
			callWith: (Array with: (KNumpyArray on: inputsBinding))
			with: (Array with: #batch_size -> 64) asDictionary) => #tolist callWith: #()).
	KCF transformBlock: aBlock.
	^ KCF send
]

{ #category : #compiling }
KModel >> predictSingleValue: input [
	^ self predictSingleValue: input transformBlock: #yourself
]

{ #category : #compiling }
KModel >> predictSingleValue: input transformBlock: aBlock [
	^ self predict: (Array with: input) transformBlock: aBlock
]

{ #category : #functional }
KModel >> tensor: aTensor [
	^ KSimpleTensor model: self tensor: aTensor
]

{ #category : #functional }
KModel >> tensors: aCollectionOfTensors [
	^ aCollectionOfTensors size = 1
		ifTrue: [ self tensor: aCollectionOfTensors first ]
		ifFalse: [ KMergeTensor model: self tensors: aCollectionOfTensors ]
]
