instance creation
elementValued: aString
	^ XMLDOMTypedElement new
		name: 'element';
		addString: aString;
		yourself