tests-typed attribute accessing
testSymbolAt
	element := self elementWithAttributes: {#str -> 'value'} asDictionary.
	self assert: (element symbolAt: #str) equals: #value.
	self assert: (element symbolAt: #str) isSymbol