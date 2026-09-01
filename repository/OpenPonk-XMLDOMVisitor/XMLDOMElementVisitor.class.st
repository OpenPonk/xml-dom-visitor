"
I am an XML DOM visitor that delegates element processing to a pluggable element visitor object. I dynamically resolve the visit selector based on the XML element's name (e.g., visiting an `<ActorRoles>` element triggers `#visitActorRoles:` on the delegate) and support ignoring predefined elements.
"
Class {
	#name : 'XMLDOMElementVisitor',
	#superclass : 'XMLDOMVisitor',
	#instVars : [
		'elementVisitor',
		'ignoredElements'
	],
	#category : 'OpenPonk-XMLDOMVisitor-Visitor',
	#package : 'OpenPonk-XMLDOMVisitor',
	#tag : 'Visitor'
}

{ #category : 'accessing' }
XMLDOMElementVisitor >> elementVisitor [
	^ elementVisitor
]

{ #category : 'accessing' }
XMLDOMElementVisitor >> elementVisitor: aVisitor [
	elementVisitor := aVisitor
]

{ #category : 'accessing' }
XMLDOMElementVisitor >> ignoredElements [
	^ ignoredElements ifNil: [ #() ]
]

{ #category : 'accessing' }
XMLDOMElementVisitor >> ignoredElements: aCollection [
	ignoredElements := aCollection
]

{ #category : 'testing' }
XMLDOMElementVisitor >> isIgnored: anElement [
	^ self ignoredElements includes: anElement name
]

{ #category : 'visiting' }
XMLDOMElementVisitor >> visitElement: anElement [
	(self isIgnored: anElement)
		ifTrue: [ ^ self ].
	elementVisitor perform: (self visitSelectorFor: anElement localName) with: anElement.
	super visitElement: anElement
]

{ #category : 'visitor' }
XMLDOMElementVisitor >> visitSelectorFor: aNodeName [
	^ ('visit' , aNodeName capitalized , ':') asSymbol
]
