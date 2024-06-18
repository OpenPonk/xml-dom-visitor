Class {
	#name : 'XMLDOMTypedElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'element'
	],
	#category : 'XML-DOM-Visitor-Tests',
	#package : 'XML-DOM-Visitor',
	#tag : 'Tests'
}

{ #category : 'instance creation' }
XMLDOMTypedElementTest >> elementValued: aString [
	^ XMLDOMTypedElement new
		name: 'element';
		addString: aString;
		yourself
]

{ #category : 'instance creation' }
XMLDOMTypedElementTest >> elementWithAttributes: aDictionary [
	^ XMLDOMTypedElement name: 'element' attributes: aDictionary
]

{ #category : 'running' }
XMLDOMTypedElementTest >> setUp [
	super setUp.
	element := XMLElement
		name: 'element'
		attributes:
			{#uuid -> 'c95c1cd5-832d-4b46-b73f-a080ba157501'.
			#isSomething -> true} asDictionary
]

{ #category : 'tests-typed attribute accessing' }
XMLDOMTypedElementTest >> testBooleanAt [
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
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testBooleanValue [
	self assert: (self elementValued: 'true') booleanValue equals: true.
	self assert: (self elementValued: 'false') booleanValue equals: false.
	self assert: (self elementValued: 'yes') booleanValue equals: true.
	self assert: (self elementValued: 'no') booleanValue equals: false.
	self assert: (self elementValued: '1') booleanValue equals: true.
	self assert: (self elementValued: '0') booleanValue equals: false
]

{ #category : 'tests-typed attribute accessing' }
XMLDOMTypedElementTest >> testDateAt [
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
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testDateValue [
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
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testIsEmptyValue [
	self assert: (self elementValued: '') isEmptyValue.
	self deny: (self elementValued: '15') isEmptyValue
]

{ #category : 'tests-typed attribute accessing' }
XMLDOMTypedElementTest >> testNumberAt [
	element := self
		elementWithAttributes:
			{#num -> '12'.
			#float -> '10.4'} asDictionary.
	self assert: (element numberAt: #num) equals: 12.
	self assert: (element numberAt: #float) equals: 10.4
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testNumberValue [
	self assert: (self elementValued: '12') numberValue equals: 12.
	self assert: (self elementValued: '10.4') numberValue equals: 10.4
]

{ #category : 'tests-typed attribute accessing' }
XMLDOMTypedElementTest >> testStringAt [
	element := self elementWithAttributes: {#str -> 'value'} asDictionary.
	self assert: (element stringAt: #str) equals: 'value'.
	self deny: (element stringAt: #str) isSymbol
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testStringValue [
	self assert: (self elementValued: 'value') stringValue equals: 'value'
]

{ #category : 'tests-typed attribute accessing' }
XMLDOMTypedElementTest >> testSymbolAt [
	element := self elementWithAttributes: {#str -> 'value'} asDictionary.
	self assert: (element symbolAt: #str) equals: #value.
	self assert: (element symbolAt: #str) isSymbol
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testSymbolValue [
	self assert: (self elementValued: 'value') symbolValue equals: #value.
	self assert: (self elementValued: 'value') symbolValue isSymbol
]

{ #category : 'tests-typed attribute accessing' }
XMLDOMTypedElementTest >> testUuidAt [
	element := self
		elementWithAttributes: {#uuid -> 'c95c1cd5-832d-4b46-b73f-a080ba157501'} asDictionary.
	self
		assert: (element uuidAt: #uuid)
		equals: (UUID fromString: 'c95c1cd5-832d-4b46-b73f-a080ba157501')
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testUuidValue [
	self
		assert: (self elementValued: 'c95c1cd5-832d-4b46-b73f-a080ba157501') uuidValue
		equals: (UUID fromString: 'c95c1cd5-832d-4b46-b73f-a080ba157501')
]
