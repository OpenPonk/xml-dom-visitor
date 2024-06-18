Extension { #name : 'XMLDocument' }

{ #category : '*XML-DOM-Visitor-visitor' }
XMLDocument >> accept: aVisitor [
	^ aVisitor visitDocument: self
]
