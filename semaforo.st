!classDefinition: #SeñalDeAvanceDeCorrientes category: 'semaforo'!
Light subclass: #SeñalDeAvanceDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeCorrientes class' category: 'semaforo'!
SeñalDeAvanceDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:12:50'!
apagar
	self color: Color black.
	^self! !

!SeñalDeAvanceDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:21:48'!
prender
	self color: Color green.
	^self! !


!SeñalDeAvanceDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeAvanceDeMaipu category: 'semaforo'!
Light subclass: #SeñalDeAvanceDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeAvanceDeMaipu class' category: 'semaforo'!
SeñalDeAvanceDeMaipu class
	instanceVariableNames: ''!

!SeñalDeAvanceDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:13:03'!
apagar
	self color: Color black.
	^self! !

!SeñalDeAvanceDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:21:55'!
prender
	self color: Color green.
	^self! !


!SeñalDeAvanceDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeCorrientes category: 'semaforo'!
Light subclass: #SeñalDeDetencionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeCorrientes class' category: 'semaforo'!
SeñalDeDetencionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDeDetencionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:13:27'!
apagar
	self color: Color black.
	^self! !

!SeñalDeDetencionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:22:12'!
prender
	self color: Color red.
	^self! !


!SeñalDeDetencionDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeDetencionDeMaipu category: 'semaforo'!
Light subclass: #SeñalDeDetencionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeDetencionDeMaipu class' category: 'semaforo'!
SeñalDeDetencionDeMaipu class
	instanceVariableNames: ''!

!SeñalDeDetencionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:13:38'!
apagar
	self color: Color black.
	^self! !

!SeñalDeDetencionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:22:19'!
prender
	self color: Color red.
	^self! !


!SeñalDeDetencionDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecuacionDeCorrientes category: 'semaforo'!
Light subclass: #SeñalDePrecuacionDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecuacionDeCorrientes class' category: 'semaforo'!
SeñalDePrecuacionDeCorrientes class
	instanceVariableNames: ''!

!SeñalDePrecuacionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 17:30:39'!
apagar
	self color: Color black.
	^self! !

!SeñalDePrecuacionDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 17:30:33'!
prender
	self color: Color yellow.
	^self! !


!SeñalDePrecuacionDeCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDeSemaforo category: 'semaforo'!
Light subclass: #SeñalDeSemaforo
	instanceVariableNames: 'colorDeprendido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

!SeñalDeSemaforo methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 19:16:02'!
apagar

	self color: Color black! !

!SeñalDeSemaforo methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 19:15:34'!
prender

	self color: colorDeprendido ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDeSemaforo class' category: 'semaforo'!
SeñalDeSemaforo class
	instanceVariableNames: ''!

!SeñalDeSemaforo class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #SeñalDePrecuacionDeMaipu category: 'semaforo'!
SeñalDeSemaforo subclass: #SeñalDePrecuacionDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeñalDePrecuacionDeMaipu class' category: 'semaforo'!
SeñalDePrecuacionDeMaipu class
	instanceVariableNames: ''!

!SeñalDePrecuacionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:12:29'!
apagar
	self color: Color black.
	^self! !

!SeñalDePrecuacionDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:12:29'!
prender
	self color: Color yellow.
	^self! !


!SeñalDePrecuacionDeMaipu class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #ReguladorDeTransitoDeCorrientes category: 'semaforo'!
DenotativeObject subclass: #ReguladorDeTransitoDeCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransitoDeCorrientes class' category: 'semaforo'!
ReguladorDeTransitoDeCorrientes class
	instanceVariableNames: ''!

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:28:16'!
apagarSeñalDePrecaucion
	^SeñalDePrecuacionDeCorrientes apagar! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:57:36'!
apagarSeñales
	SeñalDeAvanceDeCorrientes apagar.
	SeñalDeDetencionDeCorrientes apagar.
	SeñalDePrecuacionDeCorrientes  apagar.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:41:48'!
detenerTransito
	^SeñalDeDetencionDeCorrientes prender.! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 19:23:07'!
permitirTransito
	SeñalDeDetencionDeCorrientes apagar.
	SeñalDePrecuacionDeCorrientes prender.
	(Delay for: 0.2 * second) wait.
	SeñalDePrecuacionDeCorrientes apagar .
	SeñalDeAvanceDeCorrientes prender.
	(Delay for: 1 * second) wait.
	SeñalDeAvanceDeCorrientes apagar.
	SeñalDePrecuacionDeCorrientes prender.
	(Delay for: 0.2 * second) wait.
	SeñalDePrecuacionDeCorrientes apagar .! !

!ReguladorDeTransitoDeCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:28:06'!
prenderSeñalDePrecaucion
	^SeñalDePrecuacionDeCorrientes prender! !


!classDefinition: #ReguladorDeTransitoDeMaipu category: 'semaforo'!
DenotativeObject subclass: #ReguladorDeTransitoDeMaipu
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReguladorDeTransitoDeMaipu class' category: 'semaforo'!
ReguladorDeTransitoDeMaipu class
	instanceVariableNames: ''!

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:29:04'!
apagarSeñalDePrecaucion
	^SeñalDePrecuacionDeMaipu apagar ! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:57:13'!
apagarSeñales
	SeñalDeAvanceDeMaipu apagar.
	SeñalDeDetencionDeMaipu apagar.
	SeñalDePrecuacionDeMaipu  apagar.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:42:02'!
detenerTransito
	^SeñalDeDetencionDeMaipu prender.! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 19:22:16'!
permitirTransito
	SeñalDeDetencionDeMaipu apagar.
	SeñalDePrecuacionDeMaipu  prender.
	(Delay for: 0.2 * second) wait.
	SeñalDePrecuacionDeMaipu  apagar .
	SeñalDeAvanceDeMaipu  prender.
	(Delay for: 1 * second) wait.
	SeñalDeAvanceDeMaipu  apagar.
	SeñalDePrecuacionDeMaipu  prender.
	(Delay for: 0.2 * second) wait.
	SeñalDePrecuacionDeMaipu  apagar .! !

!ReguladorDeTransitoDeMaipu class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:28:57'!
prenderSeñalDePrecaucion
	^SeñalDePrecuacionDeMaipu prender! !


!classDefinition: #SemaforoDeMaipuYCorrientes category: 'semaforo'!
DenotativeObject subclass: #SemaforoDeMaipuYCorrientes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SemaforoDeMaipuYCorrientes class' category: 'semaforo'!
SemaforoDeMaipuYCorrientes class
	instanceVariableNames: 'prendido'!

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:40:50'!
apagar
	^prendido := False! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:52:34'!
apagarSeñales
	ReguladorDeTransitoDeCorrientes apagarSeñales.
	ReguladorDeTransitoDeMaipu apagarSeñales.
	^self apagar! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:22:58'!
avisarPrecaucion
	ReguladorDeTransitoDeCorrientes  prenderSeñalDePrecaucion.
	ReguladorDeTransitoDeMaipu  prenderSeñalDePrecaucion.
	(Delay for: 0.5*second) wait.
	ReguladorDeTransitoDeCorrientes  apagarSeñalDePrecaucion.
	ReguladorDeTransitoDeMaipu  apagarSeñalDePrecaucion.
	(Delay for: 1*second) wait.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:29:28'!
avisarPrecaucionPorEncendido

	5 timesRepeat: [self avisarPrecaucion ]! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:35:22'!
detenerTransitoEn: reguladorADetener yPermitirEn: reguladorAPermitir
	
	reguladorADetener detenerTransito.
	reguladorAPermitir permitirTransito.! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 18:52:54'!
prender

	prendido := True.
	
	^self 
		avisarPrecaucionPorEncendido;
		regularTransito 
	! !

!SemaforoDeMaipuYCorrientes class methodsFor: 'as yet unclassified' stamp: 'psm 8/31/2023 19:25:17'!
regularTransito

 	[prendido] whileTrue:[
		self detenerTransitoEn: ReguladorDeTransitoDeCorrientes yPermitirEn: ReguladorDeTransitoDeMaipu .
		self detenerTransitoEn: ReguladorDeTransitoDeMaipu yPermitirEn: ReguladorDeTransitoDeCorrientes. ].! !


!SemaforoDeMaipuYCorrientes class methodsFor: '--** private fileout/in **--' stamp: 'psm 8/31/2023 20:08:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	prendido := True.! !

SeñalDeAvanceDeCorrientes initializeAfterFileIn!
SeñalDeAvanceDeMaipu initializeAfterFileIn!
SeñalDeDetencionDeCorrientes initializeAfterFileIn!
SeñalDeDetencionDeMaipu initializeAfterFileIn!
SeñalDePrecuacionDeCorrientes initializeAfterFileIn!
SeñalDeSemaforo initializeAfterFileIn!
SeñalDePrecuacionDeMaipu initializeAfterFileIn!
SemaforoDeMaipuYCorrientes initializeAfterFileIn!