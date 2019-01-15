Class {
	#name : #KUtilsTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KUtilsTest >> testNumpyArray [
	self assertInstanceClass: (KNumpyArray on: #(1 2 3 4)) name: 'ndarray'
]
