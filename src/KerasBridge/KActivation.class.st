Class {
	#name : #KActivation,
	#superclass : #KObject,
	#classTraits : 'PBPythonValueTrait + P3GCallable',
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KActivation class >> isPythonGenerable [
	^ true
]

{ #category : #'instance creation' }
KActivation class >> new [
	self error: 'Activation functions are not supposed to be instantiated for Sequential Models'
]

{ #category : #testing }
KActivation class >> pythonClass [
	self subclassResponsibility
]

{ #category : #testing }
KActivation class >> writePython3On: str [
	self pythonClass writePython3On: str
]

{ #category : #'as yet unclassified' }
KActivation >> pythonClass [
	^ self class pythonClass
]
