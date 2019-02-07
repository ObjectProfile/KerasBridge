Class {
	#name : #KTensor,
	#superclass : #KObject,
	#instVars : [
		'model'
	],
	#category : #'KerasBridge-Model'
}

{ #category : #accessing }
KTensor >> model [
	^ model
]

{ #category : #accessing }
KTensor >> model: anObject [
	model := anObject
]

{ #category : #'as yet unclassified' }
KTensor >> pythonClass [
	^ #tf => #Tensor
]
