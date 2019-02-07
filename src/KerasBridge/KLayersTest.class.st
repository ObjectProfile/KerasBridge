Class {
	#name : #KLayersTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KLayersTest >> testActivationLayer [
	| layer |
	layer := KActivationLayer activation: KTanh.
	KCF << ((layer pythonVariable => #activation) => #__name__).
	self
		assert: KCF send waitForValue
		equals: 'tanh'.
]

{ #category : #tests }
KLayersTest >> testBuiltBySequencialModel [
	| layer model |
	layer := KDenseLayer neurons: 10.
	self deny: layer isBuilt.
	model := KSequentialModel inputs: 2.
	model addLayer: layer.
	self assert: layer isBuilt
]

{ #category : #tests }
KLayersTest >> testBuiltByTensor [
	| layer |
	layer := KDenseLayer neurons: 10.
	self deny: layer isBuilt.
	layer tensor: (KInputTensor shape: #(3)).
	self assert: layer isBuilt
]

{ #category : #tests }
KLayersTest >> testDefaultDenseLayer [
	| layer |
	layer := KDenseLayer neurons: 10.
	KCF << (layer pythonVariable => #units).
	self
		assert: KCF send waitForValue
		equals: 10.
	KCF << ((layer pythonVariable => #activation) => #__name__).
	self
		assert: KCF send waitForValue
		equals: 'linear'.
]

{ #category : #tests }
KLayersTest >> testDenseLayerWithActivation [
	| layer |
	layer := KDenseLayer neurons: 10 activation: KTanh.
	KCF << (layer pythonVariable => #units).
	self
		assert: KCF send waitForValue
		equals: 10.
	KCF << ((layer => #activation) => #__name__).
	self
		assert: KCF send waitForValue
		equals: 'tanh'.
]

{ #category : #tests }
KLayersTest >> testNotBuilt [
	| layer |
	layer := KDenseLayer neurons: 10.
	self deny: layer isBuilt
]
