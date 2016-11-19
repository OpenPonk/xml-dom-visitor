typed attribute accessing
uuidAt: aName
	^ UUID fromString: (self attributeAt: aName)