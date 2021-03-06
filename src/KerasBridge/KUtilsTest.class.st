Class {
	#name : #KUtilsTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KUtilsTest >> testNpArrayAt [
	self assert: ((KNpArray on: #(6.0 7 8 9)) at: 3) equals: 8.0
]

{ #category : #tests }
KUtilsTest >> testNpArrayAtCollection [
	self assert: ((KNpArray on: #(6.0 7 8 9)) at: (2 to: 3)) equals: #(7.0 8.0)
]

{ #category : #tests }
KUtilsTest >> testNpArrayContents [
	self assert: (KNpArray on: #(1 2 3 4)) getContents equals: #(1.0 2.0 3.0 4.0)
]

{ #category : #tests }
KUtilsTest >> testNpArrayFromExpression1 [
	self assertInstanceClass: (KNpArray fromExpression: #(1 2 3 4)) name: 'ndarray'
]

{ #category : #tests }
KUtilsTest >> testNpArrayFromExpression2 [
	| arr |
	arr := #numpy asP3GI => #ones callWith: (Array with: 5).
	self assertInstanceClass: (KNpArray fromExpression: arr) name: 'ndarray'
]

{ #category : #tests }
KUtilsTest >> testNpArrayFromPharo [
	self assertInstanceClass: (KNpArray on: #(1 2 3 4)) name: 'ndarray'
]
