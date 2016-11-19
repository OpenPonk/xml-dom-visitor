tests-typed value accessing
testIsEmptyValue
	self assert: (self elementValued: '') isEmptyValue.
	self deny: (self elementValued: '15') isEmptyValue