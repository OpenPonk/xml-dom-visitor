Extension { #name : 'XMLCData' }

{ #category : '*XML-DOM-Visitor-visitor' }
XMLCData >> accept: aVisitor [
	aVisitor visitCData: self
]
