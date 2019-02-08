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
	self attemptMutate: [ :cf | cf append: self => #activation <- anObject ].
	activation := anObject
]

{ #category : #'as yet unclassified' }
KDenseLayer >> createObject [
	self 
		basicCreateObjectArgs: (Array with: numberOfNeurons)
		nameArgs: (Array 
						with: #activation -> activation
						with: #kernel_initializer -> kernelInitializer ) asDictionary
]

{ #category : #accessing }
KDenseLayer >> initialize [
	super initialize.
	kernelInitializer := KGlorotUniform
]

{ #category : #accessing }
KDenseLayer >> kernelInitializer [
	^ kernelInitializer
]

{ #category : #accessing }
KDenseLayer >> kernelInitializer: anInitializer [
	self attemptMutate: [ :cf | cf append: self => #kernel_initializer <- anInitializer ].
	kernelInitializer := anInitializer
]

{ #category : #accessing }
KDenseLayer >> numberOfNeurons [
	^ numberOfNeurons
]

{ #category : #accessing }
KDenseLayer >> numberOfNeurons: anInteger [
	self attemptMutate: [ :cf | cf append: self => #units <- anInteger ].
	numberOfNeurons := anInteger
]

{ #category : #'as yet unclassified' }
KDenseLayer >> pythonClass [
	^ 'keras' asP3GI => #layers => #Dense
]
