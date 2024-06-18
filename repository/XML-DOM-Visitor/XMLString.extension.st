Extension { #name : 'XMLString' }

{ #category : '*XML-DOM-Visitor-visitor' }
XMLString >> accept: aVisitor [
	aVisitor visitString: self
]
