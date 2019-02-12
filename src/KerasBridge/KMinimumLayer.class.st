Class {
	#name : #KMinimumLayer,
	#superclass : #KMergeLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KMinimumLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Minimum
]
