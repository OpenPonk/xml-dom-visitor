"
I am a unit test class verifying the dynamic selector resolution, element ignoring, and delegation behavior of XMLDOMElementVisitor.
"
Class {
	#name : 'XMLDOMElementVisitorTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-XMLDOMVisitor-Tests',
	#package : 'OpenPonk-XMLDOMVisitor',
	#tag : 'Tests'
}

{ #category : 'tests' }
XMLDOMElementVisitorTest >> testVisitSelectorFor [
	self
		assert: (XMLDOMElementVisitor new visitSelectorFor: 'someName')
		equals: #visitSomeName:
]
