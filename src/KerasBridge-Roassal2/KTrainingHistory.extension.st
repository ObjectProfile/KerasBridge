Extension { #name : #KTrainingHistory }

{ #category : #'*KerasBridge-Roassal2' }
KTrainingHistory >> gtInspectorVisualizeLossIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal2
		title: 'View';
		initializeView: [
			self visualizeLoss
			]
]

{ #category : #'*KerasBridge-Roassal2' }
KTrainingHistory >> visualizeLoss [
	| p g d |
	p := RTPalette c3.
	g := RTGrapher new.
	epochsMetrics associations doWithIndex: [ :assocation :index |
		d := RTData new.
		d connectColor: (p at: index).
		d noDot.
		d points: assocation value.
		d label: assocation key asString.
		d y: #yourself.
		g add: d.
		 ].
	g legend addText: 'Metric evolution'.
	^ g
]
