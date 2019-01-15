Class {
	#name : #KLossFunction,
	#superclass : #KObject,
	#classTraits : 'PBPythonValueTrait',
	#category : #'KerasBridge-LossFunction'
}

{ #category : #'instance creation' }
KLossFunction class >> new [
	self error: 'Loss functions are not supposed to be instantiated'
]

{ #category : #testing }
KLossFunction class >> pythonClass [
	self subclassResponsibility
]

{ #category : #testing }
KLossFunction class >> writePython3On: str [
	self pythonClass writePython3On: str
]
