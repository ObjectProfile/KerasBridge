Class {
	#name : #KCategoricalAccuracy,
	#superclass : #KMetric,
	#category : #'KerasBridge-Metrics'
}

{ #category : #testing }
KCategoricalAccuracy class >> pythonClass [
	^ #keras asP3GI => #metrics => #categorical_accuracy
]
