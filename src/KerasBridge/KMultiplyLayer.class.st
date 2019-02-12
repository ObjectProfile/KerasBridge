Class {
	#name : #KMultiplyLayer,
	#superclass : #KMergeLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KMultiplyLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Multiply
]
