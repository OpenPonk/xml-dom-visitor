as yet unclassified
testVisit
	| visitor |
	visitor := XMLDOMTestVisitor new.
	visitor visit: self newDocument.
	self
		assert: visitor entries
		equals:
			(OrderedCollection new
				add: 'version' -> 1.0;
				add: 'encoding' -> 'UTF-8';
				add: 'root' -> 'root';
				add: #string -> (String lf , String tab , String tab);
				add: 'str' -> 'str';
				add: #string -> 'string';
				add: #string -> (String lf , String tab , String tab);
				add: 'data' -> 'data';
				add: #string -> ' some cdata <not a tag/> ';
				add: #string -> (String lf , String tab);
				yourself)