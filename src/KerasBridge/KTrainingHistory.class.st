Class {
	#name : #KTrainingHistory,
	#superclass : #Object,
	#instVars : [
		'model',
		'epochMetrics'
	],
	#category : #'KerasBridge-Utils'
}

{ #category : #'as yet unclassified' }
KTrainingHistory class >> model: aModel history: rawHistory [
	| history dict |
	history := self new.
	history model: aModel.
	dict := Dictionary new.
	rawHistory associationsDo: [ :assoc | 
		dict 
			at: (self resolveMetric: assoc key forModel: aModel )
			put: assoc value ].
	history epochMetrics: dict.
	^ history
]

{ #category : #'as yet unclassified' }
KTrainingHistory class >> resolveMetric: aMetricName forModel: aModel [
	aMetricName = 'loss' ifTrue: [ ^ aModel lossFunction ].
	^ aModel metrics 
		detect: [ :metric | metric pythonClassName = aMetricName ]
		ifNone: [ aMetricName ]
]

{ #category : #accessing }
KTrainingHistory >> epochMetrics [
	^ epochMetrics
]

{ #category : #accessing }
KTrainingHistory >> epochMetrics: anObject [
	epochMetrics := anObject
]

{ #category : #'as yet unclassified' }
KTrainingHistory >> forMetric: aMetric [
	^ epochMetrics at: aMetric
]

{ #category : #'as yet unclassified' }
KTrainingHistory >> loss [
	^ self forMetric: model lossFunction
]

{ #category : #accessing }
KTrainingHistory >> model [
	^ model
]

{ #category : #accessing }
KTrainingHistory >> model: anObject [
	model := anObject
]
