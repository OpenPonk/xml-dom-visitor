"
I am a unit test class verifying the dynamic selector resolution, element ignoring, and delegation behavior of XMLDOMElementVisitor.
"
Class {
	#name : 'XMLDOMElementVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'visitedElements'
	],
	#category : 'OpenPonk-XMLDOMVisitor-Tests-Visitor',
	#package : 'OpenPonk-XMLDOMVisitor-Tests',
	#tag : 'Visitor'
}

{ #category : 'running' }
XMLDOMElementVisitorTest >> setUp [

	super setUp.
	visitedElements := OrderedCollection new
]

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testElementVisitorAccessing [

	| visitor |
	visitor := XMLDOMElementVisitor new.
	self assert: visitor elementVisitor equals: nil.
	visitor elementVisitor: self.
	self assert: visitor elementVisitor identicalTo: self
]

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testIgnoredElementsDefault [

	| visitor |
	visitor := XMLDOMElementVisitor new.
	self assertEmpty: visitor ignoredElements
]

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testIsIgnored [

	| visitor ignoredElement normalElement |
	visitor := XMLDOMElementVisitor new
		           ignoredElements: #( 'skip' 'ns:hidden' );
		           yourself.
	ignoredElement := XMLElement named: 'skip'.
	normalElement := XMLElement named: 'keep'.
	self assert: (visitor isIgnored: ignoredElement) description: 'Element in ignoredElements must be ignored'.
	self deny: (visitor isIgnored: normalElement) description: 'Element not in ignoredElements must not be ignored'
]

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testVisitElementDelegatesByLocalName [

	| visitor document |
	document := XMLDOMParser parse: '<root xmlns:ns="http://example.org/ns"><ns:person><child/></ns:person></root>'.
	visitor := XMLDOMElementVisitor new
		           elementVisitor: self;
		           yourself.
	visitor visit: document.
	self
		assert: visitedElements
		equals: (OrderedCollection with: #root -> 'root' with: #person -> 'ns:person' with: #child -> 'child')
]

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testVisitElementSkipsIgnoredElementAndDescendants [

	| visitor document |
	document := XMLDOMParser parse: '<root><ignored><child/></ignored><person/></root>'.
	visitor := XMLDOMElementVisitor new
		           elementVisitor: self;
		           ignoredElements: #( 'ignored' );
		           yourself.
	visitor visit: document.
	self assert: visitedElements equals: (OrderedCollection with: #root -> 'root' with: #person -> 'person')
]

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testVisitSelectorFor [
	self
		assert: (XMLDOMElementVisitor new visitSelectorFor: 'someName')
		equals: #visitSomeName:
]

{ #category : 'visiting' }
XMLDOMElementVisitorTest >> visitChild: anElement [

	visitedElements add: #child -> anElement name
]

{ #category : 'visiting' }
XMLDOMElementVisitorTest >> visitPerson: anElement [

	visitedElements add: #person -> anElement name
]

{ #category : 'visiting' }
XMLDOMElementVisitorTest >> visitRoot: anElement [

	visitedElements add: #root -> anElement name
]
