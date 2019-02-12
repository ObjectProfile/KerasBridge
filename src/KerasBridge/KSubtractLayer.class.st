Class {
	#name : #KSubtractLayer,
	#superclass : #KMergeLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KSubtractLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Subtract
]
