Class {
	#name : #KUtilsTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KUtilsTest >> testNpArrayFromPharo [
	self assertInstanceClass: (KNpArray on: #(1 2 3 4)) name: 'ndarray'
]
