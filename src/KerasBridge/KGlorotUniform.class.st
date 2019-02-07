Class {
	#name : #KGlorotUniform,
	#superclass : #KInitializer,
	#instVars : [
		'seed'
	],
	#category : #'KerasBridge-Initializers'
}

{ #category : #'instance creation' }
KGlorotUniform class >> seed: aSeed [
	^ self new
		seed: aSeed;
		yourself
]

{ #category : #initialization }
KGlorotUniform >> buildPythonExpression [
	^ self pythonClass callWith: #() with: (Array with: (#seed -> seed)) asDictionary
]

{ #category : #initialization }
KGlorotUniform >> initialize [
	super initialize.
	seed := nil
]

{ #category : #writing }
KGlorotUniform >> pythonClass [
	^ #keras asP3GI => #initializers => #glorot_uniform
]
