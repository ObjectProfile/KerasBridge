Class {
	#name : #KRelu,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KRelu class >> pythonClass [
	^ 'keras' asP3GI => #activations => #relu
]
