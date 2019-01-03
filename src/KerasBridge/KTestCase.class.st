Class {
	#name : #KTestCase,
	#superclass : #TestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #accessing }
KTestCase class >> resources [
	^ Array with: KApplicationTestResource
]
