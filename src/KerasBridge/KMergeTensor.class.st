Class {
	#name : #KMergeTensor,
	#superclass : #KTensor,
	#instVars : [
		'previousTensors'
	],
	#category : #'KerasBridge-Model'
}

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
