"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestKerasBridge,
	#superclass : #PackageManifest,
	#category : #'KerasBridge-Manifest'
}

{ #category : #'code-critics' }
ManifestKerasBridge class >> ruleRTInvocationSequenceRuleV1FalsePositive [
	^ #(#(#(#RGPackage #(#KerasBridge)) #'2019-02-06T15:22:08.144569-03:00') )
]
