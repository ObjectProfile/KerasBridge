Class {
	#name : #KAddLayer,
	#superclass : #KMergeLayer,
	#category : #'KerasBridge-Layers'
}

{ #category : #'instance creation' }
KAddLayer class >> new [
	^ super new
		ensureCreateObject
]

{ #category : #'as yet unclassified' }
KAddLayer >> createObject [
	self basicCreateObjectArgs: #()
]

{ #category : #'as yet unclassified' }
KAddLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Add
]
