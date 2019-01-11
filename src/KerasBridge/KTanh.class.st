Class {
	#name : #KTanh,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KTanh class >> pythonClass [
	^ 'keras' asP3GI => #backend => #tanh
]
