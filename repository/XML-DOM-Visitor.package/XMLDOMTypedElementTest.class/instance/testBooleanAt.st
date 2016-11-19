tests-typed attribute accessing
testBooleanAt
	element := self
		elementWithAttributes:
			{#yes -> 'true'.
			#no -> 'false'.
			#bit -> '1'.
			#noBit -> '0'} asDictionary.
	self assert: (element booleanAt: #yes) equals: true.
	self assert: (element booleanAt: #no) equals: false.
	self assert: (element booleanAt: #bit) equals: true.
	self assert: (element booleanAt: #noBit) equals: false