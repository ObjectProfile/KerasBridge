Class {
	#name : #KNumpyArray,
	#superclass : #Object,
	#instVars : [
		'seqCollection'
	],
	#category : #'KerasBridge-Utils'
}

{ #category : #'instance creation' }
KNumpyArray class >> on: aSequenceableCollection [
	^ self new
		seqCollection: aSequenceableCollection;
		yourself
]

{ #category : #writing }
KNumpyArray >> isPythonGenerable [
	^ true
]

{ #category : #writing }
KNumpyArray >> isPythonValue [
	^ true
]

{ #category : #writing }
KNumpyArray >> pythonClass [
	^ #numpy asP3GI => #array
]

{ #category : #accessing }
KNumpyArray >> seqCollection [
	^ seqCollection
]

{ #category : #accessing }
KNumpyArray >> seqCollection: anObject [
	seqCollection := anObject
]

{ #category : #writing }
KNumpyArray >> writePython3On: aStream [
	(self pythonClass callWith: (Array with: seqCollection)) writePython3On: aStream
]
