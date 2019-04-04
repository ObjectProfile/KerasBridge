Class {
	#name : #KTestCase,
	#superclass : #PBTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #accessing }
KTestCase class >> appResource [
	^ KApplicationTestResource
]

{ #category : #asserting }
KTestCase >> applicationClass [
	^ Keras
]
