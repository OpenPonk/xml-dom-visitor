Class {
	#name : 'XMLDOMVisitorTest',
	#superclass : 'TestCase',
	#category : 'XML-DOM-Visitor-Tests',
	#package : 'XML-DOM-Visitor',
	#tag : 'Tests'
}

{ #category : 'instance creation' }
XMLDOMVisitorTest >> newDocument [
	^ XMLDOMParser parse: '<?xml version="1.0" encoding="UTF-8"?>
	<root>
		<str>string</str>
		<data><![CDATA[ some cdata <not a tag/> ]]></data>
	</root>
'
]

{ #category : 'as yet unclassified' }
XMLDOMVisitorTest >> testVisit [
	| visitor |
	visitor := XMLDOMTestVisitor new.
	visitor visit: self newDocument.
	self
		assert: visitor entries
		equals:
			(OrderedCollection new
				add: 'version' -> 1.0;
				add: 'encoding' -> 'UTF-8';
				add: 'root' -> 'root';
				add: #string -> (String lf , String tab , String tab);
				add: 'str' -> 'str';
				add: #string -> 'string';
				add: #string -> (String lf , String tab , String tab);
				add: 'data' -> 'data';
				add: #string -> ' some cdata <not a tag/> ';
				add: #string -> (String lf , String tab);
				yourself)
]
