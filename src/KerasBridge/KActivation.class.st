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

{ #category : #testing }
KActivation class >> writePython3On: str [
	self pythonClass writePython3On: str
]

{ #category : #'as yet unclassified' }
KActivation >> createPythonTensorExpression: inputTensor [
	^ (self class callWith: (Array with: inputTensor))
]

{ #category : #'as yet unclassified' }
KActivation >> pythonClass [
	^ self class pythonClass
]

{ #category : #'as yet unclassified' }
KActivation >> tensor: aTensor [
	^ KSimpleTensor model: self tensor: aTensor
]
