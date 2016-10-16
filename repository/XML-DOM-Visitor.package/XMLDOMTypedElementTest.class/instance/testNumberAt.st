tests-typed accessing
testNumberAt
	element := self
		elementWithAttributes:
			{#num -> '12'.
			#float -> '10.4'} asDictionary.
	self assert: (element numberAt: #num) equals: 12.
	self assert: (element numberAt: #float) equals: 10.4