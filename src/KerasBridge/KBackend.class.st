Class {
	#name : #KBackend,
	#superclass : #Object,
	#traits : 'PBPythonValueTrait + P3GCallable',
	#classTraits : 'PBPythonValueTrait classTrait + P3GCallable classTrait',
	#instVars : [
		'backendName'
	],
	#category : #'KerasBridge-Bridge'
}

{ #category : #functions }
KBackend class >> eval: kVariable [
	^ (self fun: #eval) callWith: (Array with: kVariable)
]

{ #category : #'instance creation' }
KBackend class >> fun: backendName [
	^ self new
		backendName: backendName;
		yourself
]

{ #category : #functions }
KBackend class >> variable: aNumpyArray [
	^ (self fun: #variable) callWith: (Array with: aNumpyArray)
]

{ #category : #accessing }
KBackend >> backendName [
	^ backendName
]

{ #category : #accessing }
KBackend >> backendName: anObject [
	backendName := anObject
]

{ #category : #writing }
KBackend >> backendPackage [
	^ #keras asP3GI => #backend
]

{ #category : #writing }
KBackend >> isPythonGenerable [
	^ true
]

{ #category : #writing }
KBackend >> writePython3On: aStream [
	(self backendPackage => self backendName) writePython3On: aStream
]
