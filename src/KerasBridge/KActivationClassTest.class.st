Class {
	#name : #KActivationClassTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #asserting }
KActivationClassTest >> assertActivation: activationClass name: aName [
	KCF << (activationClass => #__name__).
	self assert: KCF send waitForValue equals: aName
]

{ #category : #tests }
KActivationClassTest >> testElu [
	self assertActivation: KElu name: 'elu'
]

{ #category : #tests }
KActivationClassTest >> testExponential [
	self assertActivation: KExponential name: 'exponential'
]

{ #category : #tests }
KActivationClassTest >> testLinear [
	self assertActivation: KLinear name: 'linear'
]

{ #category : #tests }
KActivationClassTest >> testRelu [
	self assertActivation: KRelu name: 'relu'
]

{ #category : #tests }
KActivationClassTest >> testSelu [
	self assertActivation: KSelu name: 'selu'
]

{ #category : #tests }
KActivationClassTest >> testSigmoid [
	self assertActivation: KSigmoid name: 'sigmoid'
]

{ #category : #tests }
KActivationClassTest >> testSoftmax [
	self assertActivation: KSoftmax name: 'softmax'
]

{ #category : #tests }
KActivationClassTest >> testSoftplus [
	self assertActivation: KSoftplus name: 'softplus'
]

{ #category : #tests }
KActivationClassTest >> testTanh [
	self assertActivation: KTanh name: 'tanh'
]
