Class {
	#name : #KBinaryCrossentropy,
	#superclass : #KLossFunction,
	#category : #'KerasBridge-LossFunction'
}

{ #category : #testing }
KBinaryCrossentropy class >> pythonClass [
	^ #keras asP3GI => #losses => #binary_crossentropy
]
