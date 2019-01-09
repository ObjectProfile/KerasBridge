Class {
	#name : #KTestCase,
	#superclass : #PBTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #accessing }
KTestCase class >> appResource [
	^ KApplicationTestResource
]

{ #category : #running }
KTestCase >> setUp [
	KCF reset
]
