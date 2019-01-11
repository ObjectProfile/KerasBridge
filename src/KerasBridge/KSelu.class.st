Class {
	#name : #KSelu,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KSelu class >> pythonClass [
	^ 'keras' asP3GI => #activations => #selu
]
