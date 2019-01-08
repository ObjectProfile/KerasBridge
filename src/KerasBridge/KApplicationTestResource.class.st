Class {
	#name : #KApplicationTestResource,
	#superclass : #PBApplicationTestResource,
	#category : #'KerasBridge-Tests'
}

{ #category : #initialization }
KApplicationTestResource >> applicationClass [
	^ Keras
]

{ #category : #initialization }
KApplicationTestResource >> setUp [
	super setUp.
	application := self applicationClass new.
	self application start
]
