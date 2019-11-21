Class {
	#name : #Keras,
	#superclass : #PBApplication,
	#category : #'KerasBridge-Bridge'
}

{ #category : #initialization }
Keras >> addNumpyMappingFor: aSymbol [
	self addMapping: #numpy asP3GI => aSymbol to: self convertNumpyLambda.	
]

{ #category : #initialization }
Keras >> addNumpyMappings [
	| types |
	types := #(bool_ byte ubyte short ushort intc uintc int_ uint longlong ulonglong half float16 single double longdouble csingle cdouble clongdouble int8 int16 int32 int64 uint8 uint16 uint32 uint64 intp uintp float32 float64 float_ complex64 complex128 complex_).
	types do: [ :type | self addNumpyMappingFor: type ]
]

{ #category : #accessing }
Keras >> commandFactory [
	^ KCF
]

{ #category : #initialization }
Keras >> convertNumpyLambda [
	^ P3GLambda 
				argument: #x asP3GI 
				expression: (#x asP3GI => #item callWith: #())
]

{ #category : #accessing }
Keras >> module [
	^ #keras asP3GI
]

{ #category : #initialization }
Keras >> postInitialization [
	self commandFactory << (#numpy asP3GI import).
	self commandFactory << (#keras asP3GI import).
	self commandFactory << (#pharo_keras_hooks asP3GI import).
	self addNumpyMappings.
]
