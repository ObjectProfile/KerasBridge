Class {
	#name : #KLayer,
	#superclass : #KObject,
	#traits : 'P3GCallable',
	#classTraits : 'P3GCallable classTrait',
	#instVars : [
		'isImmutable'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KLayer >> attemptMutate [
	self isImmutable ifTrue: [ (KChangeOnBuiltObjectError object: self) signal ].
]

{ #category : #'as yet unclassified' }
KLayer >> attemptMutate: aBlock [
	self isImmutable ifTrue: [ (KChangeOnBuiltObjectError object: self) signal ].
	self isCreated ifTrue: [ aBlock cull: KCF ]
]

{ #category : #'as yet unclassified' }
KLayer >> createPythonTensorExpression: inputTensor [
	^ (self callWith: (Array with: inputTensor))
]

{ #category : #initialization }
KLayer >> initialize [
	super initialize.
	isImmutable := false
]

{ #category : #accessing }
KLayer >> isImmutable [
	^ isImmutable
]

{ #category : #accessing }
KLayer >> setImmutable [
	isImmutable := true
]

{ #category : #'as yet unclassified' }
KLayer >> tensor: aTensor [
	^ KSimpleTensor model: self tensor: aTensor
]
