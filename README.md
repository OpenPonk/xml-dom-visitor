# XML DOM Visitor [![Build Status](https://travis-ci.org/peteruhnak/xml-dom-visitor.svg?branch=master)](https://travis-ci.org/peteruhnak/xml-dom-visitor)

An extension for [XMLParser's](http://smalltalkhub.com/#!/~PharoExtras/XMLParser) DOM to permit a basic visitor.

## Base DOM visitor

Subclass `XMLDOMVisitor` to create your own visitor. (Example in `XMLDOMTestVisitor`).

## Element delegating visitor

Or use `XMLDOMElementVisitor` which will delegate the visiting to your object with the element's name as the selector, e.g.

```
visitor := MyVisitor new.
XMLDOMElementVisitor new
	elementVisitor: visitor;
	visit: dom.
```

Then for an element `<someElement>`, the `visitSomeElement:` message will be sent to your `MyVisitor`.

## Typed attributes retrieval

A `XMLDOMTypedElement` class is provided, with which you can retrieve attributes with given type.

The class has to be provided during the parsing of the DOM.

```
dom := (XMLDOMParser on: aStream)
	nodeFactory: (XMLPluggableElementFactory new elementClass: XMLDOMTypedElement);
	parseDocument.
```

Then all element nodes in the dom will be instances of `XMLDOMTypedElement`.

Example:

`<myElement id="cc254e89-569e-5b46-a6e9-4a06de4d9da0" isRandom="true" number="12" anotherNumber="14.2" />`

```
element uuidAt: #id. "-> UUID instance of cc254e89-569e-5b46-a6e9-4a06de4d9da0"
element booleanAt: #isRandom. "-> true"
element stringAt: #isRandom. "-> 'true'"
element numberAt: #anotherNumber. "-> "14.2"
element numberAt: #number. "-> 12"
element stringAt: #number. "-> '12'".
```

### Supported selectors:

`XMLDOMTypedElement selectorsInProtocol: 'typed accessing' "#(#booleanAt: #numberAt: #stringAt: #symbolAt: #uuidAt:)"`


## Installation

```
Metacello new
	baseline: 'XMLDOMVisitor';
	repository: 'github://peteruhnak/xml-dom-visitor/repository';
	load.
```
