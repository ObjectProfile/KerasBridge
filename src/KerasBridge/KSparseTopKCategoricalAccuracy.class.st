Class {
	#name : #KSparseTopKCategoricalAccuracy,
	#superclass : #KMetric,
	#category : #'KerasBridge-Metrics'
}

{ #category : #testing }
KSparseTopKCategoricalAccuracy class >> pythonClass [
	^ #keras asP3GI => #metrics => #sparse_top_k_categorical_accuracy
]
