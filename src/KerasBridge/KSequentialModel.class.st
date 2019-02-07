Class {
	#name : #KSequentialModel,
	#superclass : #KModel,
	#instVars : [
		'layers'
	],
	#category : #'KerasBridge-Model'
}

{ #category : #accessing }
KSequentialModel class >> inputs: aNumberOfInputs [
	^ self new 
		ensureCreateObject;
		addLayer: (KInputLayer numberOfInputs: aNumberOfInputs);
		yourself
]

{ #category : #adding }
KSequentialModel >> addLayer: aLayer [
	aLayer setImmutable.
	layers add: aLayer.
	KCF << (self => #add callWith: (Array with: aLayer))
]

{ #category : #'as yet unclassified' }
KSequentialModel >> createObject [
	self basicCreateObject
]

{ #category : #initialization }
KSequentialModel >> initialize [
	super initialize.
	layers := OrderedCollection new
]

{ #category : #'as yet unclassified' }
KSequentialModel >> pythonClass [
	^ 'keras' asP3GI => #models => #Sequential
]
