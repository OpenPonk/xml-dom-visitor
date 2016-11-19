tests-typed attribute accessing
testUuidAt
	element := self
		elementWithAttributes: {#uuid -> 'c95c1cd5-832d-4b46-b73f-a080ba157501'} asDictionary.
	self
		assert: (element uuidAt: #uuid)
		equals: (UUID fromString: 'c95c1cd5-832d-4b46-b73f-a080ba157501')