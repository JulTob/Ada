# Ada Program Structure

Enough propaganda. Let’s back up those claims.

## 🏗️ Simple Example

Let us start with a simple example:

```Ada
with Ada.Text_IO;
-- Input-Output Standard Library

procedure Hello is
  begin
    Ada.Text_IO.Put_Line("Hello, Ada!");
    end Hello;
```

<iframe
  width="100%"
  height="450"
  src="https://www.jdoodle.com/ia/1GLa"
  frameborder="0">
</iframe>

> With this online editor you can try snippets and execute them. Try Changing Ada to your own name!


It displays the string *"Hello, Ada!"* in the console.

You may have noticed the following:

1. No curly brackets
2. `begin`–`end` delimiters
3. Very verbose, minimal “programming symbols”
4. The symbols used follow mathematical standards
5. The procedure’s name (it’s not `main`) is declared along with its unit type
6. The `end` clause repeats the procedure name—good practice, though not mandatory
7. Ada is **not** case-sensitive
8. Semicolons (`;`) are statement terminators
9. Double hyphens (`--`) introduce line comments
10. Whitespace beyond the first character is ignored

Between **`is`** and **`begin`** we write *declarations*.
Between **`begin`** and **`end`** we write *statements*.

## 📜 Context Clause

The `with` line is a **context clause**. It specifies packages whose services the current program unit will use. In this example, we pull in facilities from the child package `Ada.Text_IO` of the standard library.

You can make a package’s contents directly visible with a `use` clause:

```Ada
with Ada.Text_IO;
-- Input-Output Standard Library

procedure Hello is
  use Ada.Text_IO;
  begin
    Put_Line("Hello, Ada!");
    end Hello;
```

<body>
    <div data-pym-src=''></div>
    <script src='https://www.jdoodle.com/assets/jdoodle-pym.min.js' type='text/javascript'></script>
    </body>
    
<iframe
  width="100%"
  height="450"
  src="https://www.jdoodle.com/embed/v1/421ff9dcf2ef5c58"
  frameborder="0">
</iframe>
  
This removes the need to qualify each call with the full package name.

## 🚀 Main Program (?)

The main program is simply the procedure designated as the program’s entry point—in this case, `Hello`. Any top-level procedure can serve as the entry point; the compiler or build tool determines which one is used when creating the executable.

Any top-level procedure can serve as the program’s entry point. Here we used Hello, but your build command or compiler flags determine which procedure is compiled into the executable.

```bash
gnatmake Hello.adb   # compiles and links Hello.adb into an executable
```
