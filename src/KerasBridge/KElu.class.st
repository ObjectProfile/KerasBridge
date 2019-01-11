Class {
	#name : #KElu,
	#superclass : #KActivation,
	#category : #'KerasBridge-Activations'
}

{ #category : #testing }
KElu class >> pythonClass [
	^ 'keras' asP3GI => #activations => #elu
]
