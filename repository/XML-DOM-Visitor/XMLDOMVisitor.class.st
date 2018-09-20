"
I am a base class for XML DOM visitors.
"
Class {
	#name : #XMLDOMVisitor,
	#superclass : #Object,
	#category : 'XML-DOM-Visitor-Visitor'
}

{ #category : #visitor }
XMLDOMVisitor >> visit: aDocument [
	^ aDocument accept: self
]

{ #category : #visiting }
XMLDOMVisitor >> visitCData: aCDataNode [ 

]

{ #category : #visiting }
XMLDOMVisitor >> visitDocument: aDocument [
	aDocument nodes do: [ :each | each accept: self ]
]

{ #category : #visiting }
XMLDOMVisitor >> visitElement: anElement [
	^ anElement nodes do: [ :each | each accept: self ]
]

{ #category : #visiting }
XMLDOMVisitor >> visitString: aStringNode [ 

]
