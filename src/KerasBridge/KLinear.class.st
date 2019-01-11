Class {
	#name : #KLinear,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KLinear class >> pythonClass [
	^ 'keras' asP3GI => #activations => #linear
]
