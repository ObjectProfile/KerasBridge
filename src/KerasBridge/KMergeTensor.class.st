Class {
	#name : #KMergeTensor,
	#superclass : #KTensor,
	#instVars : [
		'previousTensors'
	],
	#category : #'KerasBridge-Model'
}

{ #category : #'as yet unclassified' }
KMergeTensor class >> model: aLayerModelOrActivation tensors: prevTensors [
	^ self new
		model: aLayerModelOrActivation;
		previousTensors: prevTensors;
		ensureCreateObject
]

{ #category : #'as yet unclassified' }
KMergeTensor >> createObject [
	self basicCreateObjectExpr: (model callWith: (Array with: previousTensors))
]

{ #category : #accessing }
KMergeTensor >> previousTensors [
	^ previousTensors
]

{ #category : #accessing }
KMergeTensor >> previousTensors: anObject [
	previousTensors := anObject
]
