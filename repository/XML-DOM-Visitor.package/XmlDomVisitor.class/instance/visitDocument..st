visiting
visitDocument: aDocument
	aDocument nodes do: [ :each | each accept: self ]