typed accessing
booleanAt: aName
	^ (self attributeAt: aName) = 'true' | ((self attributeAt: aName) = '1')