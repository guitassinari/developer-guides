---
name: code-smell-and-heuristics
description: Code smells and heuristics taken from Robert C. Martin's book "Clean Code". Use when reviewing and refactoring code and after an implementation to find possible improvements.
---


# Heuristics

## Comments

- **C1 - Inappropriate Information**
  - It's inappropriate for a comment to hold information better held in a different kind of system such as git, issue tracking, or any other record keeping system.
- **C2 - Obsolete Comment**
  - Do not write a comment that can get obsolete. They tend to get away from the code they initially described.
- **C3 - Redundant Comment**
  - Comments should say things that code can not say by itself.
- **C4 - Poorly Written Comment**
  - If you are going to write a comment make sure to take the time to write the best comment you can.
- **C5 - Commented-Out Code**
  - Don't suffer commented out code to survive. Source control can have it.

## Environment

- **E1 - Build Required More Than One Step**
  - You should be able to check out the system with one simple command and then issue one other command to build it.
- **E2 - Tests Require More Than One Step**
  - You should be able to run all the unit tests with just one command. Being able to run all thests is so fundamental and so important that it should be quick, easy and obvious to do so.

## Functions

- **F1 - Too Many Arguments**
  - Functions should have a small number of arguments. Zero is the best! Followed by one, two, then three etc.
- **F2 - Output Arguments**
  - Output arguments is counterintuitive. Readers expect to be inputs not outputs. If function has to change the state of something, have it change it's own object.
- **F3 - Flag Arguments**
  - Boolean arguments loudly declare that the function is doing more than one thing. Better split it in two functions each one performing the actions of either true or false state.
- **F4 - Dead Function**
  - Methods that are never used should be discarded. Keeping dead code is wasteful. Don't be afraid to delete it.

## General

- **G1 - Multiple Languages In One Source File**
  - The source code ideally should contain only one programming language.
- **G2 - Obvious Behavior Is Unimplemented**
  - When an obvious behavior is not implemented, readers and users of the code can no longer depend on their intuition of the function names.
- **G3 - Incorrect Behavior At The Boundaries**
  - Don't rely on your intuition. Look for every boundary condition and write a respective test for it.
- **G4 - Overriden Safeties**
  - Turning of compiler warnings or failing tests is as bad as pretending your credit cards are "free money".
- **G5 - Duplication**
  - D(on't) R(epeat) Y(ourself). Find and eliminate duplication.
- **G6 - Code At Wrong Level Of Abstraction**
  - All lower level concepts should be derivatives while all the higher level concepts sould be in the base class.
- **G7 - Base Classes Depending On Their Derivatives**
  - Base classes should know nothing about their derivatives.
- **G8 - Too Much Information**
  - Well defined modules have very small interfaces that allow you to do a lot with little. Poorly ones have wide and deep interfaces that forces you to use a lot to do little.
  - A well defined interface does not offer very many functions to depend upon, so coupling is always low. A poorly defined interface provides lots of functions that you must call, so coupling is high.
  - The fewer methods a class has, the better. THe fewer variables a function knows about, the better. The fewer instance variables a class has, the better.
- **G9 - Dead Code**
  - When you find dead code do the right thing : "Give it a decent burial". Delete it from the system.
- **G10 - Vertical Variables**
  - Variables and functions should be close to where they are used.
- **G11 - Inconsistency**
  - If you do something on a certain way, do all similar things in the same way. Simple consistency like this, when reliably applied, can make code much easier to read and modify.
- **G12 - Clutter**
  - Keep your source files clean, well organized and free of clutter.
- **G13 - Artificial Coupling**
  - Take the time to figure out where functions, constants and variables ought to be declared. Don't just toss them in the most convenient place at hand and then leave them there.
- **G14 - Feature Envy**
  - The methods of a class should be interested in the variables and functions they belong to and not the variables and funcitons of other classes.
  - We want to eliminate feature envy because it exposes the internals of one class to another.
- **G15 - Selector Arguments**
  - It is better to have many functions than to pass some code into a function to select the behavior.
- **G16 - Obscured Intent**
  - It is worth taking the time to make the intent of our code visible to our readers.
- **G17 - Misplaced Responsibility**
  - One of the most important decisions a software developer can make is where to put code. The principle of the least surprise comes into play here.
- **G18 - Inappropriate Static**
  - In general, you should prefer non-static methods. When in doubt, make the function non-static. If you really need a static, make sure you don't make/want it to behave polymorphically.
- **G19 - Use Explanatory Variables**
  - One of the more powerful ways to make a program readable is to break calculations up to intermediate values that are held in variables whith meaningful names.
- **G20 - Function Names Should Say What The Do**
  - If you have to look at the implementation (or documentation) to understand what a funcion does, then you should work on finding a better name or rearrange the functionality so that i can be placed into functions with better names.
- **G21 - Understand The Algorithm**
  - Before you consider yourself to be done with a function, make sure you understand how it works. You must know that the solution is correct. Not simply it passes the tests.
- **G22 - Make Logical Dependencies Physical**
  - If one module depends upon another, that dependency should be physical, not just lofical.
  - The dependent module should not make assumptions (logical dependencies) about the module it depends upon.
  - The dependent module should explicitly ask the module it depends upon about all the information it depends upon.
- **G23 - Prefer Polymorphism To If/Else Or Switch/Case**
  - [One Switch Rule] There may be no more than one switch statement for a given type of selection. The cases in that switch must create polymorphic objects that take the place of other such switch statements in the rest of the system.
- **G24 - Follow Standard Conventions**
  - Every term should follow a coding standard based on common industry norms. There is no need for a document to describe them, because the code itself provides examples.
- **G25 - Replace Magic Numbers With Named Constants**
  - Magic numbers/values should be hidden behind well named constant variables.
- **G26 - Be Precise**
  - Ambiguities and imprecision in code are either a result of disagreement or laziness. In either case they should be eliminated.
- **G27 - Structure Over Convention**
  - Enforce design decisions with structure over conventions.
- **G28 - Encapsulate Conditionals**
  - Extract functions that explain the intent of conditional case.

    | State  | Code                                                    |
    | :----: | :------------------------------------------------------ |
    | Prefer | `if (shouldBeDeleted(timer)) {...}`                     |
    |  Than  | `if (timer.hasExpired() and !time.isRecurrent()) {...}` |

- **G29 - Avoid Negative Conditions**
  - Negatives are just a bit harder to understand than positives. So, when possible, conditionals should be expressed as positives.

    | State  | Code                                    |
    | :----: | :-------------------------------------- |
    | Prefer | `if (buffer.shouldCompact()) {...}`     |
    |  Than  | `if (!buffer.shouldNotCompact()) {...}` |

- **G30 - Functions Should Do One Thing**
  - Functions with multiple sections do multiple things and should be converted to many smaller functions that do one thing and only that.
- **G31 - Hiddel Temporal Couplings**
  - Temporal couplings are often necessary, but you should not hide the coupling.
- **G32 - Don't Be Arbitrary**
  - Have a reason for the way you structure your code and make sure that reason is communicated by the structure of your code.
- **G33 - Encapsulate Boundary COnditions**
  - Put the processing of boundary conditions in one place, as they are difficult to keep track of.
- **G34 - Functions Should Descend Only One Level Of Abstractions**
  - The statements within a function should all be written at the same level of abstraction, which should be one level below the operation described by the function's name.
  - Separating levels of abstractions is one of the most important functions of refactoring and it's one of the hardests to do as well.
- **G35 - Keep Configurable Data At High Levels**
  - If you have constant such as a default configuration value that is known and expected at a high level of abstraction do not bury it in a low level function. Expose it as an argument in the low level functions.
- **G36 - Avoid Transitive Navigaiton**
  - We need to make sure that models know only about the immediate collaborators and do not know the navigation map of the whole system.

## Names

- **N1 - Choose Descriptive Names**
  - Make sure the name is descriptive. Remember that meanings tend to drift as software evolves, so freaquently re-evaluate the appropriateness of the names you have chosen.
- **N2 - Chosse Names At The Appropriate Level Of Abstraction**
  - Don't pick names that communicate implementation. Choose names that reflect the level of abstraction of the class or the function you are working on.
- **N3 - Use Standard Nomenclature Where Possible**
  - Names are easier to understand if they are based on existing convention or usage.
  - The more you can use names that are overloaded with special meanings that are relevant to your project, the easier it will be for the readers to know what your code is talking about.
- **N4 - Unambiguous Names**
  - Choose names that make the workings of a function or a variable unambiguous.
- **N5 - Use Long Names For Long Scopes**
  - The length of a name should be related to the length of its scope. You can use a short name for variables with tiny scopes, but for big scopes you should use large names.
- **N6 - Avoid Encodings**
  - Names should not be encoded with type or scope information.
- **N7 - Names Should Describe Side-Effects**
  - Names should describe everything that a function variable or class is or does.

## Tests

- **T1 - Insufficient Tests**
  - A test suite should test everything that could possibly break.
- **T2 - Use A Test Coverage Tool**
  - Test coverage tools report on gaps in your testing strategy. They make it easy to find modules, classes and functions that are insufficiently tested.
- **T3 - Don't Skip Trivial Tests**
  - Don't skip trivial tests. They are easy to write and their documentary value is higher than the cost to produce them.
- **T4 - An Ignored Test Is A Question About An Ambiguity**
  - We can express our question about the requirements as a test that is commented out or as a test that is marked as incomplete/ignored.
- **T5 - Test Boundary Conditions**
  - Take special care to test boundary conditions. We often get the middle of an algorithm right but misjudge the boundaries.
- **T6 - Exhaustively Test Near Bugs**
  - When you find a bug on a function, it is wise to do an exhaustive test of that function.
- **T7 - Patterns Of Failure Are Revealing**
  - Sometimes you can diagnose a problem by finding patterns in the way the test cases fail. This is another argument for making the test cases as complete as possible.
  - Complete test cases, ordered in a reasonable way, expose patterns.
- **T8 - Test Coverage Patterns Can Be Revealing**
  - Looking at the code that is or is not executed by the passing tests gives clues to why the failing tests are actually failing.
- **T9 - Tests Should Be Fast**
  - A slow test is one that will not get running. When things get tight it is the slow tests that get rid off the suite. So, do what you must to keep the tests running fast.
