"
It is stepper for Adams - Bashforth method of order 2.  We can't use AB2 method until we have two old solution values. A AB2 method is explicit. We found starting point with Midpoint Method (RK2).
"
Class {
	#name : #AB2Stepper,
	#superclass : #ExplicitMultiStepper,
	#category : 'Math-ODE'
}

{ #category : #'as yet unclassified' }
AB2Stepper class >> order [
	"AB2 is a second order method."
	^ 2
]

{ #category : #stepping }
AB2Stepper >> doStep: aState prevState: prevState time: t [
	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].
	^ (self stepSize / 2) * (3 * (system state: aState time: t) - (system state: prevState time: t - self stepSize)) + aState
]

{ #category : #stepping }
AB2Stepper >> doStep: aState prevState: prevState time: t  stepSize: timeStep [

	self stepSize: timeStep.
	^ self doStep: aState prevState: prevState time:  t  .
]

{ #category : #stepping }
AB2Stepper >> lastStep: aState prevState: prevState time: t deltaT: incrementOfTime [

	self stepSize isNil
		ifTrue: [ self error: 'step size required by stepper' ].

	^ self stepSize / 2 * (3 * (system state: aState time: t) - (system state: prevState time: t - incrementOfTime)) + aState
]

{ #category : #stepping }
AB2Stepper >> lastStep: aState prevState: prevState time: t  stepSize: timeStep deltaT: incrementOfTime [

	self stepSize: timeStep.
	^ self lastStep: aState prevState: prevState time:  t deltaT: incrementOfTime .
]
