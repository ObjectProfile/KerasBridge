Class {
	#name : #KActivationLayer,
	#superclass : #KLayer,
	#instVars : [
		'activation'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #accessing }
KActivationLayer class >> activation: activationFunction [
	^ self new
		activation: activationFunction;
		createObject
]

{ #category : #accessing }
KActivationLayer >> activation [
	^ activation
]

{ #category : #accessing }
KActivationLayer >> activation: anObject [
	activation := anObject
]

{ #category : #'as yet unclassified' }
KActivationLayer >> createObject [
	self 
		basicCreateObjectArgs: (Array with: activation)
]

{ #category : #'as yet unclassified' }
KActivationLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Activation
]
