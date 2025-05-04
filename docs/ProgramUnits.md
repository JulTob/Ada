# Program Units

## 🦾 Specification and Body 💪

🎬 The distinction between a **specification** and a **body** allows a program to be designed, written, and tested as a set of largely independent software components.

## 📚 Libraries

- 📕 Program units of certain utility.    
- 📇 They are easily constructed in Ada, allowing simple and effective modularization.
- 📑 They structure hierarchically, enabling *decomposition*, *deconstructive*, *top-down*, and *bottom-up* styles of programming.

## 📦 Package

📦 The basic unit for a collection of logically related entities, such as type declarations and associated operations.

👩🏻‍🔧 Portions of a package can be hidden from the user.

🪖 A **protected unit** defines operations for the coordinated use of data shared between tasks. Simple mutual exclusion is automatic, while more elaborate sharing protocols can be defined. A protected operation can be:

* A **subprogram**
* An **entry** (with a Boolean barrier that must be true before execution)

A protected unit may define a single protected object or a protected type permitting multiple similar objects.

## 🏋️‍♀️ Body

🤸🏻‍♀️ The body of a program unit generally contains two parts:

1. A **declarative part**, which defines logical entities (types, constants, variables, exceptions, nested subprograms, packages, tasks, protected units, and generic units).
2. A **sequence of statements**, which defines the execution of the program unit.

🧘🏻‍♀️ The declarative part associates names with declared entities.

🏌🏻‍♀️ The sequence of statements describes actions to perform; statements execute in succession unless control is transferred elsewhere.

- ⛹🏻‍♀️ **Assignment** statements change the value of a variable.
- 🚴🏻‍♀️ **Procedure calls** invoke subprograms, associating actual parameters with formal parameters.
- 🧗🏻‍♀️ **Case** and **if** statements select among statement sequences based on values or conditions.
- 🚴🏻‍♀️ The **loop** statement provides iteration until an **exit** statement occurs.
- 🏊🏻‍♀️ A **block** statement groups statements with local declarations.

🚣🏻‍♀️ **Concurrent statements** include:

* **delay**: pauses a task until a specified time or duration.
* **entry call**: requests an operation on a task or protected object, blocking until available.
* **accept**: in a task, accepts an entry call and executes its body.
* **select** and **requeue**: allow selective or timed entry calls, asynchronous control transfers, and preference control among related services.

🪂 **Exception handling**: A program unit may include exception handlers that specify actions for error situations (e.g., numeric overflow, array bounds violation). Exceptions can also be raised explicitly with the `raise` statement.
