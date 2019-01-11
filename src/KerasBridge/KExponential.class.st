Class {
	#name : #KExponential,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KExponential class >> pythonClass [
	^ 'keras' asP3GI => #activations => #exponential
]
