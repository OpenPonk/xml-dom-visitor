"
I am a unit test class verifying the basic traversal and node processing mechanisms of XMLDOMVisitor across different XML DOM node types.
"
Class {
	#name : 'XMLDOMVisitorTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMLDOMVisitor-Tests-Visitor',
	#package : 'OpenPonk-XMLDOMVisitor-Tests',
	#tag : 'Visitor'
}

{ #category : 'instance creation' }
XMLDOMVisitorTest >> newDocument [

	^ (XMLDOMParser on: '<?xml version="1.0" encoding="UTF-8"?>
	<root>
		<str>string</str>
		<data><![CDATA[ some cdata <not a tag/> ]]></data>
	</root>
')
		  preservesCDataNodes: true;
		  parseDocument
]

{ #category : 'tests' }
XMLDOMVisitorTest >> testVisit [

	| visitor indent twoTabs |
	visitor := XMLDOMTestVisitor new.
	visitor visit: self newDocument.
	twoTabs := String with: Character lf with: Character tab with: Character tab.
	indent := String with: Character lf with: Character tab.
	self assert: visitor entries equals: (OrderedCollection new
			 add: 'version' -> 1.0;
			 add: 'encoding' -> 'UTF-8';
			 add: 'root' -> 'root';
			 add: #string -> twoTabs;
			 add: 'str' -> 'str';
			 add: #string -> 'string';
			 add: #string -> twoTabs;
			 add: 'data' -> 'data';
			 add: #cdata -> ' some cdata <not a tag/> ';
			 add: #string -> indent;
			 yourself)
]

{ #category : 'tests' }
XMLDOMVisitorTest >> testVisitCDataReturnsVisitorResult [

	| visitor cdataNode |
	visitor := XMLDOMTestVisitor new.
	cdataNode := XMLCData string: 'raw <data>'.
	self assert: (visitor visit: cdataNode) equals: #cdata -> 'raw <data>'
]

{ #category : 'tests' }
XMLDOMVisitorTest >> testVisitDefaultVisitor [

	| visitor document |
	visitor := XMLDOMVisitor new.
	document := self newDocument.
	self assert: (visitor visit: document) identicalTo: visitor
]

{ #category : 'tests' }
XMLDOMVisitorTest >> testVisitStringReturnsVisitorResult [

	| visitor stringNode |
	visitor := XMLDOMTestVisitor new.
	stringNode := XMLString string: 'hello'.
	self assert: (visitor visit: stringNode) equals: #string -> 'hello'
]
