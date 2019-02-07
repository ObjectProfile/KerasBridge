Class {
	#name : #KIdentityInitializer,
	#superclass : #KInitializer,
	#category : #'KerasBridge-Initializers'
}

{ #category : #writing }
KIdentityInitializer >> pythonClass [
	^ #keras asP3GI => #initializers => #Identity
]
