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
	KCF << (#keras asP3GI import).
	KCF << 1.
	KCF send.
]
