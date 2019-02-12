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
	^ self axes: (Array with: integer)
]

{ #category : #'as yet unclassified' }
KDotLayer class >> axis: integer normalize: boolean [
	^ self axes: (Array with: integer) normalize: boolean
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
	| paxes |
	"paxes is used because Dot doesn't receive a list with a single axis. It requires a single integer for a single axis and a list of size 2 or more for multiple axes."
	paxes :=axes size < 2 
		ifTrue: [ axes first ]
		ifFalse: [  axes ].
	self 
		basicCreateObjectArgs: (Array with: paxes) 
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
