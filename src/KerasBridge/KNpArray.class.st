Class {
	#name : #KNpArray,
	#superclass : #KObject,
	#category : #'KerasBridge-Utils'
}

{ #category : #'instance creation' }
KNpArray class >> fromExpression: pyExpr [
	| varName objExpr |
	varName := self newPythonVar.
	objExpr := #numpy asP3GI => #array 
									callWith: (Array with: pyExpr) 
									with: (Array with: #copy -> false) asDictionary.
	KCF << ((#registry callWith: #()) => #register_with_id 
					callWith: (Array with: objExpr with: varName name)).
	^ self fromPythonReference: varName
]

{ #category : #'instance creation' }
KNpArray class >> fromPythonReference: pythonVar [
	^ super new
			pythonVariable: pythonVar;
			yourself.
]

{ #category : #'instance creation' }
KNpArray class >> new [
	(KWrongConstructor cls: self) signal
]

{ #category : #'instance creation' }
KNpArray class >> on: pharoArray [
	| arrBinding |
	arrBinding := KCF bindingWrap: pharoArray.
	^ super new
			basicCreateObjectExpr: (#numpy asP3GI => #array callWith: (Array with: arrBinding));
			yourself.
]

{ #category : #converting }
KNpArray >> asArray [
	^ self contents waitForValue
]

{ #category : #converting }
KNpArray >> at: anIntegerOrCollection [
	| expr |
	expr := (self pythonAt: anIntegerOrCollection - 1).
	anIntegerOrCollection isInteger
		ifTrue: [ KCF << expr ]
		ifFalse: [ KCF << (expr => #tolist callWith: #()) ].
	^ KCF send waitForValue
]

{ #category : #converting }
KNpArray >> contents [
	KCF << (self => #tolist callWith: #()).
	^ KCF send
]

{ #category : #'as yet unclassified' }
KNpArray >> createObject [
	(KWrongConstructor cls: self) signal
]

{ #category : #converting }
KNpArray >> getContents [
	^ self contents waitForValue
]

{ #category : #converting }
KNpArray >> pythonAt: anIntegerOrCollection [
	^ P3GSubscription new
		target: self;
		insideBrackets: anIntegerOrCollection;
		yourself
]

{ #category : #'as yet unclassified' }
KNpArray >> pythonClass [
	^ #numpy asP3GI => #array
]

{ #category : #'as yet unclassified' }
KNpArray >> pythonVariable: varName [
	pythonVariable := varName
]
