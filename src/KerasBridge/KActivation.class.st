Class {
	#name : #KActivation,
	#superclass : #Object,
	#classTraits : 'PBPythonValueTrait + P3GCallable',
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KActivation class >> isPythonGenerable [
	^ true
]

{ #category : #testing }
KActivation class >> pythonClass [
	self subclassResponsibility
]

{ #category : #testing }
KActivation class >> pythonClassName [
	^ self pythonClass attributeIdentifier name
]

{ #category : #functional }
KActivation class >> tensor: aTensor [
	^ self new tensor: aTensor
]

{ #category : #testing }
KActivation class >> writePython3On: str [
	self pythonClass writePython3On: str
]

{ #category : #'as yet unclassified' }
KActivation >> createPythonTensorExpression: inputTensor [
	^ (self class callWith: (Array with: inputTensor))
]

{ #category : #testing }
KActivation >> isImmutable [
	^ true
]

{ #category : #'as yet unclassified' }
KActivation >> pythonClass [
	^ self class pythonClass
]

{ #category : #testing }
KActivation >> setImmutable [
]

{ #category : #'as yet unclassified' }
KActivation >> tensor: aTensor [
	^ KSimpleTensor model: self tensor: aTensor
]
