Class {
	#name : #XMLDOMTypedElement,
	#superclass : #XMLElement,
	#category : 'XML-DOM-Visitor-DOM'
}

{ #category : #'typed attribute accessing' }
XMLDOMTypedElement >> booleanAt: aName [
	^ self booleanFrom: (self attributeAt: aName)
]

{ #category : #'private - converting' }
XMLDOMTypedElement >> booleanFrom: aString [
	^ #('1' 'true' 'yes') includes: aString
]

{ #category : #'typed value accessing' }
XMLDOMTypedElement >> booleanValue [
	^ self booleanFrom: self rawContentString
]

{ #category : #'typed attribute accessing' }
XMLDOMTypedElement >> dateAt: aName [
	^ self dateFrom: (self attributeAt: aName)
]

{ #category : #'private - converting' }
XMLDOMTypedElement >> dateFrom: aString [
	^ DateAndTime fromString: aString
]

{ #category : #'typed value accessing' }
XMLDOMTypedElement >> dateValue [
	^ self dateFrom: self rawContentString
]

{ #category : #'typed value accessing' }
XMLDOMTypedElement >> isEmptyValue [
	^ self rawContentString isEmpty
]

{ #category : #'typed attribute accessing' }
XMLDOMTypedElement >> numberAt: aName [
	^ (self attributeAt: aName) asNumber
]

{ #category : #'typed value accessing' }
XMLDOMTypedElement >> numberValue [
	^ self rawContentString asNumber
]

{ #category : #'typed attribute accessing' }
XMLDOMTypedElement >> stringAt: aName [
	^ self attributeAt: aName
]

{ #category : #'typed value accessing' }
XMLDOMTypedElement >> stringValue [
	^ self rawContentString
]

{ #category : #'typed attribute accessing' }
XMLDOMTypedElement >> symbolAt: aName [
	^ (self attributeAt: aName) asSymbol
]

{ #category : #'typed value accessing' }
XMLDOMTypedElement >> symbolValue [
	^ self rawContentString asSymbol
]

{ #category : #'typed attribute accessing' }
XMLDOMTypedElement >> uuidAt: aName [
	^ UUID fromString: (self attributeAt: aName)
]

{ #category : #'typed value accessing' }
XMLDOMTypedElement >> uuidValue [
	^ UUID fromString: self rawContentString
]
