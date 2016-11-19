tests-typed value accessing
testStringValue
	self assert: (self elementValued: 'value') stringValue equals: 'value'