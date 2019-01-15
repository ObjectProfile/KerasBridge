Class {
	#name : #KSequentialModelTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KSequentialModelTest >> testCompileModel [
	| model |
	model := KSequentialModel inputs: 10.
	KCF << (model => #_is_compiled).
	self deny: KCF send waitForValue.
	model compileLoss: KBinaryCrossentropy optimizer: KAdam default.
	KCF << (model => #_is_compiled).
	self assert: KCF send waitForValue.
]

{ #category : #tests }
KSequentialModelTest >> testEmptyModel [
	| model |
	model := KSequentialModel new.
	model createObject.
	KCF << (#len asP3GI callWith: (Array with: model pythonVariable => #_layers)).
	self
		assert: KCF send waitForValue
		equals: 0
]

{ #category : #tests }
KSequentialModelTest >> testInputLayer [
	| model |
	model := KSequentialModel inputs: 10.
	KCF << (#len asP3GI callWith: (Array with: model pythonVariable => #_layers)).
	self
		assert: KCF send waitForValue
		equals: 1
]
