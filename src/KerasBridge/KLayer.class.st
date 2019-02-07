Class {
	#name : #KLayer,
	#superclass : #KObject,
	#traits : 'P3GCallable',
	#classTraits : 'P3GCallable classTrait',
	#instVars : [
		'isBuilt'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KLayer >> createPythonTensorExpression: inputTensor [
	^ (self callWith: (Array with: inputTensor))
]

{ #category : #initialization }
KLayer >> initialize [
	super initialize.
	isBuilt := false
]

{ #category : #accessing }
KLayer >> isImmutable [
	^ isBuilt
]

{ #category : #accessing }
KLayer >> setImmutable [
	isBuilt := true
]

{ #category : #'as yet unclassified' }
KLayer >> tensor: aTensor [
	^ KSimpleTensor model: self tensor: aTensor
]
