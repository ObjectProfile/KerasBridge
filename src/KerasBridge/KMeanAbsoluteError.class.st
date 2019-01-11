Class {
	#name : #KMeanAbsoluteError,
	#superclass : #KLossFunction,
	#category : #'KerasBridge-LossFunction'
}

{ #category : #testing }
KMeanAbsoluteError class >> pythonClass [
	^ #keras asP3GI => #losses => #mean_absolute_error
]
