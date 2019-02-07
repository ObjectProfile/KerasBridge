Class {
	#name : #KDenseLayer,
	#superclass : #KLayer,
	#instVars : [
		'numberOfNeurons',
		'activation',
		'kernelInitializer'
	],
	#category : #'KerasBridge-Layers'
}

{ #category : #'as yet unclassified' }
KDenseLayer class >> neurons: number [
	^ self new
		numberOfNeurons: number;
		ensureCreateObject
]

{ #category : #'as yet unclassified' }
KDenseLayer class >> neurons: number activation: activation [
	^ self new
		numberOfNeurons: number;
		activation: activation;
		ensureCreateObject
]

{ #category : #'as yet unclassified' }
KDenseLayer class >> neurons: number activation: activation kernelInitializer: kernelInitializer [
	^ self new
		numberOfNeurons: number;
		activation: activation;
		kernelInitializer: kernelInitializer;
		ensureCreateObject
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
KDenseLayer >> kernelInitializer [
	^ kernelInitializer
]

{ #category : #accessing }
KDenseLayer >> kernelInitializer: anObject [
	kernelInitializer := anObject
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
