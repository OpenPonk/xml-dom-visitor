Extension { #name : #XMLElement }

{ #category : #'*XML-DOM-Visitor' }
XMLElement >> accept: aVisitor [
	^ aVisitor visitElement: self
]
