Class {
	#name : #KInitializerTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KInitializerTest >> testDefaultDenseInitializer [
	| layer |
	layer := KDenseLayer neurons: 10.
	self assertInstanceClass: (layer => #kernel_initializer) name: 'VarianceScaling'.
	self assertExpression: (layer => #kernel_initializer => #scale) equals: 1.0.
	self assertExpression: (layer => #kernel_initializer => #mode) equals: 'fan_avg'.
	self assertExpression: (layer => #kernel_initializer => #distribution) equals: 'uniform'.
	self assertExpression: (layer => #kernel_initializer => #seed) equals: nil.
]

{ #category : #tests }
KInitializerTest >> testGlorotUniform [
	self assertInstanceClass: KGlorotUniform name: 'VarianceScaling'.
	self assertExpression: KGlorotUniform => #scale equals: 1.0.
	self assertExpression: KGlorotUniform => #mode equals: 'fan_avg'.
	self assertExpression: KGlorotUniform => #distribution equals: 'uniform'.
	self assertExpression: KGlorotUniform => #seed equals: nil.
]

{ #category : #tests }
KInitializerTest >> testIdentity [
	self assertInstanceClass: KIdentityInitializer name: 'Identity'
]
