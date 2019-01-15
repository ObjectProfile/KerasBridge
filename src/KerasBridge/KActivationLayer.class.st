Class {
	#name : #KActivationLayer,
	#superclass : #KLayer,
	#instVars : [
		'activation'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #accessing }
KActivationLayer class >> activation: activationFunctionClass [
	^ self new
		activation: activationFunctionClass;
		createObject
]

{ #category : #accessing }
KActivationLayer >> activation [
	^ activation
]

{ #category : #accessing }
KActivationLayer >> activation: activationFunctionClass [
	self assert: activationFunctionClass isClass.
	activation := activationFunctionClass
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
