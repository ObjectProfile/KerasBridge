Class {
	#name : #KInputTensor,
	#superclass : #KObject,
	#instVars : [
		'shape'
	],
	#category : #'KerasBridge-Model'
}

{ #category : #'as yet unclassified' }
KInputTensor class >> numberOfInputs: aNumberOfInputs [
	^ self shape: (Array with: aNumberOfInputs)
]

{ #category : #'as yet unclassified' }
KInputTensor class >> shape: anArrayOfIntegers [
	^ self new
		shape: anArrayOfIntegers;
		createObject
]

{ #category : #'as yet unclassified' }
KInputTensor >> createObject [
	self 
		basicCreateObjectArgs: #() 
		nameArgs: (Array with: #shape -> (PBTuple withAll: self shape) )
]

{ #category : #'as yet unclassified' }
KInputTensor >> pythonClass [
	^ #keras asP3GI => #layers => #Input
]

{ #category : #accessing }
KInputTensor >> shape [
	^ shape
]

{ #category : #accessing }
KInputTensor >> shape: anObject [
	shape := anObject
]
