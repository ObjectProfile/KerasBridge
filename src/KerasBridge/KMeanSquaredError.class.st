Class {
	#name : #KMeanSquaredError,
	#superclass : #KLossFunction,
	#category : #'KerasBridge-LossFunction'
}

{ #category : #testing }
KMeanSquaredError class >> pythonClass [
	^ #keras asP3GI => #losses => #mean_squared_error
]
