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

{ #category : #tests }
KFunctionalModelTest >> testSimpleModelWith2Inputs2Outputs [
	| input1 input2 layer output1 output2 model |
	input1 := KInputTensor shape: #(2).
	input2 := KInputTensor shape: #(1).
	layer := KActivationLayer activation: KLinear.
	output1 := layer tensor: input1.
	output2 := layer tensor: input2.
	model := KFunctionalModel 
					inputs: (Array with: input1 with: input2) 
					outputs: (Array with: output1 with: output2).
	model compileLoss: KMeanSquaredError optimizer: KAdam default.
	self 
		assert: (model predictSingleValue: #((1 2)(3))) waitForValue
		equals: #((1.0 2.0)(3.0))
]
