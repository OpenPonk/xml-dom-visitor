"
Baseline for https://github.com/peteruhnak/xml-dom-visitor
"
Class {
	#name : #BaselineOfXMLDOMVisitor,
	#superclass : #BaselineOf,
	#category : 'BaselineOfXMLDOMVisitor'
}

{ #category : #accessing }
BaselineOfXMLDOMVisitor >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				project: 'XMLParser'
				with: [ spec
						className: #ConfigurationOfXMLParser;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main/' ].
			spec package: 'XML-DOM-Visitor' with: [ spec requires: #('XMLParser') ].
			spec group: 'default' with: #('XML-DOM-Visitor') ]
]
