Class {
	#name : #KMergeLayersTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KMergeLayersTest >> testAddLayer [
	self assertInstanceClass: KAddLayer new name: 'Add'
]

{ #category : #tests }
KMergeLayersTest >> testUseAddLayer [
	| b1 b2 kvar1 kvar2 layerTensor |
	b1 := self cf bindingWrap: #(-1 2).
	b2 := self cf bindingWrap: #(3 4).
	kvar1 := KBackend variable: (KNumpyArray on: b1).
	kvar2 := KBackend variable: (KNumpyArray on: b2).
	layerTensor := KAddLayer new tensors: (Array with: kvar1 with: kvar2).
	self cfSend.
	self cf << ((KBackend eval: layerTensor) => #tolist callWith: #()).
	self 
		assert: self cfSend waitForValue
		equals: #(2.0 6.0)
]
