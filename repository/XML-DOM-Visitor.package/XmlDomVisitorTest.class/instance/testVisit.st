as yet unclassified
testVisit
	| visitor |
	visitor := XmlDomTestVisitor new.
	visitor visit: self newDocument.
	self
		assert: visitor entries values
		equals:
			(OrderedDictionary
				with: 'version' -> 1.0
				with: 'encoding' -> 'UTF-8'
				with: 'root' -> 'root'
				with: 'str' -> 'str'
				with: #string -> ' some cdata <not a tag/> '
				with: 'data' -> 'data') values