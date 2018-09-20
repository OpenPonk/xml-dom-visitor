Class {
	#name : #XMLDOMTestVisitor,
	#superclass : #XMLDOMVisitor,
	#instVars : [
		'entries'
	],
	#category : 'XML-DOM-Visitor-Visitor'
}

{ #category : #accessing }
XMLDOMTestVisitor >> entries [
	^ entries
]

{ #category : #initialization }
XMLDOMTestVisitor >> initialize [
	super initialize.
	entries := OrderedCollection new
]

{ #category : #visiting }
XMLDOMTestVisitor >> visitDocument: aDocument [
	entries add: 'version' -> aDocument version.
	entries add: 'encoding' -> aDocument encoding.
	super visitDocument: aDocument
]

{ #category : #visiting }
XMLDOMTestVisitor >> visitElement: anElement [
	entries add: anElement name -> anElement name.
	super visitElement: anElement
]

{ #category : #visiting }
XMLDOMTestVisitor >> visitString: aStringNode [
	entries add: #string -> aStringNode string
]
