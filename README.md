# XML DOM Visitor [![Build Status](https://travis-ci.org/peteruhnak/xml-dom-visitor.svg?branch=master)](https://travis-ci.org/peteruhnak/xml-dom-visitor)

An extension for [XMLParser's](http://smalltalkhub.com/#!/~PharoExtras/XMLParser) DOM.

Three functionalities:

* [base class for DOM visitors by the element's types (Document, Element, CData, String, ...)](#usage---creating-generic-dom-visitor)
* [delegating visitor with which you can visit the DOM by element's name](#usage---element-delegating-visitor)
* [typed retrieval of node values and attribute values](#usage---typed-values)
	* [supported selectors](#supported-selectors)

<br>

* [Example](#example)
* [Installation](#installation)

## Example

```xml
<people>
	<docId>cc254e89-569e-5b46-a6e9-4a06de4d9da0</docId>
	<person name="Sarah" age="32" />
	<person name="Carl" age="27" />
</people>
```

The XML above can be visited with a visitor such as the following one:

```
MyVisitor>>visitPeople: aPeopleElement
	"nothing to do"

MyVisitor>>visitDocId: aDocIdElement
	aDocIdElement uuidValue "an instace of UUID('cc254e89-569e-5b46-a6e9-4a06de4d9da0')"

MyVisitor>>visitPerson: aPersonElement
	aPersonElement stringAt: #name "returns string 'Sarah'"
	aPersonElement numberAt: #age "returns number '32'"
```

## Usage - Creating generic DOM visitor

Subclass `XMLDOMVisitor` to create your own visitor.

**Example**: Look at in-image class `XMLDOMTestVisitor`.

## Usage - Element delegating visitor

Use `XMLDOMElementVisitor` to delegate the visiting by the element's `localName` (without namespace) as the selector, e.g.

```
visitor := MyVisitor new.
XMLDOMElementVisitor new
	elementVisitor: visitor;
	visit: dom.
```

Then e.g. for an element `<person>`, the `visitPerson:` message will be sent to your `MyVisitor`.

## Usage - Typed values

If you specify `XMLDOMTypedElement` as the parsing node, then you can retrieve values with a specific type.

```
dom := (XMLDOMParser on: aStream)
	nodeFactory: (XMLPluggableElementFactory new elementClass: XMLDOMTypedElement);
	parseDocument.
```

Example:

`<myElement isRandom="true">12.7</myElement>` will be parsed into `XMLDOMTypedElement` instance.

```
element booleanAt: #isRandom. "-> true"
element stringAt: #isRandom. "-> 'true'"

element numberValue. "-> 12.7"
element stringValue. "-> '12.7'"
```

### Supported selectors

Look into the protocols `typed attribute accessing` and `typed value accessing` of `XMLDOMTypedElement`.

The following conversions are supported: `boolean`, `date`, `number`, `string`, `symbol`, and `uuid`.

Extras:

* `booleanAt:`/`booleanValue` will return `true` for strings `'true'`, `'1'`, or 'yes'.
* `XMLDOMTypedElement>>isEmptyValue` will return boolean if the element has any content. (e.g. `<el></el>` versus `<el>data</el>`)

## Installation

```
Metacello new
	baseline: 'XMLDOMVisitor';
	repository: 'github://peteruhnak/xml-dom-visitor/repository';
	load.
```
