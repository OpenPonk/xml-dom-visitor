"
Baseline for https://github.com/peteruhnak/xml-dom-visitor
"
Class {
	#name : 'BaselineOfOpenPonkXMLDOMVisitor',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfOpenPonkXMLDOMVisitor',
	#package : 'BaselineOfOpenPonkXMLDOMVisitor'
}

{ #category : 'baselines' }
BaselineOfOpenPonkXMLDOMVisitor >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec baseline: 'XMLParser' with: [
			spec
				repository: 'github://pharo-contributions/XML-XMLParser:v3.6.x';
				loads: #( Core ) ].
		spec
			package: 'OpenPonk-XMLDOMVisitor'
			with: [ spec requires: #( 'XMLParser' ) ].
		spec group: 'default' with: #( 'OpenPonk-XMLDOMVisitor' ) ]
]
