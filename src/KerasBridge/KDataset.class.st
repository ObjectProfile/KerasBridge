Class {
	#name : #KDataset,
	#superclass : #Object,
	#category : #'KerasBridge-Datasets'
}

{ #category : #'private protocol' }
KDataset class >> getData [
	self subclassResponsibility
]
