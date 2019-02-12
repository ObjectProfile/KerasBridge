Class {
	#name : #KMaximumLayer,
	#superclass : #KMergeLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KMaximumLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Maximum
]
