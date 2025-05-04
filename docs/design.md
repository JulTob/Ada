# The Design of Ada

👩🏻‍💻 It should not be thought that Ada is just another programming language.   

👩🏻‍🔧 **Ada is about Software Engineering**, and by analogy, with other branches of engineering, it can be seen that there are two main problems with the development of software: the need to reuse software components as much as possible and the need to establish **disciplined ways of working**.

👾 As an example, Ada can be written in limited resource computers, such as 7 bit-characters systems. This means that a program can be developed (and probably run) in systems with any keyboard without non-ordinary characters (sometimes missing in other languages) such as '{', '[','$'...

😁 But Ada can also adapt to any development style, as all Latin-1 characters, ISO Basic Multilingual (Arabic, Russian, Greek…), Ascii, Unicode... are all supported. You can even use emojis in identifiers!


👩🏻‍✈️ Ada es un lenguaje moderno diseñado para facilitar la escritura de aplicaciones de tiempo real y la programación de sistemas grandes <sup>1.1</sup> (programas de varios millones de líneas).    
👩🏻‍🔧 Va a permitir expresar de una manera amigable complejos conceptos de programación. Además, Ada tiene muchas características que ayudan a prevenir y detectar rápidamente los errores de programación.   
> 1.1 Esto se conoce técnicamente como ''Programación a gran escala'' (en inglés "programming in the large") 

🧚🏻‍♀️ Ada has built-in language support for explicit concurrency, offering tasks, synchronous message passing, protected objects, and non-determinism. 

🧙🏻‍♀️ Ada **incorporates the benefits of object-oriented** languages without incurring the pervasive overheads.

👮🏻‍♀️ Other notable features of Ada include: **strong typing**, **inherent reliability**, **modularity mechanisms** (packages), run-time checking, **parallel processing**, built in **exception handling**, the ability to provide **abstraction** through the package and **private type**, and **generics**.

💂🏻‍♀️ Ada is particularly strong in areas such as **real-time applications**, **low-level hardware access**, and **safety-critical** software, as it has specialized design features, and **high reliability**.

🕵🏻‍♀️ **Most errors are detected at compile-time** and of those remaining many are detected by **runtime** **constraints**. 

With its **readability, scalability**, and being designed for **development of very large software systems**, Ada is a **good choice for open source development**.

The need for languages that promote reliability and simplify maintenance is well established. Hence emphasis was placed on program readability over ease of writing. 

Being a direct low level language, Ada provides ample support for Real-time multiprocessor systems. Also providing services such as time predictability, inter-task communication (by protected objects), or protected entries.


### Ada is a powerful language designed to address the following issues:

* The development of very large programs by multiple, loosely connected teams.
  * > The language has features to help manage a large number of program components and to help ensure those components are used consistently.

*  The development of long-lived programs that spend most of their time in the maintenance phase of the software life cycle. 
   * >  The language is designed to promote the readability of programs. You may find Ada code to be rather verbose and tedious to write. However, that extra work pays off later by making the code clearer and easier to read when bugs must be fixed or enhancements are written.

* The development of robust programs where correctness, security, and reliability are priorities. 
  * >  The language has features designed to make programming safer and less error-prone.

*  The development of embedded systems where low-level hardware control, multiple concurrent tasks, and real-time requirements are common. 
   * > The language has features designed to support these things while still retaining as much safety as feasible.

* Readability is more important than conciseness. 
  * > Syntactically this shows through the fact that keywords are preferred to symbols, that no keyword is an abbreviation, etc.

* Very strong typing. 
  * > It is very easy to introduce new types in Ada, with the benefit of preventing data usage errors.
  * > It is similar to many functional languages in that regard, except that the programmer has to be much more explicit about typing in Ada, because there is almost no type inference.

* Explicit is better than implicit. 
  * > Although this is a Python commandment, Ada takes it way further than any language we know of:
      * > > There is mostly no structural typing, and most types need to be explicitly named by the programmer.
  * > As previously said, there is mostly no type inference.
  * > Semantics are very well defined, and undefined behavior is limited to an absolute minimum.
  * > The programmer can generally give a lot of information about what their program means to the compiler (and other programmers). This allows the compiler to be extremely helpful (read: strict) with the programmer.



One important distinction between Ada and a language like C is that statements and expressions are very clearly distinguished. In Ada, if you try to use an expression where a statement is required then your program will fail to compile. This rule supports a useful stylistic principle: expressions are intended to deliver values, not to have side effects. It can also prevent some programming errors, such as mistakenly using the equality operator "=" instead of the assignment operation ":=" in an assignment statement.
