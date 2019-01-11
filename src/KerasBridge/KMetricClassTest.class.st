Class {
	#name : #KMetricClassTest,
	#superclass : #KTestCase,
	#category : #'KerasBridge-Tests'
}

{ #category : #asserting }
KMetricClassTest >> assertClass: cls name: aName [
	KCF << (cls => #__name__).
	self assert: KCF send waitForValue equals: aName
]

{ #category : #tests }
KMetricClassTest >> testBinaryAccuracy [
	self assertClass: KBinaryAccuracy name: 'binary_accuracy'
]

{ #category : #tests }
KMetricClassTest >> testCategoricalAccuracy [
	self assertClass: KCategoricalAccuracy name: 'categorical_accuracy'
]

{ #category : #tests }
KMetricClassTest >> testSparseCategoricalAccuracy [
	self assertClass: KSparseCategoricalAccuracy name: 'sparse_categorical_accuracy'
]

{ #category : #tests }
KMetricClassTest >> testSparseTopKCategoricalAccuracy [
	self assertClass: KSparseTopKCategoricalAccuracy name: 'sparse_top_k_categorical_accuracy'
]

{ #category : #tests }
KMetricClassTest >> testTopKCategoricalAccuracy [
	self assertClass: KTopKCategoricalAccuracy name: 'top_k_categorical_accuracy'
]
