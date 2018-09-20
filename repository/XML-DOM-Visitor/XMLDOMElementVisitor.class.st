"
I am a DOM visitor that visits elements and delegates the visition to pluggable `elementVisitor`.

e.g. upon visiting `<ActorRoles>` element the `elementVisitor visitActorRoles:` method will be called.
"
Class {
	#name : #XMLDOMElementVisitor,
	#superclass : #XMLDOMVisitor,
	#instVars : [
		'elementVisitor',
		'ignoredElements'
	],
	#category : 'XML-DOM-Visitor-Visitor'
}

{ #category : #accessing }
XMLDOMElementVisitor >> elementVisitor [
	^ elementVisitor
]

{ #category : #accessing }
XMLDOMElementVisitor >> elementVisitor: aVisitor [
	elementVisitor := aVisitor
]

{ #category : #accessing }
XMLDOMElementVisitor >> ignoredElements [
	^ ignoredElements ifNil: [ #() ]
]

{ #category : #accessing }
XMLDOMElementVisitor >> ignoredElements: aCollection [
	ignoredElements := aCollection
]

{ #category : #testing }
XMLDOMElementVisitor >> isIgnored: anElement [
	^ self ignoredElements includes: anElement name
]

{ #category : #visiting }
XMLDOMElementVisitor >> visitElement: anElement [
	(self isIgnored: anElement)
		ifTrue: [ ^ self ].
	elementVisitor perform: (self visitSelectorFor: anElement localName) with: anElement.
	super visitElement: anElement
]

{ #category : #visitor }
XMLDOMElementVisitor >> visitSelectorFor: aNodeName [
	^ ('visit' , aNodeName capitalized , ':') asSymbol
]
