Class {
	#name : #KSequentialModel,
	#superclass : #KModel,
	#category : #'KerasBridge-Model'
}

{ #category : #'as yet unclassified' }
KSequentialModel >> createObject [
	self basicCreateObject
]

{ #category : #'as yet unclassified' }
KSequentialModel >> pythonClass [
	^ 'keras' asP3GI => #models => #Sequential
]
