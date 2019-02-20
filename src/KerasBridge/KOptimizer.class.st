Class {
	#name : #KOptimizer,
	#superclass : #KObject,
	#category : #'KerasBridge-Optimizers'
}

{ #category : #accessing }
KOptimizer class >> default [
	^ self new ensureCreateObject
]
