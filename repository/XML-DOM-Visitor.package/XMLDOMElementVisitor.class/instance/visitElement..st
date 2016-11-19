visiting
visitElement: anElement
	elementVisitor perform: (self visitSelectorFor: anElement localName) with: anElement.
	super visitElement: anElement