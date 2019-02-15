Class {
	#name : #KBackendTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KBackendTest >> testUseVariable [
	| kvar |
	kvar := KBackend variable: (KNpArray on: #((1 2)(3 4))).
	self cf << ((KBackend eval: kvar) => #tolist callWith: #()).
	self 
		assert: self cfSend waitForValue
		equals: #((1.0 2.0)(3.0 4.0))
]

{ #category : #tests }
KBackendTest >> testUseVariableWithTensor [
	| kvar layerTensor |
	kvar := KBackend variable: (KNpArray on: #((-1 2)(3 -4))).
	layerTensor := (KActivationLayer activation: KRelu) tensor: kvar.
	self cf << ((KBackend eval: layerTensor) => #tolist callWith: #()).
	self 
		assert: self cfSend waitForValue
		equals: #((0.0 2.0)(3.0 0.0))
]
