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
	self commandFactory << (#numpy asP3GI import).
	self commandFactory << (#keras asP3GI import).
	self commandFactory << (#pharo_keras_hooks asP3GI import).
]
