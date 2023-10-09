"
Baseline for https://github.com/peteruhnak/xml-dom-visitor
"
Class {
	#name : #BaselineOfXMLDOMVisitor,
	#superclass : #BaselineOf,
	#category : #BaselineOfXMLDOMVisitor
}

{ #category : #baselines }
BaselineOfXMLDOMVisitor >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'XMLParser'
				with: [ spec
						repository: 'github://pharo-contributions/XML-XMLParser:4f9cb10';
						loads: #(Core) ].
			spec
				package: 'XML-DOM-Visitor'
				with: [ spec requires: #('XMLParser') ].
			spec group: 'default' with: #('XML-DOM-Visitor') ]
]
