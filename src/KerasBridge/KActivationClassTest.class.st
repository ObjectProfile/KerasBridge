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
KActivationClassTest >> testTanh [
	self assertActivation: KTanh name: 'tanh'
]
