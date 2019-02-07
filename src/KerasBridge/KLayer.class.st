Class {
	#name : #KLayer,
	#superclass : #KObject,
	#traits : 'P3GCallable',
	#classTraits : 'P3GCallable classTrait',
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KLayer >> createPythonTensorExpression: inputTensor [
	^ (self callWith: (Array with: inputTensor))
]

{ #category : #'as yet unclassified' }
KLayer >> tensor: aTensor [
	^ KSimpleTensor model: self tensor: aTensor
]
