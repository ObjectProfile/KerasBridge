Class {
	#name : #KVirtualNumpyArray,
	#superclass : #Object,
	#traits : 'P3GAttributeAccess',
	#classTraits : 'P3GAttributeAccess classTrait',
	#instVars : [
		'seqCollection'
	],
	#category : #'KerasBridge-Utils'
}

{ #category : #'instance creation' }
KVirtualNumpyArray class >> on: aSequenceableCollection [
	^ self new
		seqCollection: aSequenceableCollection;
		yourself
]

{ #category : #writing }
KVirtualNumpyArray >> isPythonGenerable [
	^ true
]

{ #category : #writing }
KVirtualNumpyArray >> isPythonValue [
	^ true
]

{ #category : #writing }
KVirtualNumpyArray >> pythonClass [
	^ #numpy asP3GI => #array
]

{ #category : #accessing }
KVirtualNumpyArray >> seqCollection [
	^ seqCollection
]

{ #category : #accessing }
KVirtualNumpyArray >> seqCollection: anObject [
	seqCollection := anObject
]

{ #category : #writing }
KVirtualNumpyArray >> writePython3On: aStream [
	(self pythonClass callWith: (Array with: seqCollection)) writePython3On: aStream
]
