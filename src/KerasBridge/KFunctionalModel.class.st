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

{ #category : #'as yet unclassified' }
KFunctionalModel class >> inputs: collectionOfInputTensors outputs: collectionOfOutputTensors [
	^ self new
		inputs: collectionOfInputTensors;
		outputs: collectionOfOutputTensors;
		createObject
]

{ #category : #'as yet unclassified' }
KFunctionalModel >> createObject [
	self 
		basicCreateObjectArgs: #() 
		nameArgs: (Array 
						with: #inputs -> inputs
						with: #outputs -> outputs)
]

{ #category : #accessing }
KFunctionalModel >> inputs [
	^ inputs
]

{ #category : #accessing }
KFunctionalModel >> inputs: anObject [
	inputs := anObject
]

{ #category : #utilities }
KFunctionalModel >> numberOfInputTensors [
	^ self inputs size
]

{ #category : #accessing }
KFunctionalModel >> outputs [
	^ outputs
]

{ #category : #accessing }
KFunctionalModel >> outputs: anObject [
	outputs := anObject
]

{ #category : #'as yet unclassified' }
KFunctionalModel >> pythonClass [
	^ 'keras' asP3GI => #models => #Model
]
