Class {
	#name : #KFunctionalModelTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KFunctionalModelTest >> testSimpleModel [
	| model input output |
	input := KInputTensor shape: #(3).
	output := (KActivationLayer activation: KLinear) tensor: input.
	model := KFunctionalModel input: input output: output.
	model compileLoss: KMeanSquaredError optimizer: KAdam default.
	self
		assert: (model predictSingleValue: #(1 3 2)) waitForValue
		equals: #(1.0 3.0 2.0)
]
