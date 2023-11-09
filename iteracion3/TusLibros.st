!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'psm 11/9/2023 13:29:54'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: (salesBook first total) = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #UserInterfaceTest category: 'TusLibros'!
TestCase subclass: #UserInterfaceTest
	instanceVariableNames: 'catalog stubGoodLogger stubBadLogger logger userID userPassword userInterface firstItem secondItem time notExpiredCreditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserInterfaceTest methodsFor: 'setUp' stamp: 'psm 11/9/2023 11:25:16'!
setUp
	
	userID := 'user ID'.
	
	userPassword := '1223345'.
	
	firstItem := 'first'.
	
	secondItem := 'second'.
	
	catalog := Dictionary newFromPairs: #('first' 340 'second' 500).
	
	stubGoodLogger := [ :username :password | true yourself ].
	
	stubBadLogger := [ :username :password | false yourself ].
	
	logger := stubGoodLogger .
	
	time := DateAndTime year: 2023 day: 200 hour: 0 minute: 0 second: 0.
	
	userInterface := UserInterface logger: self catalog: catalog clock: self merchantProcessor: self.
	
	notExpiredCreditCard := Month month: 12 year: 2024.
	
	! !


!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test01_InterfaceGivesACartIdFromValidUser

	 
	
	logger := stubGoodLogger .
	
	self assert: ((userInterface createCartForUser: userID password: userPassword ) isKindOf: CartId).! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test02_interfaceRaiseExeptionWhenCreatingCartFromInvalidUser
	
	logger := stubBadLogger .
	
	self 
		should:[userInterface createCartForUser: userID password: userPassword ]  
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: UserInterface invalidUserErrorMessage]! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test03_listCartOfEmptyCartReturnEmptyList

	| aCartID |
	
	aCartID := userInterface createCartForUser: userID password: userPassword.
	
	self assert: (userInterface listCart: aCartID) equals: OrderedCollection new.
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test04_ListCartWithItemsWorks

	| aCartID |
	
	aCartID := userInterface createCartForUser: userID password: userPassword.
	
	userInterface addToCart: aCartID item: firstItem quantity: 3.
	userInterface addToCart: aCartID item: secondItem quantity: 5.
	
	self assert: (userInterface listCart: aCartID) equals: (OrderedCollection with: firstItem with: 3 with: secondItem with: 5).
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 09:46:40'!
test05_cannotListCartFromInvalidID

	self 
		should: [userInterface addToCart: CartId new item: firstItem quantity: 1] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: UserInterface invalidCartErrorMessage]
	
	
	
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test06_cannotAddToCartAfter30Minutes

	| aCartID |
	
	aCartID := userInterface createCartForUser: userID password: userPassword.
	
	userInterface addToCart: aCartID item: firstItem quantity: 3.
	userInterface addToCart: aCartID item: secondItem quantity: 5.
	
	time := time + (Duration minutes: 31).
	
	self 
		should: [userInterface addToCart: aCartID item: secondItem quantity: 1.] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: UserInterface cartTimedOutErrorMessage.
				time := time - (Duration minutes: 30).
				self assert: (userInterface listCart: aCartID) equals: (OrderedCollection with: firstItem with: 3 with: secondItem with: 5).]
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test07_canAddToCartInShortIntervalosOfTime

	| aCartID |
	
	aCartID := userInterface createCartForUser: userID password: userPassword.
	
	userInterface addToCart: aCartID item: firstItem quantity: 3.
	
	time := time + (Duration minutes: 15).
	
	userInterface addToCart: aCartID item: secondItem quantity: 5.
	
	time := time + (Duration minutes: 16).
	
	self 
		shouldnt:  [userInterface addToCart: aCartID item: secondItem quantity: 1.] 
		raise: Error - MessageNotUnderstood .
	
	self assert: (userInterface listCart: aCartID) equals: (OrderedCollection with: firstItem with: 3 with: secondItem with: 6).! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test08_cannotCheckoutEmptyCard

	| aCartID |
	
	aCartID := userInterface createCartForUser: userID password: userPassword.
	
	self 
		should:[userInterface checkOutCart: aCartID creditcard: (CreditCard expiringOn: notExpiredCreditCard)] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage].
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:49:18'!
test09_checkoutOfCardWorks

	| aCartID total |
	
	aCartID := userInterface createCartForUser: userID password: userPassword.
	
	userInterface addToCart: aCartID item: firstItem quantity: 1.
	userInterface addToCart: aCartID item: secondItem quantity: 1.
	
	total := userInterface checkOutCart: aCartID creditcard: (CreditCard expiringOn: notExpiredCreditCard).
	
	self assert: total equals: 840.
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 13:44:54'!
test10_validUserHasEmptyPurchases
	
	self assert: (userInterface listPurchaseForUser: userID password: userPassword) equals: (OrderedCollection with: 0).	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 11:52:00'!
test11_invalidUserCantAccessPurchases

	logger := stubBadLogger .
	
	self 
		should:[ userInterface listPurchaseForUser: userID password: userPassword ]  
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | self assert: anError messageText equals: UserInterface invalidUserErrorMessage]
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 13:47:26'!
test12_purchaseFromCartDisplayedInPurchaseListForOneClient

	| aCartID |
	
	aCartID := userInterface createCartForUser: userID password: userPassword.
	
	userInterface addToCart: aCartID item: firstItem quantity: 1.
	userInterface addToCart: aCartID item: secondItem quantity: 1.
	
	userInterface checkOutCart: aCartID creditcard: (CreditCard expiringOn: notExpiredCreditCard).
	
	self assert: (userInterface listPurchaseForUser: userID password: userPassword) equals: 
		(OrderedCollection 
			with: firstItem 
			with: 1
			with: secondItem 
			with: 1
			with: 840)
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 13:47:35'!
test13_purchaseFromMultipleCartsDisplayedInPurchaseList

	| currentCartID |
	
	currentCartID := userInterface createCartForUser: userID password: userPassword.
	
	userInterface addToCart: currentCartID item: firstItem quantity: 1.
	
	userInterface checkOutCart: currentCartID creditcard: (CreditCard expiringOn: notExpiredCreditCard).
	
	currentCartID := userInterface createCartForUser: userID password: userPassword.
	userInterface addToCart: currentCartID item: secondItem quantity: 1.
	
	userInterface checkOutCart: currentCartID creditcard: (CreditCard expiringOn: notExpiredCreditCard).
	
	self assert: (userInterface listPurchaseForUser: userID password: userPassword) equals: 
		(OrderedCollection 
			with: firstItem 
			with: 1
			with: secondItem 
			with: 1
			with: 840)
	
	! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'psm 11/9/2023 13:54:04'!
test14

	| currentCartID |
	
	currentCartID := userInterface createCartForUser: userID password: userPassword.
	
	userInterface addToCart: currentCartID item: firstItem quantity: 1.
	
	userInterface checkOutCart: currentCartID creditcard: (CreditCard expiringOn: notExpiredCreditCard).
	
	currentCartID := userInterface createCartForUser: 'nuevo Uusario' password: userPassword.
	userInterface addToCart: currentCartID item: secondItem quantity: 1.
	
	userInterface checkOutCart: currentCartID creditcard: (CreditCard expiringOn: notExpiredCreditCard).
	
	self assert: (userInterface listPurchaseForUser: userID password: userPassword) equals: 
		(OrderedCollection 
			with: firstItem 
			with: 1
			with: 340)
	
	! !


!UserInterfaceTest methodsFor: 'polimorfic to userLogger' stamp: 'psm 11/6/2023 20:08:22'!
validUser: username password: password

	^logger value: username value: password .! !


!UserInterfaceTest methodsFor: 'polimorfic to clock' stamp: 'psm 11/9/2023 09:51:14'!
now

	^time! !


!UserInterfaceTest methodsFor: 'polimorfic to merchant processor' stamp: 'psm 11/9/2023 11:25:04'!
debit: anAmount from: aCreditCard 

	! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'psm 11/6/2023 21:15:37'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'queries' stamp: 'psm 11/9/2023 12:58:18'!
items

	^items copy.! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #CartId category: 'TusLibros'!
Object subclass: #CartId
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'psm 11/9/2023 13:24:44'!
calculateTotal

	total := cart total .
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'psm 11/9/2023 13:02:09'!
createSale

	^ Sale products: cart items of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'productList total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'show' stamp: 'psm 11/9/2023 14:12:54'!
products
	
	^ productList copy! !

!Sale methodsFor: 'show' stamp: 'psm 11/9/2023 13:34:35'!
total

	^total ! !


!Sale methodsFor: 'testing' stamp: 'psm 11/9/2023 14:12:54'!
= aSale

	^productList = aSale products and: [total = aSale total].! !


!Sale methodsFor: 'initialization' stamp: 'psm 11/9/2023 14:12:41'!
initializeProductList: aProductList total: aTotal

	productList := aProductList.
	total := aTotal .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'psm 11/9/2023 13:14:27'!
products: aProductList of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeProductList: aProductList total: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: 'TusLibros'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!classDefinition: #UserInterface category: 'TusLibros'!
Object subclass: #UserInterface
	instanceVariableNames: 'userLogger catalog clock carts clientTickets merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 10:58:19'!
addToCart: aCartID item: anItem quantity: aQuantity

	 (self cartForID: aCartID)	add: aQuantity of: anItem .
	! !

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 11:48:52'!
assertValidUser: username password: password 
	
	(userLogger validUser: username password: password) ifFalse: [self error: self class invalidUserErrorMessage].! !

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 10:57:38'!
cartForID: aCartID 
	
	^carts at: aCartID ifAbsent: [self error: self class invalidCartErrorMessage ].! !

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 14:05:22'!
checkOutCart: aCartID creditcard: aCreditCard 

	| aCart |
	
	aCart := (self cartForID: aCartID).

	^(Cashier toCheckout: aCart charging: aCreditCard throught: merchantProcessor on: clock now registeringOn: (clientTickets at: aCart client)) checkOut.

! !

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 14:10:01'!
createCartForUser: userID password: password 
	
	| cartId |
	
	self assertValidUser: userID password: password.
	
	cartId := CartId new.
	
	carts at: cartId  put: (CartWrapper cartForUser: userID acceptingItemsOf: catalog clock: clock).
	
	clientTickets at: userID ifAbsent:[clientTickets at: userID put: OrderedCollection new].
	
	^cartId! !

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 14:07:46'!
initilizeLog: aUserLogger catalog: aCatalog clock: aClock merchantProcessor: aMerchantProcessor  
	
	userLogger := aUserLogger.
	catalog := aCatalog.
	clock := aClock.
	merchantProcessor := aMerchantProcessor.
	
	carts := Dictionary new.
	clientTickets := Dictionary new.! !

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 13:00:10'!
listCart: aCartID 
	
	| cart |
	cart := self cartForID: aCartID.
	
	^cart items asSet inject: OrderedCollection new into:[:currentItemList :anItem | currentItemList add: anItem; add: (cart occurrencesOf: anItem); yourself]! !

!UserInterface methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 14:13:53'!
listPurchaseForUser: aUserID password: aPassword 
	
	| total products sales|
	
	self assertValidUser: aUserID password: aPassword.
	
	sales := clientTickets at: aUserID ifAbsent:[^OrderedCollection with: 0].
	
	total := 0.
	
	products := Bag new.
	
	sales inject: products into: [:totalProducts :aTicket| total := total + aTicket total.totalProducts addAll: aTicket products; yourself].
	
	^(products asSet inject: OrderedCollection new into:[:currentItemList :anItem | currentItemList add: anItem; add: (products occurrencesOf: anItem); yourself]) add: total;yourself .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UserInterface class' category: 'TusLibros'!
UserInterface class
	instanceVariableNames: ''!

!UserInterface class methodsFor: 'initialization' stamp: 'psm 11/9/2023 11:10:13'!
logger: aUserLogger catalog: aCatalog clock: aClock merchantProcessor: aMerchantProcessor  
	^self new initilizeLog: aUserLogger catalog: aCatalog clock: aClock merchantProcessor: aMerchantProcessor .! !


!UserInterface class methodsFor: 'error message' stamp: 'psm 11/9/2023 10:29:52'!
cartTimedOutErrorMessage
	
	^'cart has timed out create new cart to continue'! !

!UserInterface class methodsFor: 'error message' stamp: 'psm 11/6/2023 21:44:32'!
invalidCartErrorMessage
	
	^'this cart does not exist'! !

!UserInterface class methodsFor: 'error message' stamp: 'psm 11/6/2023 20:36:47'!
invalidUserErrorMessage
	^'incorrect username or password'! !


!classDefinition: #CartWrapper category: 'TusLibros'!
ProtoObject subclass: #CartWrapper
	instanceVariableNames: 'cart client clock timeStamp'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartWrapper methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 14:00:33'!
client
	^client! !

!CartWrapper methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 10:45:35'!
doesNotUnderstand: aMessage

	(clock now - timeStamp) > (Duration minutes: 30) 
		ifTrue: [^Error new signal: UserInterface cartTimedOutErrorMessage.].

	timeStamp := clock now.

	^aMessage sendTo: cart.! !

!CartWrapper methodsFor: 'as yet unclassified' stamp: 'psm 11/9/2023 13:59:53'!
initilizeWithClient: aClient Catalog: aCatalog clock: aClock

	client := aClient.
	cart := Cart acceptingItemsOf: aCatalog.
	clock := aClock.
	timeStamp := clock now.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartWrapper class' category: 'TusLibros'!
CartWrapper class
	instanceVariableNames: ''!

!CartWrapper class methodsFor: 'instance creation' stamp: 'psm 11/9/2023 13:58:01'!
cartForUser: aClient acceptingItemsOf: aCatalog clock: aClock

	^self new initilizeWithClient: aClient Catalog: aCatalog clock: aClock.! !
