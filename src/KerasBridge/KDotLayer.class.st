Class {
	#name : #KDotLayer,
	#superclass : #KMergeLayer,
	#instVars : [
		'axes',
		'normalize'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KDotLayer class >> axes: listOfIntegers [
	listOfIntegers size < 2 ifTrue: [ ^ self axis: listOfIntegers first ].
	^ self new
		axes: listOfIntegers;
		createObject
]

{ #category : #'as yet unclassified' }
KDotLayer class >> axes: integerOrListOfIntegers normalize: boolean [
	^ self new
		axes: integerOrListOfIntegers;
		normalize: boolean;
		createObject
]

{ #category : #'as yet unclassified' }
KDotLayer class >> axis: integer [
	^ self new
		axes: integer;
		createObject
]

{ #category : #'as yet unclassified' }
KDotLayer class >> axis: integer normalize: boolean [
	^ self new
		axes: integer;
		normalize: boolean;
		createObject
]

{ #category : #accessing }
KDotLayer >> axes [
	^ axes
]

{ #category : #accessing }
KDotLayer >> axes: anObject [
	axes := anObject
]

{ #category : #'as yet unclassified' }
KDotLayer >> createObject [
	self 
		basicCreateObjectArgs: (Array with: axes) 
		nameArgs: (Array with: #normalize -> normalize)
]

{ #category : #initialization }
KDotLayer >> initialize [
	super initialize.
	normalize := false
]

{ #category : #accessing }
KDotLayer >> normalize [
	^ normalize
]

{ #category : #accessing }
KDotLayer >> normalize: anObject [
	normalize := anObject
]

{ #category : #'as yet unclassified' }
KDotLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Dot
]
