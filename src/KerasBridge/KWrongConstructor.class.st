Class {
	#name : #KWrongConstructor,
	#superclass : #KPharoError,
	#instVars : [
		'cls'
	],
	#category : #'KerasBridge-Errors'
}

{ #category : #accessing }
KWrongConstructor class >> cls: aClass [
	^ self new
		cls: aClass;
		yourself
]

{ #category : #accessing }
KWrongConstructor >> cls [
	^ cls
]

{ #category : #accessing }
KWrongConstructor >> cls: anObject [
	cls := anObject
]

{ #category : #accessing }
KWrongConstructor >> messageText [
	messageText ifNotNil: [ ^ messageText ].
	^ 'Tried to create an instance of ' , cls name ,' using the wrong constructor.'
]
