Class {
	#name : #KSoftplus,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KSoftplus class >> pythonClass [
	^ 'keras' asP3GI => #activations => #softplus
]
