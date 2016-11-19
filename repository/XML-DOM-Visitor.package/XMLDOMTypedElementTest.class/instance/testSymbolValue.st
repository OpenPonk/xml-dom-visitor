tests-typed value accessing
testSymbolValue
	self assert: (self elementValued: 'value') symbolValue equals: #value.
	self assert: (self elementValued: 'value') symbolValue isSymbol