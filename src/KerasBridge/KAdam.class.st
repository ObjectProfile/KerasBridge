Class {
	#name : #KAdam,
	#superclass : #KOptimizer,
	#instVars : [
		'learningRate',
		'beta_1',
		'beta_2',
		'epsilon',
		'decay',
		'amsgrad'
	],
	#category : #'KerasBridge-Optimizers'
}

{ #category : #accessing }
KAdam class >> default [
	^ self new createObject
]

{ #category : #accessing }
KAdam class >> learningRate: aPositiveFloat [
	"Look at object initialize to know the range of the values"
	^ self new
			learningRate: aPositiveFloat;
			createObject
]

{ #category : #accessing }
KAdam class >> learningRate: aPositiveFloat beta_1: beta_1 beta_2: beta_2 epsilon: epsilon decay: decay [
	"Look at object initialize to know the range of the values"
	^ self 
		learningRate: aPositiveFloat 
		beta_1: beta_1 
		beta_2: beta_2 
		epsilon: epsilon 
		decay: decay 
		amsgrad: false
]

{ #category : #accessing }
KAdam class >> learningRate: aPositiveFloat beta_1: beta_1 beta_2: beta_2 epsilon: epsilon decay: decay amsgrad: boolean [
	"Look at object initialize to know the range of the values"
	^ self new
			learningRate: aPositiveFloat;
			beta_1: beta_1;
			beta_2: beta_2;
			epsilon: epsilon;
			decay: decay;
			amsgrad: boolean;
			createObject
]

{ #category : #accessing }
KAdam >> amsgrad [
	^ amsgrad
]

{ #category : #accessing }
KAdam >> amsgrad: anObject [
	amsgrad := anObject
]

{ #category : #accessing }
KAdam >> beta_1 [
	^ beta_1
]

{ #category : #accessing }
KAdam >> beta_1: anObject [
	beta_1 := anObject
]

{ #category : #accessing }
KAdam >> beta_2 [
	^ beta_2
]

{ #category : #accessing }
KAdam >> beta_2: anObject [
	beta_2 := anObject
]

{ #category : #'as yet unclassified' }
KAdam >> createObject [
	self 
		basicCreateObjectArgs: #()
		nameArgs: (Array 
						with: #lr -> learningRate
						with: #beta_1 -> beta_1
						with: #beta_2 -> beta_2
						with: #epsilon -> epsilon
						with: #decay -> decay
						with: #amsgrad -> amsgrad )
]

{ #category : #accessing }
KAdam >> decay [
	^ decay
]

{ #category : #accessing }
KAdam >> decay: anObject [
	decay := anObject
]

{ #category : #accessing }
KAdam >> epsilon [
	^ epsilon
]

{ #category : #accessing }
KAdam >> epsilon: anObject [
	epsilon := anObject
]

{ #category : #initialization }
KAdam >> initialize [
	super initialize.
	learningRate := 0.001. "float >= 0"
	beta_1 := 0.9. "float. 0 < beta_1 < 1. Generally close to 1."
	beta_2 := 0.999. "float. 0 < beta_2 < 1. Generally close to 1."
	epsilon := nil. "float >= 0. Fuzz factor. If nil, defaults to platform specific epsilon."
	decay := 0. "float >= 0. Learning rate decay over each update."
	amsgrad := false. "Whenever to aply the AMSGrad variant."
]

{ #category : #accessing }
KAdam >> learningRate [
	^ learningRate
]

{ #category : #accessing }
KAdam >> learningRate: anObject [
	learningRate := anObject
]

{ #category : #'as yet unclassified' }
KAdam >> pythonClass [
	^ #keras asP3GI => #optimizers => #Adam
]
