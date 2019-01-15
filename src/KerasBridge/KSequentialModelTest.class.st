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

{ #category : #tests }
KSequentialModelTest >> testTrainModel [
	| model history |
	model := KSequentialModel inputs: 2.
	model addLayer: (KDenseLayer neurons: 1).
	model compileLoss: KBinaryCrossentropy optimizer: KAdam default.
	history := (model fit: #((0 1)) labels: #((0.5)) epochs: 3) waitForValue.
	self assert: history class equals: KTrainingHistory.
	self assert: history loss size equals: 3
]
