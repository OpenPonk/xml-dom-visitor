tests-typed attribute accessing
testDateAt
	element := self elementWithAttributes: {#date -> '2016-10-22T17:16:59'} asDictionary.
	self
		assert: (element dateAt: #date)
		equals:
			(DateAndTime
				year: 2016
				month: 10
				day: 22
				hour: 17
				minute: 16
				second: 59)