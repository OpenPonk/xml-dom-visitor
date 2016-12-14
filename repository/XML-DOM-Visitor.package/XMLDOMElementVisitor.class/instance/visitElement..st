visiting
visitElement: anElement
	(self isIgnored: anElement)
		ifTrue: [ ^ self ].
	elementVisitor perform: (self visitSelectorFor: anElement localName) with: anElement.
	super visitElement: anElement