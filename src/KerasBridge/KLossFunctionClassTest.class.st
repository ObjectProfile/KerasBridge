Class {
	#name : #KLossFunctionClassTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #asserting }
KLossFunctionClassTest >> testBinaryCrossentropy [
	self assertClass: KBinaryCrossentropy name: 'binary_crossentropy'
]

{ #category : #asserting }
KLossFunctionClassTest >> testCategoricalCrossentropy [
	self assertClass: KCategoricalCrossentropy name: 'categorical_crossentropy'
]

{ #category : #asserting }
KLossFunctionClassTest >> testMeanAbsoluteError [
	self assertClass: KMeanAbsoluteError name: 'mean_absolute_error'
]

{ #category : #asserting }
KLossFunctionClassTest >> testMeanSquaredError [
	self assertClass: KMeanSquaredError name: 'mean_squared_error'
]

{ #category : #asserting }
KLossFunctionClassTest >> testSparseCategoricalCrossentropy [
	self assertClass: KSparseCategoricalCrossentropy name: 'sparse_categorical_crossentropy'
]
