visiting
visitDocument: aDocument
	entries add: 'version' -> aDocument version.
	entries add: 'encoding' -> aDocument encoding.
	super visitDocument: aDocument