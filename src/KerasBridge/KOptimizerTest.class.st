Class {
	#name : #KOptimizerTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KOptimizerTest >> testDefaultAdam [
	KCF << ((#type asP3GI callWith: (Array with: KAdam default)) => #__name__).
	self
		assert: KCF send waitForValue
		equals: 'Adam'
]

{ #category : #tests }
KOptimizerTest >> testDefaultRMSProp [
	self assertInstanceClass: KRMSprop default name: 'RMSprop'
]

{ #category : #tests }
KOptimizerTest >> testDefaultSGD [
	self assertInstanceClass: KSGD default name: 'SGD'
]
