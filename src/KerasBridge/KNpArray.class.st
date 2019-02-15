Class {
	#name : #KNpArray,
	#superclass : #KObject,
	#category : #'KerasBridge-Utils'
}

{ #category : #'instance creation' }
KNpArray class >> new [
	(KWrongConstructor cls: self) signal
]
