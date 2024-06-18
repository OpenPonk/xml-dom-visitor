Class {
	#name : 'XMLDOMElementVisitorTest',
	#superclass : 'TestCase',
	#category : 'XML-DOM-Visitor-Tests',
	#package : 'XML-DOM-Visitor',
	#tag : 'Tests'
}

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testVisitSelectorFor [
	self
		assert: (XMLDOMElementVisitor new visitSelectorFor: 'someName')
		equals: #visitSomeName:
]
