Class {
	#name : #BaselineOfKerasBridge,
	#superclass : #BaselineOf,
	#category : #BaselineOfKerasBridge
}

{ #category : #baselines }
BaselineOfKerasBridge >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [			
			spec baseline: 'PythonBridge' with: [
                spec
                    repository: 'github://ObjectProfile/PythonBridge/src' ].
			spec
				package: 'KerasBridge' with: [ spec requires: 'PythonBridge' ]
			 ]
]
