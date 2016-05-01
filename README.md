# XML DOM Visitor [![Build Status](https://travis-ci.org/peteruhnak/xml-dom-visitor.svg?branch=master)](https://travis-ci.org/peteruhnak/xml-dom-visitor)

A simple extension for [XMLParser's](http://smalltalkhub.com/#!/~PharoExtras/XMLParser) DOM to permit a basic visitor.

Subclass `XMLDOMVisitor` to create your own visitor. (Example in `XMLDOMTestVisitor`).

## Installation

```
Metacello new
	baseline: 'XMLDOMVisitor';
	repository: 'github://peteruhnak/xml-dom-visitor/repository';
	load.
```
