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

{ #category : #compiling }
KModel >> fit: trainData labels: trainLabels epochs: numberOfEpochs [
	^ self fit: trainData labels: trainLabels epochs: numberOfEpochs batchSize: 1
]

{ #category : #compiling }
KModel >> fit: trainData labels: trainLabels epochs: numberOfEpochs batchSize: batchSize [
	| trainDataBinding trainLabelsBinding |
	trainDataBinding := KCF addBinding: (PBBinding wrap: trainData).
	trainLabelsBinding := KCF addBinding: (PBBinding wrap: trainLabels).
	KCF << ((
		self => #fit 
			callWith: (Array 
					with: (KNumpyArray on: trainDataBinding)
					with: (KNumpyArray on: trainLabelsBinding))
			with: (Array 
					with: #verbose -> 0
					with: #batch_size -> batchSize
					with: #epochs -> numberOfEpochs
					with: #callbacks -> #()) asDictionary) 
			=> #history).
		KCF transformBlock: [ :history | KTrainingHistory model: self history: history ].
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
