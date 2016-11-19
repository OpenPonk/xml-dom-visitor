tests-typed value accessing
testBooleanValue
	self assert: (self elementValued: 'true') booleanValue equals: true.
	self assert: (self elementValued: 'false') booleanValue equals: false.
	self assert: (self elementValued: '1') booleanValue equals: true.
	self assert: (self elementValued: '0') booleanValue equals: false