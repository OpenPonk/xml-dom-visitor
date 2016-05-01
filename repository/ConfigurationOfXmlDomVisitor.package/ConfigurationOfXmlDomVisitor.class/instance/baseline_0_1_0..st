baselines
baseline_0_1_0: spec
	<version: '0.1.0-baseline'>
	spec
		for: #common
		do: [ spec
				project: 'XMLParser'
				with: [ spec
						className: #ConfigurationOfXMLParser;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLParser/main/' ].
			spec package: 'XML-DOM-Visitor' with: [ spec requires: 'XMLParser' ].
			spec group: 'default' with: #('XML-DOM-Visitor') ]