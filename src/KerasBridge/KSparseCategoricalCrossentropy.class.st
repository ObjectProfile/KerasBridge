Class {
	#name : #KSparseCategoricalCrossentropy,
	#superclass : #KLossFunction,
	#category : #'KerasBridge-LossFunction'
}

{ #category : #testing }
KSparseCategoricalCrossentropy class >> pythonClass [
	^ #keras asP3GI => #losses => #sparse_categorical_crossentropy
]
