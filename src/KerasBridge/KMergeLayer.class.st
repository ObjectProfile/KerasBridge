Class {
	#name : #KMergeLayer,
	#superclass : #KLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #functional }
KMergeLayer >> tensors: aCollectionOfTensors [
	^ KMergeTensor model: self tensors: aCollectionOfTensors
]
