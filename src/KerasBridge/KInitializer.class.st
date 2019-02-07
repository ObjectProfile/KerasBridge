Class {
	#name : #KInitializer,
	#superclass : #Object,
	#traits : 'PBPythonValueTrait',
	#classTraits : 'PBPythonValueTrait classTrait + PBPythonValueTrait',
	#category : #'KerasBridge-Initializers'
}

{ #category : #testing }
KInitializer class >> isPythonGenerable [
	^ true
]

{ #category : #testing }
KInitializer class >> writePython3On: str [
	self new writePython3On: str
]

{ #category : #writing }
KInitializer >> buildPythonExpression [
	^ self pythonClass callWith: #()
]

{ #category : #testing }
KInitializer >> isPythonGenerable [
	^ true
]

{ #category : #testing }
KInitializer >> isPythonValue [
	^ true
]

{ #category : #writing }
KInitializer >> pythonClass [
	self subclassResponsibility
]

{ #category : #writing }
KInitializer >> writePython3On: str [
	self buildPythonExpression writePython3On: str
]
