Class {
	#name : #KTensorTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #tests }
KTensorTest >> assertTensor: tensor shape: aShape [
	self cf << (tensor => #shape => #as_list callWith: #()).
	self assert: self cf send waitForValue equals: aShape
]

{ #category : #tests }
KTensorTest >> inputTensor [
	^ KInputTensor shape: #(3)
]

{ #category : #tests }
KTensorTest >> testActivationEluTensor [
	| tensor activation |
	activation := KElu alpha: 0.8.
	tensor := activation tensor: self inputTensor.
	self assertInstanceClass: tensor name: 'Tensor'.
	self assert: tensor model equals: activation.
	self assertTensor: tensor shape: #(nil 3)
]

{ #category : #tests }
KTensorTest >> testActivationTensor [
	| tensor activation |
	activation := KSoftmax new.
	tensor := activation tensor: self inputTensor.
	self assertInstanceClass: tensor name: 'Tensor'.
	self assert: tensor model equals: activation.
	self assertTensor: tensor shape: #(nil 3)
]

{ #category : #tests }
KTensorTest >> testDenseTensor [
	| tensor layer |
	layer := KDenseLayer neurons: 20.
	tensor := layer tensor: self inputTensor.
	self assertInstanceClass: tensor name: 'Tensor'.
	self assert: tensor model equals: layer.
	self assertTensor: tensor shape: #(nil 20)
]

{ #category : #tests }
KTensorTest >> testInputTensor [
	| tensor |
	tensor := self inputTensor.
	self assertInstanceClass: tensor name: 'Tensor'.
	self assertTensor: tensor shape: #(nil 3)
]
