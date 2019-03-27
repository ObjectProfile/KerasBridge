Class {
	#name : #KDenseLayersTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KDenseLayersTest >> testChangeDenseAfterImmutability [
	| layer |
	layer := KDenseLayer neurons: 10.
	self
		assertClass: (layer => #activation)
		name: 'linear'.
	layer setImmutable.
	self should: [ layer activation: KSoftmax ] raise: KChangeOnBuiltObjectError.
]

{ #category : #tests }
KDenseLayersTest >> testChangeDenseBeforeImmutability [
	| layer |
	layer := KDenseLayer neurons: 10.
	self
		assertClass: (layer => #activation)
		name: 'linear'.
	layer activation: KSoftmax.
	self
		assertClass: (layer => #activation)
		name: 'softmax'.
]

{ #category : #tests }
KDenseLayersTest >> testChangeKernelInitializer [
	| layer |
	layer := KDenseLayer neurons: 10.
	self
		assertInstanceClass: (layer => #kernel_initializer)
		name: 'VarianceScaling'.
	layer kernelInitializer: KIdentityInitializer.
	self
		assertInstanceClass: (layer => #kernel_initializer)
		name: 'Identity'.
]

{ #category : #tests }
KDenseLayersTest >> testChangeUnits [
	| layer |
	layer := KDenseLayer neurons: 10.
	self
		assertExpression: (layer => #units)
		equals: 10.
	layer numberOfNeurons: 20.
	self
		assertExpression: (layer => #units)
		equals: 20.
]

{ #category : #tests }
KDenseLayersTest >> testDefaultDenseLayer [
	| layer |
	layer := KDenseLayer neurons: 10.
	self
		assertExpression: (layer => #units)
		equals: 10.
	self
		assertClass: (layer => #activation)
		name: 'linear'.
]

{ #category : #tests }
KDenseLayersTest >> testDenseLayerWithActivation [
	| layer |
	layer := KDenseLayer neurons: 10 activation: KTanh.
	KCF << (layer => #units).
	self
		assert: KCF send waitForValue
		equals: 10.
	KCF << ((layer => #activation) => #__name__).
	self
		assert: KCF send waitForValue
		equals: 'tanh'.
]
