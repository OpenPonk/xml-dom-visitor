Class {
	#name : #XMLDOMElementVisitorTest,
	#superclass : #TestCase,
	#category : 'XML-DOM-Visitor-Tests'
}

{ #category : #tests }
XMLDOMElementVisitorTest >> testVisitSelectorFor [
	self
		assert: (XMLDOMElementVisitor new visitSelectorFor: 'someName')
		equals: #visitSomeName:
]
