Class {
	#name : #KFunctionalModel,
	#superclass : #KModel,
	#instVars : [
		'inputs',
		'outputs'
	],
	#category : #'KerasBridge-Model'
}

{ #category : #'as yet unclassified' }
KFunctionalModel class >> input: inputTensor output: outputTensor [
	^ self inputs: (Array with: inputTensor) outputs: (Array with: outputTensor)
]

{ #category : #'as yet unclassified' }
KFunctionalModel class >> input: inputTensor outputs: collectionOfOutputTensors [
	^ self inputs: (Array with: inputTensor) outputs: collectionOfOutputTensors
]

{ #category : #'as yet unclassified' }
KFunctionalModel class >> inputs: collectionOfInputTensors output: outputTensor [
	^ self inputs: collectionOfInputTensors outputs: (Array with: outputTensor)
]
