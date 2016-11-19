tests-typed value accessing
testNumberValue
	self assert: (self elementValued: '12') numberValue equals: 12.
	self assert: (self elementValued: '10.4') numberValue equals: 10.4