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
KTestCase >> application [
	^ Keras uniqueInstance
]

{ #category : #asserting }
KTestCase >> cf [
	^ KCF
]

{ #category : #running }
KTestCase >> setUp [
	KCF reset
]
