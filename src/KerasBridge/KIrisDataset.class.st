Class {
	#name : #KIrisDataset,
	#superclass : #KLocalDataset,
	#category : #'KerasBridge-Datasets'
}

{ #category : #'private protocol' }
KIrisDataset class >> attributes [
	^ #(
	'Sepal length in cm'
	'Sepal width in cm'
	'Petal length in cm'
	'Petal width in cm'
	'class'
	)
]

{ #category : #'as yet unclassified' }
KIrisDataset class >> classForIndex: index [
	^ self classes at: index
]

{ #category : #'private protocol' }
KIrisDataset class >> classes [
	^ #(
	'Iris-setosa'
	'Iris-versicolor'
	'Iris-virginica'
	)
]

{ #category : #'private protocol' }
KIrisDataset class >> description [
	^ 'Dataset of real flower features for classification. It contains 150 instances with 4 attributes with no missing values. There are 3 possible classes of 50 instances each.'
]

{ #category : #accessing }
KIrisDataset class >> filename [
	^ 'iris.csv'
]

{ #category : #'private protocol' }
KIrisDataset class >> numberOfAttributes [
	^ 4
]

{ #category : #'as yet unclassified' }
KIrisDataset class >> oneHotEncode: aName [
	^ ((1 to: self classes size) collect: [ :i | 0 ])
			at: (self classes indexOf: aName) put: 1;
			yourself
]

{ #category : #'as yet unclassified' }
KIrisDataset class >> postProcess: data [
	^ data collect: [ :row | | attributes labels |
		attributes := (row first: 4) collect: #asNumber.
		labels := self oneHotEncode: row last.
		attributes , labels ]
]
