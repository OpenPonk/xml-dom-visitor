tests-typed value accessing
testDateValue
	self
		assert: (self elementValued: '2016-10-22T17:16:59') dateValue
		equals:
			(DateAndTime
				year: 2016
				month: 10
				day: 22
				hour: 17
				minute: 16
				second: 59)