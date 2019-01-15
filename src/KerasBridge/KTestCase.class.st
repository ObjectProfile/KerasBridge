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
KTestCase >> assertClass: cls name: aName [
	KCF << (cls => #__name__).
	self assert: KCF send waitForValue equals: aName
]

{ #category : #running }
KTestCase >> setUp [
	KCF reset
]
