Class {
	#name : #KApplicationTestResource,
	#superclass : #PBApplicationTestResource,
	#category : #'KerasBridge-Tests'
}

{ #category : #initialization }
KApplicationTestResource >> application [
	^ Keras
]
