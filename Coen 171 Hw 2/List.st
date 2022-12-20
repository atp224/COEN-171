Object subclass: #List
    instanceVariableNames: 'first'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'examples'!


"We don't have any class methods here.  Saying 'List new' will create a new
 list object and initialize first to nil, which is what we want anyway."


!List methodsFor: 'adding'!

addFirst: anObject
    first := (Node data: anObject) linkTo: first
!

addLast: anObject
    | current |
    first isNil
	ifTrue: [first := Node data: anObject]
	ifFalse: [
	    current := first .
	    [ current link isNil ] whileFalse: [ current := current link ] .
	    current linkTo: (Node data: anObject) ]
!!


!List methodsFor: 'removing'!

removeFirst
    | data |
    first = nil ifFalse: [data := first data . first := first link].
    ^data
!

removeLast
    | current fred |
    first isNil ifTrue: [^nil] .

    current := first .
    [ current link isNil ]
	whileFalse: [ fred := current . current := current link ] .
    fred isNil ifTrue: [ first := nil ] ifFalse: [ fred linkTo: nil ] .
    ^current data
!!


!List methodsFor: 'enumerating'!

do: aBlock
    "Note that sending a code block the 'value' message executes the block
     with the given parameter."

    | current |
    current := first .
    [ current isNil ]
	whileFalse: [aBlock value: current data . current := current link]
!!


"Add x to the Smalltalk dictionary for the same reason as in Complex.st."

Smalltalk at: #x put: nil .

x := List new .
1 to: 4 do: [ :y | x addLast: y] .
x do: [:value | value printNl] .
x removeLast printNl .
x removeLast printNl .
x removeLast printNl .
x removeLast printNl .
x removeLast printNl .
