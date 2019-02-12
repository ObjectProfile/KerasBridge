Class {
	#name : #KMergeLayer,
	#superclass : #KLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #accessing }
KMergeLayer class >> default [
	^ self new createObject
]

{ #category : #functional }
KMergeLayer class >> tensors: aListOfTensors [
	^ self default tensors: aListOfTensors
]

{ #category : #'as yet unclassified' }
KMergeLayer >> createObject [
	self basicCreateObjectArgs: #()
]

{ #category : #functional }
KMergeLayer >> tensors: aCollectionOfTensors [
	^ KMergeTensor model: self tensors: aCollectionOfTensors
]
