Class {
	#name : #KDenseLayer,
	#superclass : #KLayer,
	#instVars : [
		'numberOfNeurons',
		'activation'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KDenseLayer class >> neurons: number [
	^ self neurons: number activation: nil
]

{ #category : #'as yet unclassified' }
KDenseLayer class >> neurons: number activation: activation [
	^ self new
		numberOfNeurons: number;
		activation: activation;
		createObject
]

{ #category : #'as yet unclassified' }
KDenseLayer class >> size: numberOfNeurons [
	^ self neurons: numberOfNeurons
]

{ #category : #accessing }
KDenseLayer >> activation [
	^ activation
]

{ #category : #accessing }
KDenseLayer >> activation: anObject [
	activation := anObject
]

{ #category : #'as yet unclassified' }
KDenseLayer >> createObject [
	self 
		basicCreateObjectArgs: (Array with: numberOfNeurons)
		nameArgs: (Array with: #activation -> activation ) asDictionary
]

{ #category : #accessing }
KDenseLayer >> numberOfNeurons [
	^ numberOfNeurons
]

{ #category : #accessing }
KDenseLayer >> numberOfNeurons: anObject [
	numberOfNeurons := anObject
]

{ #category : #'as yet unclassified' }
KDenseLayer >> pythonClass [
	^ 'keras' asP3GI => #layers => #Dense
]
