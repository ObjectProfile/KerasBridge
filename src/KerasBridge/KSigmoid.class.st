Class {
	#name : #KSigmoid,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KSigmoid class >> pythonClass [
	^ 'keras' asP3GI => #activations => #sigmoid
]
