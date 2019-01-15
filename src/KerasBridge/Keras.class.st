Class {
	#name : #Keras,
	#superclass : #PBApplication,
	#category : #'KerasBridge-Bridge'
}

{ #category : #accessing }
Keras >> commandFactory [
	^ KCF
]

{ #category : #accessing }
Keras >> postInitialization [
	KCF << (#numpy asP3GI import).
	KCF << (#keras asP3GI import).
	KCF send.
]
