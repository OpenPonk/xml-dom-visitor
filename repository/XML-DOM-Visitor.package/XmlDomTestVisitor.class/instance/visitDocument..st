visiting
visitDocument: aDocument
	entries at: 'version' put: aDocument version.
	entries at: 'encoding' put: aDocument encoding.
	super visitDocument: aDocument