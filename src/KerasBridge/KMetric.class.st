Class {
	#name : #KMetric,
	#superclass : #KObject,
	#classTraits : 'PBPythonValueTrait',
	#category : #'KerasBridge-Metrics'
}

{ #category : #testing }
KMetric class >> pythonClass [
	self subclassResponsibility
]

{ #category : #testing }
KMetric class >> writePython3On: str [
	self pythonClass writePython3On: str
]
