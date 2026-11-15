"
I am a unit test class verifying the accurate parsing and type conversion of XML attributes and node values by XMLDOMTypedElement.
"
Class {
	#name : 'XMLDOMTypedElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'element'
	],
	#category : 'OpenPonk-XMLDOMVisitor-Tests-DOM',
	#package : 'OpenPonk-XMLDOMVisitor-Tests',
	#tag : 'DOM'
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

	element := self elementWithAttributes: {
			           (#true -> 'true').
			           (#false -> 'false').
			           (#yes -> 'yes').
			           (#no -> 'no').
			           (#bit -> '1').
			           (#noBit -> '0') } asDictionary.
	self assert: (element booleanAt: #true) description: 'Attribute "true" must parse as true'.
	self deny: (element booleanAt: #false) description: 'Attribute "false" must parse as false'.
	self assert: (element booleanAt: #yes) description: 'Attribute "yes" must parse as true'.
	self deny: (element booleanAt: #no) description: 'Attribute "no" must parse as false'.
	self assert: (element booleanAt: #bit) description: 'Attribute "1" must parse as true'.
	self deny: (element booleanAt: #noBit) description: 'Attribute "0" must parse as false'
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testBooleanValue [

	self assert: (self elementValued: 'true') booleanValue description: 'Element value "true" must parse as true'.
	self deny: (self elementValued: 'false') booleanValue description: 'Element value "false" must parse as false'.
	self assert: (self elementValued: 'yes') booleanValue description: 'Element value "yes" must parse as true'.
	self deny: (self elementValued: 'no') booleanValue description: 'Element value "no" must parse as false'.
	self assert: (self elementValued: '1') booleanValue description: 'Element value "1" must parse as true'.
	self deny: (self elementValued: '0') booleanValue description: 'Element value "0" must parse as false'
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

	self assert: (self elementValued: '') isEmptyValue description: 'Empty element value must report isEmptyValue'.
	self deny: (self elementValued: '15') isEmptyValue description: 'Non-empty element value must not report isEmptyValue'
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

	element := self elementWithAttributes: { (#str -> 'value') } asDictionary.
	self assert: (element stringAt: #str) equals: 'value'.
	self deny: (element stringAt: #str) isSymbol description: 'stringAt: must return a String rather than a Symbol'
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testStringValue [
	self assert: (self elementValued: 'value') stringValue equals: 'value'
]

{ #category : 'tests-typed attribute accessing' }
XMLDOMTypedElementTest >> testSymbolAt [

	element := self elementWithAttributes: { (#str -> 'value') } asDictionary.
	self assert: (element symbolAt: #str) identicalTo: #value.
	self assert: (element symbolAt: #str) isSymbol description: 'symbolAt: must return a Symbol'
]

{ #category : 'tests-typed value accessing' }
XMLDOMTypedElementTest >> testSymbolValue [

	self assert: (self elementValued: 'value') symbolValue identicalTo: #value.
	self assert: (self elementValued: 'value') symbolValue isSymbol description: 'symbolValue must return a Symbol'
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
