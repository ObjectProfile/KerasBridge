Class {
	#name : #KTrainingHistory,
	#superclass : #Object,
	#category : #'KerasBridge-Utils'
}

{ #category : #'as yet unclassified' }
KTrainingHistory class >> model: aModel history: pyHistory [
	| history metrics |
	Transcript show: 'LOOOL'.
	history := self new.
	metrics := (Array with: aModel lossFunction) , aModel metrics.
	self halt.
	history 
		epochsMetrics: (metrics collect: [ :metric | 
									metric -> (pyHistory at: metric metricTag) ]) asDictionary.
	^ history
]
