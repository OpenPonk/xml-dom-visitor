# XML DOM Visitor

[![Nightly](https://github.com/OpenPonk/xml-dom-visitor/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/xml-dom-visitor/actions/workflows/nightly.yml) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/xml-dom-visitor/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/xml-dom-visitor?branch=master)

An extension for [XMLParser](https://github.com/pharo-contributions/XML-XMLParser)'s DOM providing:

- [Base class for DOM visitors by node type (`Document`, `Element`, `CData`, `String`, ...)](#usage---creating-a-generic-dom-visitor)
- [Delegating visitor dispatching by element name](#usage---element-delegating-visitor)
- [Typed retrieval of node and attribute values](#usage---typed-values)

## Installation

See [openponk.org/#direct-installation](https://openponk.org/#direct-installation) for the supported Pharo version.

```smalltalk
Metacello new
	baseline: 'OpenPonkXMLDOMVisitor';
	repository: 'github://OpenPonk/xml-dom-visitor';
	load.
```

## Example

```xml
<people>
	<docId>cc254e89-569e-5b46-a6e9-4a06de4d9da0</docId>
	<person name="Sarah" age="32" />
	<person name="Carl" age="27" />
</people>
```

The XML above can be visited with a visitor such as:

```smalltalk
MyVisitor>>visitPeople: aPeopleElement
	"nothing to do"

MyVisitor>>visitDocId: aDocIdElement
	aDocIdElement uuidValue "an instance of UUID('cc254e89-569e-5b46-a6e9-4a06de4d9da0')"

MyVisitor>>visitPerson: aPersonElement
	aPersonElement stringAt: #name. "returns string 'Sarah'"
	aPersonElement numberAt: #age "returns number 32"
```

## Usage - Creating a Generic DOM Visitor

Subclass `XMLDOMVisitor` to create your own visitor. Look at `XMLDOMTestVisitor` in the test package for an example.

## Usage - Element Delegating Visitor

Use `XMLDOMElementVisitor` to delegate visiting by the element's `localName` (without namespace) as the selector:

```smalltalk
visitor := MyVisitor new.
XMLDOMElementVisitor new
	elementVisitor: visitor;
	visit: dom.
```

For an element `<person>`, the `visitPerson:` message is sent to `MyVisitor`.

## Usage - Typed Values

Specify `XMLDOMTypedElement` as the parsing node class to retrieve typed values:

```smalltalk
dom := (XMLDOMParser on: aStream)
	nodeFactory: (XMLPluggableElementFactory new elementClass: XMLDOMTypedElement);
	parseDocument.
```

For `<myElement isRandom="true">12.7</myElement>`:

```smalltalk
element booleanAt: #isRandom. "-> true"
element stringAt: #isRandom. "-> 'true'"

element numberValue. "-> 12.7"
element stringValue. "-> '12.7'"
```

### Supported Selectors

Inspect the `typed attribute accessing` and `typed value accessing` protocols of `XMLDOMTypedElement`. Supported conversions: `boolean`, `date`, `number`, `string`, `symbol`, and `uuid`.

- `booleanAt:` / `booleanValue` return `true` for `'true'`, `'1'`, or `'yes'`.
- `XMLDOMTypedElement>>isEmptyValue` returns whether the element has content (`<el></el>` vs. `<el>data</el>`).

## Documentation

Part of the [OpenPonk](https://openponk.org) platform. For architecture, the repository catalog, and contributing guidelines, see [`OpenPonk/.github`](https://github.com/OpenPonk/.github/blob/main/profile/README.md).
