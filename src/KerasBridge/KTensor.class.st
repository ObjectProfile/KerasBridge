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
KTensor >> model: aModel [
	aModel setBuilt.
	model := aModel
]

{ #category : #'as yet unclassified' }
KTensor >> pythonClass [
	^ #tf => #Tensor
]
