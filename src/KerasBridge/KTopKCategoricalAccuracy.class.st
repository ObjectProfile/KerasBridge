Class {
	#name : #KTopKCategoricalAccuracy,
	#superclass : #KMetric,
	#category : #'KerasBridge-Metrics'
}

{ #category : #testing }
KTopKCategoricalAccuracy class >> pythonClass [
	^ #keras asP3GI => #metrics => #top_k_categorical_accuracy
]
