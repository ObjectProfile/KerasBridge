Class {
	#name : #KSGD,
	#superclass : #KOptimizer,
	#instVars : [
		'learningRate',
		'momentum',
		'decay',
		'nesterov'
	],
	#category : #'KerasBridge-Optimizers'
}

{ #category : #'as yet unclassified' }
KSGD class >> learningRate: aPositiveFloat [
	"Look at object initialize to know the range of the values"
	^ self new
			learningRate: aPositiveFloat;
			ensureCreateObject
]

{ #category : #'as yet unclassified' }
KSGD class >> learningRate: aPositiveFloat momentum: momentum decay: decay nesterov: boolean [
	"Look at object initialize to know the range of the values"
	^ self new
			learningRate: aPositiveFloat;
			momentum: momentum;
			decay: decay;
			nesterov: boolean;
			ensureCreateObject
]

{ #category : #initialization }
KSGD >> createObject [
	self 
		basicCreateObjectArgs: #()
		nameArgs: (Array 
						with: #lr -> learningRate
						with: #momentum -> momentum
						with: #decay -> decay
						with: #nesterov -> nesterov)
]

{ #category : #accessing }
KSGD >> decay [
	^ decay
]

{ #category : #accessing }
KSGD >> decay: anObject [
	decay := anObject
]

{ #category : #initialization }
KSGD >> initialize [
	super initialize.
	learningRate := 0.001. "float >= 0"
	momentum := 0. "float >= 0. Parameter that accelerates SGD in the relevant direction and dampens oscillations."
	decay := 0. "float >= 0. Learning rate decay over each update."
	nesterov := false. "boolean. Whether to apply Nesterov momentum"
]

{ #category : #accessing }
KSGD >> learningRate [
	^ learningRate
]

{ #category : #accessing }
KSGD >> learningRate: anObject [
	learningRate := anObject
]

{ #category : #accessing }
KSGD >> momentum [
	^ momentum
]

{ #category : #accessing }
KSGD >> momentum: anObject [
	momentum := anObject
]

{ #category : #accessing }
KSGD >> nesterov [
	^ nesterov
]

{ #category : #accessing }
KSGD >> nesterov: anObject [
	nesterov := anObject
]

{ #category : #'as yet unclassified' }
KSGD >> pythonClass [
	^ #keras asP3GI => #optimizers => #SGD
]
