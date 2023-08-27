!classDefinition: #l category: 'peano'!
DenotativeObject subclass: #l
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'l class' category: 'peano'!
l class
	instanceVariableNames: 'next'!

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 16:58:21'!
* aNaturalNumber
	^aNaturalNumber! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/24/2023 21:34:27'!
+ aNaturalNumber
	^aNaturalNumber next! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 18:11:48'!
/ aNaturalNumber
	^(aNaturalNumber  divideA: self)! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 16:49:41'!
> aNaturalNumber
	^false! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 17:12:34'!
divideA: aNaturalNumber
	^aNaturalNumber next! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/24/2023 21:30:07'!
next
	next ifNil:[next := self cloneNamed: self name, 'l'].
	next previous: self.
	^next! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/24/2023 21:36:29'!
previous
	^l! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 17:37:55'!
restateA: aNaturalNumber
	^(aNaturalNumber previous )! !


!l class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/27/2023 18:37:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := ll.! !


!classDefinition: #ll category: 'peano'!
DenotativeObject subclass: #ll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'll class' category: 'peano'!
ll class
	instanceVariableNames: 'previous next'!

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 16:58:03'!
* aNaturalNumber
	^(self previous * aNaturalNumber + aNaturalNumber)! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/24/2023 21:38:08'!
+ aNaturalNumber
	^(previous + aNaturalNumber) next! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 17:38:32'!
- aNaturalNumber
	^aNaturalNumber restateA: self! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 17:54:44'!
/ aNaturalNumber
	^aNaturalNumber divideA: self! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 16:56:15'!
> aNaturalNumber
	(aNaturalNumber = l)
	ifTrue: [^true] ifFalse: [^(self previous > aNaturalNumber  previous)].! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 18:34:11'!
divideA: aNaturalNumber
	"este codigo se divide en muchas partes debido a la falta de un 0"
	(self = aNaturalNumber )
	"si son iguales devulevo uno"
	ifTrue: [^l] 
	ifFalse:[(aNaturalNumber > self )
		"si es mayor hago recursion"
		ifTrue: [
			"como la recursion me puede devolver un nil tengo que detectarlo"
			|cociente|. 
			cociente := (self divideA: (aNaturalNumber - self)).
			cociente ifNotNil: [^cociente next] ifNil:[^l] .
			] 
		"si es menor como no tengo 0 tengo que devolver nil"
		ifFalse: [^nil]
		]! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/24/2023 21:30:14'!
next
	next ifNil:[next := self cloneNamed: self name, 'l'].
	next previous: self.
	^next! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/24/2023 21:36:04'!
previous
	^previous! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/24/2023 21:33:10'!
previous: aNatualNumber
	previous := aNatualNumber .
	^previous ! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 17:49:25'!
restateA: aNaturalNumber
	^(aNaturalNumber previous - self previous)! !


!ll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/27/2023 18:37:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := l.
	next := nil.! !

l initializeAfterFileIn!
ll initializeAfterFileIn!