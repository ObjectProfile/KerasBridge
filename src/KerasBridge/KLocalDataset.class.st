Class {
	#name : #KLocalDataset,
	#superclass : #KDataset,
	#category : #'KerasBridge-Datasets'
}

{ #category : #'private protocol' }
KLocalDataset class >> datasetFileReference [
	^ Keras repositoryFileReference / 'datasets' / self filename
]

{ #category : #'private protocol' }
KLocalDataset class >> filename [
	self subclassResponsibility
]

{ #category : #'private protocol' }
KLocalDataset class >> getData [
	^ (self postProcess: self getRawData)
]

{ #category : #'private protocol' }
KLocalDataset class >> getRawData [
	^ (NeoCSVReader on: self datasetFileReference readStream) upToEnd
]

{ #category : #'as yet unclassified' }
KLocalDataset class >> getSplittedData: proportions [
	^ self split: self getData inProportions: proportions
]

{ #category : #'as yet unclassified' }
KLocalDataset class >> numberOfAttributes [
	self subclassResponsibility
]

{ #category : #'private protocol' }
KLocalDataset class >> postProcess: data [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
KLocalDataset class >> split: data inProportions: relativeProportions [
	| proportions shuffled lastIndex |
	proportions := relativeProportions collect: [ :i | (i * data size) asInteger ].
	proportions sum ~= data size ifTrue: [ 
		proportions at: 1 put: (data size - proportions allButFirst sum) ].
	shuffled := data shuffled.
	lastIndex := 1.
	^ (1 to: proportions size) collect: [ :i | | part |
		part := shuffled 
			copyFrom: lastIndex
			to: lastIndex + (proportions at: i) - 1.
		lastIndex := lastIndex + (proportions at: i).
		part ]
]

{ #category : #'as yet unclassified' }
KLocalDataset class >> splitDataAndLabels: data [
	^ Array 
		with: (data collect: [ :row | row first: self numberOfAttributes ])
		with: (data collect: [ :row | row allButFirst: self numberOfAttributes ])
]
