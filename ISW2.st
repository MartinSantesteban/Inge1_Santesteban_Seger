!classDefinition: #XXX category: 'ISW2'!
Object subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW2'!

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 21:47:41'!
extractVowels

	^'sdlhdjsdjsfdejdeisa' select:[:char | char isVowel].! !

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 21:23:52'!
findDoubles
	
	| elements |
	
	elements := #(1 2 5 6 9).
	
	^elements collect:[:element | element  * 2]! !

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 21:31:19'!
findFirstEven

	|elements|
	
	elements := #(1 2 5 6 9).
	
	^elements detect:[:element | element even] ! !

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 21:36:38'!
findFirstEvenWithoutMatching

	|elements|
	
	elements := #(1 5 9).
	
	^elements detect:[:element | element even] ifNone: [42]! !

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 20:54:23'!
findOddsPart0

	|elements index odds|
	
	elements := #(1 2 5 6 9).
	
	odds := OrderedCollection new.
	index :=1.
	
	[index <= elements size]
	whileTrue:[
		((elements at: index) odd) ifTrue:[odds add: (elements at: index)].
		index := index +1.
		].
	^odds! !

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 21:24:19'!
findOddsPart1

	|elements odds|
	
	elements := #(1 2 5 6 9).
	
	odds := OrderedCollection new.
	
	elements do:[:element | element odd ifTrue:[odds add: element].].
	
	^odds! !

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 21:17:21'!
findOddsPart2

	|elements|
	
	elements := #(1 2 5 6 9).
	
	^elements select:[:element | element odd ].! !

!XXX methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 21:46:09'!
sumElementsInjecting

	^#(1 2 5 6 9) inject: 0 into: [:sum :elem | sum + elem].
	"^#(1 2 5 6 9) sum:[:elem | elem]"! !
