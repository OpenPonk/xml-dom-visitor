# XML DOM Visitor [![Build Status](https://travis-ci.org/peteruhnak/xml-dom-visitor.svg?branch=master)](https://travis-ci.org/peteruhnak/xml-dom-visitor)

An extension for [XMLParser's](http://smalltalkhub.com/#!/~PharoExtras/XMLParser) DOM.

Three functionalities:

* [base class for DOM visitors by the element's types (Document, Element, CData, String, ...)](#usage---creating-generic-dom-visitor)
* [delegating visitor with which you can visit the DOM by element's name](#usage---element-delegating-visitor)
* [typed retrieval of node values and attribute values](#usage---typed-values)

## Example

```xml
<people>
	<docId>cc254e89-569e-5b46-a6e9-4a06de4d9da0</docId>
	<person name="Sarah" age="32" />
	<person name="Carl" age="27" />
</people>
```

The XML above can be visited with these two methods:

`MyVisitor>>visitPeople: aPeopleElement`
`MyVisitor>>visitDocId: aDocIdElement`
`MyVisitor>>visitPerson: aPersonElement`

Additionally the string nodes and attribute values can be retrieved with a specific type.

```st
MyVisitor>>visitDocId: aDocIdElement
	aDocIdElement uuidValue "an instace of UUID('cc254e89-569e-5b46-a6e9-4a06de4d9da0')"

MyVisitor>>visitPerson: aPersonElement
	aPersonElement stringAt: #name "returns string 'Sarah'"
	aPersonElement numberAt: #age "returns number '32'"
```

## Usage - Creating generic DOM visitor

Subclass `XMLDOMVisitor` to create your own visitor. (Example in `XMLDOMTestVisitor`).

## Usage - Element delegating visitor

Use `XMLDOMElementVisitor` which will delegate the visiting to your object with the element's `localName` (without namespace) as the selector, e.g.

```
visitor := MyVisitor new.
XMLDOMElementVisitor new
	elementVisitor: visitor;
	visit: dom.
```

Then e.g. for an element `<person>`, the `visitPerson:` message will be sent to your `MyVisitor`.

## Usage - Typed values

If you specify `XMLDOMTypedElement` as the target node during parsing, then you can retrieve values with a specific type.

```
dom := (XMLDOMParser on: aStream)
	nodeFactory: (XMLPluggableElementFactory new elementClass: XMLDOMTypedElement);
	parseDocument.
```

Then all element nodes in the dom will be instances of `XMLDOMTypedElement`.

Example:

`<myElement isRandom="true">12.7</myElement>`

```
element booleanAt: #isRandom. "-> true"
element stringAt: #isRandom. "-> 'true'"

element numberValue. "-> 12.7"
element stringValue. "-> '12.7'"
```

### Supported selectors:

Look into the protocols `typed attribute accessing` and `typed value accessing` of `XMLDOMTypedElement`.

The following conversions are supported: `boolean`, `date`, `number`, `string`, `symbol`, and `uuid`.

Additionally `XMLDOMTypedElement>>isEmptyValue` will return boolean depending if any string content is in the element. (e.g. `<el></el>` versus `<el>data</el>`)

## Installation

```
Metacello new
	baseline: 'XMLDOMVisitor';
	repository: 'github://peteruhnak/xml-dom-visitor/repository';
	load.
```
