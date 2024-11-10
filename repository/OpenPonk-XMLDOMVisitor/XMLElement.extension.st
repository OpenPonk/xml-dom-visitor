Extension { #name : 'XMLElement' }

{ #category : '*OpenPonk-XMLDOMVisitor' }
XMLElement >> accept: aVisitor [
	^ aVisitor visitElement: self
]
