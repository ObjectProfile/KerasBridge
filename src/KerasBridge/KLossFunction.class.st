Class {
	#name : #KLossFunction,
	#superclass : #KObject,
	#classTraits : 'PBPythonValueTrait',
	#category : #'KerasBridge-LossFunction'
}

{ #category : #testing }
KLossFunction class >> pythonClass [
	self subclassResponsibility
]

{ #category : #testing }
KLossFunction class >> writePython3On: str [
	self pythonClass writePython3On: str
]
