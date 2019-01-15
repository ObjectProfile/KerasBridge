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
KModel >> fit: trainData labels: trainLabels epochs: numberOfEpochs batchSize: batchSize [
	| trainDataBinding trainLabelsBinding |
	trainDataBinding := PBBinding wrap: trainData.
	trainLabelsBinding := PBBinding wrap: trainLabels.
	
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
