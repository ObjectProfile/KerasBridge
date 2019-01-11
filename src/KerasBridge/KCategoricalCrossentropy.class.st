Class {
	#name : #KCategoricalCrossentropy,
	#superclass : #KLossFunction,
	#category : #'KerasBridge-LossFunction'
}

{ #category : #testing }
KCategoricalCrossentropy class >> pythonClass [
	^ #keras asP3GI => #losses => #categorical_crossentropy
]
