!classDefinition: #conversor category: 'peano'!
DenotativeObject subclass: #conversor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'conversor class' category: 'peano'!
conversor class
	instanceVariableNames: ''!

!conversor class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 22:05:53'!
pasarEnteroANatural: aPositiveNumber
	(aPositiveNumber > 0)
	ifTrue: [
	|natural contador|.
	natural  := l.
	contador := aPositiveNumber  .
	[contador > 1] whileTrue: [natural := natural next. contador := contador -1.].
	^natural .
	]. 
	self error: 'tiene que ser positivo'
! !

!conversor class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 20:59:55'!
pasarNaturalAEntero: aNaturalNumber
	(aNaturalNumber  = l)
	ifTrue: [^1] .
	^(self pasarNaturalAEntero: aNaturalNumber previous) + 1
	! !


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

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 22:08:04'!
- aNaturalNumber
	self error: aNaturalNumber name , ' no puedo restarselo a l'! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 18:11:48'!
/ aNaturalNumber
	^(aNaturalNumber  divideA: self)! !

!l class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 21:53:02'!
< aNaturalNumber
	^aNaturalNumber  > self! !

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


!l class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
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

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 22:09:36'!
- aNaturalNumber
	(aNaturalNumber  < self) ifTrue: [	^aNaturalNumber restateA: self].
	self error: self name , ' es mas chico que ' , aNaturalNumber name , ' no se lo puedo restar'! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 17:54:44'!
/ aNaturalNumber
	^aNaturalNumber divideA: self! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 21:52:20'!
< aNaturalNumber
	^aNaturalNumber  > self! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/27/2023 16:56:15'!
> aNaturalNumber
	(aNaturalNumber = l)
	ifTrue: [^true] ifFalse: [^(self previous > aNaturalNumber  previous)].! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 21:55:02'!
divideA: aNaturalNumber
	"este codigo se divide en muchas partes debido a la falta de un 0"
	(self = aNaturalNumber )
	"si son iguales devuelvo uno"
	ifTrue: [^l] .
	(self < aNaturalNumber)
		"si es mayor hago recursion"
		ifTrue: [
			| pasoPrevio|.
			pasoPrevio :=aNaturalNumber - self.
			( pasoPrevio < self) ifTrue: [^l] 
			ifFalse: [^(self divideA: pasoPrevio) next]] .
	self error: aNaturalNumber name , ' es mas chico que ', self name , ' no se puede dividir'! !

!ll class methodsFor: 'as yet unclassified' stamp: 'psm 8/28/2023 21:13:39'!
next
	next ifNil:[next := ll createChildNamed: self name, 'l'].
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


!ll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := l.
	next := lll.! !


!classDefinition: #lll category: 'peano'!
ll subclass: #lll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'lll class' category: 'peano'!
lll class
	instanceVariableNames: ''!

!lll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := ll.
	next := llll.! !


!classDefinition: #llll category: 'peano'!
ll subclass: #llll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'llll class' category: 'peano'!
llll class
	instanceVariableNames: ''!

!llll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := lll.
	next := lllll.! !


!classDefinition: #lllll category: 'peano'!
ll subclass: #lllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'lllll class' category: 'peano'!
lllll class
	instanceVariableNames: ''!

!lllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := llll.
	next := llllll.! !


!classDefinition: #llllll category: 'peano'!
ll subclass: #llllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'llllll class' category: 'peano'!
llllll class
	instanceVariableNames: ''!

!llllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := lllll.
	next := lllllll.! !


!classDefinition: #lllllll category: 'peano'!
ll subclass: #lllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'lllllll class' category: 'peano'!
lllllll class
	instanceVariableNames: ''!

!lllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := llllll.
	next := llllllll.! !


!classDefinition: #llllllll category: 'peano'!
ll subclass: #llllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'llllllll class' category: 'peano'!
llllllll class
	instanceVariableNames: ''!

!llllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := lllllll.
	next := lllllllll.! !


!classDefinition: #lllllllll category: 'peano'!
ll subclass: #lllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'lllllllll class' category: 'peano'!
lllllllll class
	instanceVariableNames: ''!

!lllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := llllllll.
	next := llllllllll.! !


!classDefinition: #llllllllll category: 'peano'!
ll subclass: #llllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'llllllllll class' category: 'peano'!
llllllllll class
	instanceVariableNames: ''!

!llllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := lllllllll.
	next := lllllllllll.! !


!classDefinition: #lllllllllll category: 'peano'!
ll subclass: #lllllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'lllllllllll class' category: 'peano'!
lllllllllll class
	instanceVariableNames: ''!

!lllllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := llllllllll.
	next := llllllllllll.! !


!classDefinition: #llllllllllll category: 'peano'!
ll subclass: #llllllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'llllllllllll class' category: 'peano'!
llllllllllll class
	instanceVariableNames: ''!

!llllllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := lllllllllll.
	next := lllllllllllll.! !


!classDefinition: #lllllllllllll category: 'peano'!
ll subclass: #lllllllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'lllllllllllll class' category: 'peano'!
lllllllllllll class
	instanceVariableNames: ''!

!lllllllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := llllllllllll.
	next := llllllllllllll.! !


!classDefinition: #llllllllllllll category: 'peano'!
ll subclass: #llllllllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'llllllllllllll class' category: 'peano'!
llllllllllllll class
	instanceVariableNames: ''!

!llllllllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := lllllllllllll.
	next := lllllllllllllll.! !


!classDefinition: #lllllllllllllll category: 'peano'!
ll subclass: #lllllllllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'lllllllllllllll class' category: 'peano'!
lllllllllllllll class
	instanceVariableNames: ''!

!lllllllllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := llllllllllllll.
	next := llllllllllllllll.! !


!classDefinition: #llllllllllllllll category: 'peano'!
ll subclass: #llllllllllllllll
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'llllllllllllllll class' category: 'peano'!
llllllllllllllll class
	instanceVariableNames: ''!

!llllllllllllllll class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/28/2023 22:10:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	previous := lllllllllllllll.
	next := nil.! !

l initializeAfterFileIn!
ll initializeAfterFileIn!
lll initializeAfterFileIn!
llll initializeAfterFileIn!
lllll initializeAfterFileIn!
llllll initializeAfterFileIn!
lllllll initializeAfterFileIn!
llllllll initializeAfterFileIn!
lllllllll initializeAfterFileIn!
llllllllll initializeAfterFileIn!
lllllllllll initializeAfterFileIn!
llllllllllll initializeAfterFileIn!
lllllllllllll initializeAfterFileIn!
llllllllllllll initializeAfterFileIn!
lllllllllllllll initializeAfterFileIn!
llllllllllllllll initializeAfterFileIn!