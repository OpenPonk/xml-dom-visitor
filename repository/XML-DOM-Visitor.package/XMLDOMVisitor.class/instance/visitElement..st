visiting
visitElement: anElement
	^ anElement nodes do: [ :each | each accept: self ]