tests-typed accessing
testStringAt
	element := self elementWithAttributes: {#str -> 'value'} asDictionary.
	self assert: (element stringAt: #str) equals: 'value'.
	self deny: (element stringAt: #str) isSymbol