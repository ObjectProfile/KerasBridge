Class {
	#name : #KSoftmax,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KSoftmax class >> pythonClass [
	^ 'keras' asP3GI => #activations => #softmax
]
