Class {
	#name : #KChangeOnBuiltObjectError,
	#superclass : #KPharoError,
	#instVars : [
		'object'
	],
	#category : #'KerasBridge-Errors'
}

{ #category : #accessing }
KChangeOnBuiltObjectError class >> object: anObject [
	^ self new
		object: anObject;
		yourself
]

{ #category : #accessing }
KChangeOnBuiltObjectError >> messageText [
	messageText ifNotNil: [ ^ messageText ].
	^ 'Tried to change an instance of ' , object class name ,' that was already built.'
]

{ #category : #accessing }
KChangeOnBuiltObjectError >> object [
	^ object
]

{ #category : #accessing }
KChangeOnBuiltObjectError >> object: anObject [
	object := anObject
]
