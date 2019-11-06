Class {
	#name : #KRMSprop,
	#superclass : #KOptimizer,
	#instVars : [
		'learningRate',
		'rho',
		'epsilon',
		'decay'
	],
	#category : #'KerasBridge-Optimizers'
}

{ #category : #'as yet unclassified' }
KRMSprop >> createObject [
	self 
		basicCreateObjectArgs: #()
		nameArgs: (Array 
						with: #lr -> learningRate
						with: #rho -> rho
						with: #epsilon -> epsilon
						with: #decay -> decay)
]

{ #category : #accessing }
KRMSprop >> decay [
	^ decay
]

{ #category : #accessing }
KRMSprop >> decay: anObject [
	decay := anObject
]

{ #category : #accessing }
KRMSprop >> epsilon [
	^ epsilon
]

{ #category : #accessing }
KRMSprop >> epsilon: anObject [
	epsilon := anObject
]

{ #category : #initialization }
KRMSprop >> initialize [
	super initialize.
	learningRate := 0.001. "float >= 0"
	rho := 0.9. "rho >= 0"
	epsilon := KBackend callFun: #epsilon. "float >= 0. Fuzz factor."
	decay := 0. "float >= 0. Learning rate decay over each update."
]

{ #category : #accessing }
KRMSprop >> learningRate [
	^ learningRate
]

{ #category : #accessing }
KRMSprop >> learningRate: anObject [
	learningRate := anObject
]

{ #category : #'as yet unclassified' }
KRMSprop >> pythonClass [
	^ #keras asP3GI => #optimizers => #RMSprop
]

{ #category : #accessing }
KRMSprop >> rho [
	^ rho
]

{ #category : #accessing }
KRMSprop >> rho: anObject [
	rho := anObject
]
