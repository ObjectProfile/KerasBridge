Class {
	#name : #KBackendTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KBackendTest >> testUseVariable [
	| binding kvar |
	binding := self cf bindingWrap: #((1 2)(3 4)).
	kvar := KBackend variable: (KNumpyArray on: binding).
	self cf << ((KBackend eval: kvar) => #tolist callWith: #()).
	self 
		assert: self cfSend waitForValue
		equals: #((1.0 2.0)(3.0 4.0))
]
