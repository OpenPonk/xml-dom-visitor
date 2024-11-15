Extension { #name : 'XMLString' }

{ #category : '*OpenPonk-XMLDOMVisitor-visitor' }
XMLString >> accept: aVisitor [
	aVisitor visitString: self
]
