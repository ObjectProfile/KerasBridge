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
	self applicationClass stop.
	self applicationClass start.
	application := self applicationClass uniqueInstance
]

{ #category : #initialization }
KApplicationTestResource >> tearDown [
	self applicationClass stop.
]
