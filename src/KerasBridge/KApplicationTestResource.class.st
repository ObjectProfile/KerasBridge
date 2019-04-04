Class {
	#name : #KApplicationTestResource,
	#superclass : #PBApplicationTestResource,
	#category : #'KerasBridge-Tests'
}

{ #category : #initialization }
KApplicationTestResource >> applicationClass [
	^ Keras
]
