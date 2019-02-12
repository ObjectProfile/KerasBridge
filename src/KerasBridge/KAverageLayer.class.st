Class {
	#name : #KAverageLayer,
	#superclass : #KMergeLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KAverageLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Average
]
