Class {
	#name : #KElu,
	#superclass : #KActivation,
	#instVars : [
		'alpha'
	],
	#category : #'KerasBridge-Activations'
}

{ #category : #accessing }
KElu class >> alpha: aFloat [
	^ self new
		alpha: aFloat;
		yourself
]

{ #category : #testing }
KElu class >> pythonClass [
	^ 'keras' asP3GI => #activations => #elu
]

{ #category : #accessing }
KElu >> alpha [
	^ alpha
]

{ #category : #accessing }
KElu >> alpha: anObject [
	alpha := anObject
]

{ #category : #'as yet unclassified' }
KElu >> createPythonTensorExpression: inputTensor [
	^ (self class callWith: (Array with: inputTensor with: alpha))
]

{ #category : #accessing }
KElu >> initialize [
	super initialize.
	alpha := 1.0
]
