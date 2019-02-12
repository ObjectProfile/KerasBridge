Class {
	#name : #KConcatenateLayer,
	#superclass : #KMergeLayer,
	#instVars : [
		'axis'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #'accessing structure variables' }
KConcatenateLayer class >> axis: axis [
	^ self new
		axis: axis;
		createObject
]

{ #category : #accessing }
KConcatenateLayer >> axis [
	^ axis
]

{ #category : #accessing }
KConcatenateLayer >> axis: anObject [
	axis := anObject
]

{ #category : #'as yet unclassified' }
KConcatenateLayer >> createObject [
	self 
		basicCreateObjectArgs: #()
		nameArgs: (Array with: #axis -> axis)
]

{ #category : #initialization }
KConcatenateLayer >> initialize [
	super initialize.
	axis := -1
]

{ #category : #'as yet unclassified' }
KConcatenateLayer >> pythonClass [
	^ #keras asP3GI => #layers => #Concatenate
]
