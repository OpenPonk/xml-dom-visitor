tests-typed attribute accessing
testBooleanAt
	element := self
		elementWithAttributes:
			{#true -> 'true'.
			#false -> 'false'.
			#yes -> 'yes'.
			#no -> 'no'.
			#bit -> '1'.
			#noBit -> '0'} asDictionary.
	self assert: (element booleanAt: #true) equals: true.
	self assert: (element booleanAt: #false) equals: false.
	self assert: (element booleanAt: #yes) equals: true.
	self assert: (element booleanAt: #no) equals: false.
	self assert: (element booleanAt: #bit) equals: true.
	self assert: (element booleanAt: #noBit) equals: false