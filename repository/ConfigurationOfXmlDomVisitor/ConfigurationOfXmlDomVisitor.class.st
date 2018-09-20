Class {
	#name : #ConfigurationOfXmlDomVisitor,
	#superclass : #ConfigurationOf,
	#category : 'ConfigurationOfXmlDomVisitor'
}

{ #category : #baselines }
ConfigurationOfXmlDomVisitor >> baseline_0_1_0: spec [
	<version: '0.1.0-baseline'>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec repository: 'http://www.smalltalkhub.com/mc/peteruhnak/XmlDomVisitor/main'.
			spec
				project: 'XMLParser'
				with: [ spec
						className: 'ConfigurationOfXMLParser';
						loads: #('default');
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XMLParser/main' ].
			spec package: 'XML-DOM-Visitor' with: [ spec requires: #('XMLParser') ].
			spec group: 'default' with: #('XML-DOM-Visitor') ]
]

{ #category : #'symbolic versions' }
ConfigurationOfXmlDomVisitor >> development: spec [
	<symbolicVersion: #development>
	spec for: #common version: '0.1.0-baseline'
]
