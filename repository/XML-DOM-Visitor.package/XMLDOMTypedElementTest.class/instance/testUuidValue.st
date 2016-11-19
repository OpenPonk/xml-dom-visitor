tests-typed value accessing
testUuidValue
	self
		assert: (self elementValued: 'c95c1cd5-832d-4b46-b73f-a080ba157501') uuidValue
		equals: (UUID fromString: 'c95c1cd5-832d-4b46-b73f-a080ba157501')