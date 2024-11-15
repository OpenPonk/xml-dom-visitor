Extension { #name : 'XMLCData' }

{ #category : '*OpenPonk-XMLDOMVisitor-visitor' }
XMLCData >> accept: aVisitor [
	aVisitor visitCData: self
]
