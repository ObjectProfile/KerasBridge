Class {
	#name : #KSparseCategoricalAccuracy,
	#superclass : #KMetric,
	#category : #'KerasBridge-Metrics'
}

{ #category : #testing }
KSparseCategoricalAccuracy class >> pythonClass [
	^ #keras asP3GI => #metrics => #sparse_categorical_accuracy
]
