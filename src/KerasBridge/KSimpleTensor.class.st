Class {
	#name : #KSimpleTensor,
	#superclass : #KTensor,
	#instVars : [
		'previousTensor'
	],
	#category : #'KerasBridge-Model'
}

{ #category : #'as yet unclassified' }
KSimpleTensor class >> model: aLayerModelOrActivation tensor: prevTensor [
	^ self new
		model: aLayerModelOrActivation;
		previousTensor: prevTensor;
		ensureCreateObject
]

{ #category : #'as yet unclassified' }
KSimpleTensor >> createObject [
	self basicCreateObjectExpr: (model createPythonTensorExpression: previousTensor)
]

{ #category : #accessing }
KSimpleTensor >> previousTensor [
	^ previousTensor
]

{ #category : #accessing }
KSimpleTensor >> previousTensor: anObject [
	previousTensor := anObject
]
