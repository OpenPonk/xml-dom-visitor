Extension { #name : 'XMLDocument' }

{ #category : '*OpenPonk-XMLDOMVisitor-visitor' }
XMLDocument >> accept: aVisitor [
	^ aVisitor visitDocument: self
]
