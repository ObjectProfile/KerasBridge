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
			spec baseline: 'NeoJSON' with: [
                spec repository: 'github://svenvc/NeoJSON/repository' ].
			spec baseline: 'PythonBridge' with: [
                spec repository: 'github://ObjectProfile/PythonBridge/src' ].
			spec baseline: 'Roassal2' with: [
                spec repository: 'github://ObjectProfile/Roassal2/src' ].
			spec baseline: 'NeoCSV' with: [
                spec repository: 'github://svenvc/NeoCSV/repository' ].
			spec package: 'KerasBridge' with: [ 
				spec requires: 'PythonBridge'.
				spec requires: 'NeoCSV' ].
			spec package: 'KerasBridge-Roassal2' with: [ 
					spec requires: 'KerasBridge'.
					spec requires: 'Roassal2' ].
			 ]
]
