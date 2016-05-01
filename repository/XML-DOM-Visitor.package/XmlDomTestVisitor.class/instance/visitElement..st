visiting
visitElement: anElement
	entries at: anElement name put: anElement name.
	super visitElement: anElement