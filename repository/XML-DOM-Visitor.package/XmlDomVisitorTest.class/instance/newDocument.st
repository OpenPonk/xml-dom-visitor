instance creation
newDocument
	^ XMLDOMParser parse: '<?xml version="1.0" encoding="UTF-8"?>
	<root>
		<str>string</str>
		<data><![CDATA[ some cdata <not a tag/> ]]></data>
	</root>
'