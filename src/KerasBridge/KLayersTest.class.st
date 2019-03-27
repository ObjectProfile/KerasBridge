Class {
	#name : #KLayersTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KLayersTest >> testActivationLayer [
	| layer |
	layer := KActivationLayer activation: KTanh.
	KCF << ((layer => #activation) => #__name__).
	self
		assert: KCF send waitForValue
		equals: 'tanh'.
]

{ #category : #tests }
KLayersTest >> testBuiltBySequencialModel [
	| layer model |
	layer := KDenseLayer neurons: 10.
	self deny: layer isImmutable.
	model := KSequentialModel inputs: 2.
	model addLayer: layer.
	self assert: layer isImmutable
]

{ #category : #tests }
KLayersTest >> testBuiltByTensor [
	| layer |
	layer := KDenseLayer neurons: 10.
	self deny: layer isImmutable.
	layer tensor: (KInputTensor shape: #(3)).
	self assert: layer isImmutable
]

{ #category : #tests }
KLayersTest >> testNotBuilt [
	| layer |
	layer := KDenseLayer neurons: 10.
	self deny: layer isImmutable
]
