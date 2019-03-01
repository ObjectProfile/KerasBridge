Class {
	#name : #KExamples,
	#superclass : #Object,
	#category : #'KerasBridge-Examples'
}

{ #category : #examples }
KExamples class >> exampleStartStop [
	<example>
	| x y model |
	Keras start.
	x := #(#(0 0) #(0 1) #(1 0) #(1 1)).
   y := #((0) (1) (1) (0)).

   model := KSequentialModel inputs: 2.
   model addLayer: (KDenseLayer neurons: 8 activation: KTanh).
   model addLayer: (KDenseLayer neurons: 1).
   model addLayer: (KActivationLayer activation: KSigmoid).
   model 
       compileLoss: KBinaryCrossentropy 
       optimizer: KAdam default 
       metrics: { KBinaryAccuracy }.
   (model fit: x labels: y epochs: 700) waitForValue inspect.
	Keras stop.
]

{ #category : #examples }
KExamples class >> exampleXorSequentialModel [
	<example>
	| x y model |
	^ (Keras do: [ 
		x := #(#(0 0) #(0 1) #(1 0) #(1 1)).
    	y := #((0) (1) (1) (0)).

    	model := KSequentialModel inputs: 2.
    	model addLayer: (KDenseLayer neurons: 8 activation: KTanh).
    	model addLayer: (KDenseLayer neurons: 1).
    	model addLayer: (KActivationLayer activation: KSigmoid).
    	model 
      	  compileLoss: KBinaryCrossentropy 
      	  optimizer: KAdam default 
      	  metrics: { KBinaryAccuracy }.
    	(model fit: x labels: y epochs: 700) waitForValue ]) inspect
]
