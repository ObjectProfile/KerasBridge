Class {
	#name : #KBinaryAccuracy,
	#superclass : #KMetric,
	#category : #'KerasBridge-Metrics'
}

{ #category : #testing }
KBinaryAccuracy class >> pythonClass [
	^ #keras asP3GI => #metrics => #binary_accuracy
]
