Class {
	#name : #KInputLayer,
	#superclass : #KLayer,
	#instVars : [
		'inputShape'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #accessing }
KInputLayer class >> inputShape: inputShape [
	^ self new
		inputShape: inputShape;
		createObject
]

{ #category : #'as yet unclassified' }
KInputLayer class >> numberOfInputs: aNumberOfInputs [
	^ self inputShape: (Array with: aNumberOfInputs)
]

{ #category : #'as yet unclassified' }
KInputLayer >> createObject [
	self 
		basicCreateObjectArgs: #() 
		nameArgs: (Array with: #input_shape -> (PBTuple withAll: self inputShape) ) asDictionary
]

{ #category : #accessing }
KInputLayer >> inputShape [
	^ inputShape
]

{ #category : #accessing }
KInputLayer >> inputShape: arrayOfInputSizes [
	inputShape := arrayOfInputSizes
]

{ #category : #'as yet unclassified' }
KInputLayer >> pythonClass [
	^ 'keras' asP3GI => #layers => #InputLayer
]
