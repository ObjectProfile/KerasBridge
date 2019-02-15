Class {
	#name : #KNpArray,
	#superclass : #KObject,
	#category : #'KerasBridge-Utils'
}

{ #category : #'instance creation' }
KNpArray class >> new [
	(KWrongConstructor cls: self) signal
]

{ #category : #'instance creation' }
KNpArray class >> on: pharoArray [
	| arrBinding |
	arrBinding := KCF bindingWrap: pharoArray.
	^ super new
			basicCreateObjectExpr: (#numpy asP3GI => #array callWith: (Array with: arrBinding));
			yourself.
]

{ #category : #'as yet unclassified' }
KNpArray >> createObject [
	(KWrongConstructor cls: self) signal
]

{ #category : #'as yet unclassified' }
KNpArray >> pythonClass [
	^ #numpy asP3GI => #array
]
