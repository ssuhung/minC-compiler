# minC (minimum C) compiler

<a name="intro"> </a>
# 1. Introduction
* This is a final assignment in which you build a compiler for a minimum subset of C language, dubbed 'minC'
* This page explains how you should work on it


# 2. Files
* `parser/` : a C -> XML parser written in Python + tatsu (parser generator), which converts a C source into an equivalent XML
* `rs/minc` : a directory for each language
* `test/` : test programs

# 3. Parser (C -> XML)
* `minc_grammar.y` : grammar definition of the minimum C language we work on, which is converted into a working python program (`minc_grammar.py`) using [tatsu](https://github.com/neogeny/TatSu) parser generator library
cd ~/minC Compiler/parser
tatsu minc_grammar.y > minc_grammar.py
* `minc_to_xml.py` : the main parser program that drives minc_grammar.py to convert a C source into an equivalent XML
python3 minc_to_xml.py example/ex.c > ex.xml
* examine the result and understand how each C construct is converted into XML
cat example/ex.c 
cat ex.xml
* you don't have to modify `minc_grammar.y` or `minc_to_xml.py` unless you extend the grammar for extra points
* yet you are encouraged to see how simple does tatsu (or any parser generator, for that matter) make it to write a parser; just take a look at `minc_grammar.y`

##  Note: why are we using XML?
* it is unnecessary and unusual to convert the source program first into XML and then to the abstract syntax tree
* more commonly, you use a parser generator for the language you write your compiler with Rust, which allows you to directly build the abstract syntax tree you can manipulate in that language
* for example, C/C++ has [flex](https://en.wikipedia.org/wiki/Flex)/[bison](https://en.wikipedia.org/wiki/GNU_Bison) parser generator, whose grammar description file (analogous to minc_grammar.y) allows you to build any C/C++ data structure in it; OCaml has [ocamllex/ocamlyacc](https://v2.ocaml.org/manual/lexyacc.html) ([Menhir](http://gallium.inria.fr/~fpottier/menhir/) is a newer version of ocamlyacc).  there is a parser generator that supports multiple languages, most notably [ANTLR](https://www.antlr.org/), which supports Java and Python code generation.  in circumstances where there is a tool available for your language, it is much more straightforward and convenient to use these tools without going through XML
* the reasons why we go through XML are
  * I could not find a popular parser generator for some of the languages (Go and Julia)
  * even if one exists in each language, there will be differences between them that make it difficult/tricky/cumbersome to explain them
* so I arrived at a parser generator (tatsu) for Python as a common middle ground and XML as a common data structure all languages can easily read

# 4. rs/minc
* in each rust directory , there is a toplevel directory `minc`
* the code given there is a skeleton of a compiler that reads an XML file, builds its abstract syntax tree, and finally calls the code generator
* the code generator is currently almost empty and raises an exception when called

###  files
* `rs/`
  * `minc/`
    * `src/`
      * `minc_ast.rs` --- abstract syntax tree (AST) definition
      * `minc_parse.rs` --- XML -> AST converter
      * `minc_cogen.rs` --- AST -> assembly code
      * `main.rs` --- the main file

###  build
```
cd rs/minc
cargo build
```

###  run
* be sure you have generated ex.xml by `minc_to_xml.py`
* try to compile a small program and see that the code generator raises an exception

./target/debug/minc ../../parser/ex.xml ex.s
* take a look at the source code that caused the exception
cat src/minc_cogen.rs
* your job is to implement `ast_to_asm_program` function

# 5. test
##  files
* `test/`
  * `src/` 
    * `f00.c, f01.c, f02.c, ..., ` --- test programs each definint a function `f`
  * `main.c` --- a file that calls function `f`
  * `Makefile` --- executes all the tests

the `Makefile` does the following for each test program (`src/f00.c, src/f01.c,` ...)

1. convert `src/fXX.c` to `xml/fXX.xml` with `parser/minc_to_xml.py`
1. compile `xml/fXX.xml` to `minc/fXX.s` with the minC compiler you are supposed to write
1. compile `main.c` and `minc/fXX.s` into an executable
1. compile `main.c` and `src/fXX.c` into an executable with gcc
1. execute the two executables and compare their outputs

* in the `Makefile`
 * you must set the variable `mincc` to the path to your compiler (relative to the test directory)
```
mincc := ../ml/minc/_build/default/bin/main.exe
```
 * you can set the variable `srcs` to change the functions tested. the default is all the 75 files in `src/`
```
srcs := $(wildcard src/f*.c)
```
for example, if you set this to
```
srcs := $(wildcard src/f00.c)
```
you can only test `src/f00.c`

 * `make -n` will show you what will be executed without actually executing it
 
```
cd ~/notebooks/pl10/test
make -n srcs=src/f00.c
```

* if the test fails, identify which file it failed for and how

* it first converts the C source file into XML using minc_to_xml.py; if the test fails here, it's not your fault, unless you modified the grammar

```
echo "# convert src/f00.c to xml/f00.xml"
../parser/minc_to_xml.py src/f00.c > xml/f00.xml
```

* next it calls your compiler to convert the XML file into asm (the command line depends on the language you chose)

```
echo "# compile xml/f00.xml to asm with your minC compiler"
../ml/minc/_build/default/bin/main.exe xml/f00.xml asm/f00.s
```

if this fails, examine the original C source file (f00.c in the case above) and XML source file to examine what kind of source code makes it fail

* then it calls the gcc to compile the assembly you generated into an executable

```
echo "# generate the executable that calls f with your minC compiler"
gcc -o minc/f00.exe -DTEST_NO=0 main.c asm/f00.s -O0 -g
```

if you generate a syntactically invalid assembly code, gcc will complain here.  read the gcc error message, examine the assembly you generated (asm/f00.s in the case above) and understand why it failed

* then it calls executables generated by gcc as well as your minC compiler

```
echo "# run the executable generated by gcc"
./gcc/f00.exe | tee out/f00.gcc
echo "# run the executable generated by your minC compiler"
./minc/f00.exe | tee out/f00.minc
```
the gcc-generated executable is unlikely to fail.  if your compiler-generated executable fails, you might be able to see the reason just by looking aat the assembly code you generated; otherwise, run the executable with a debugger. GDB, for example, can step-execute an assembly program and allow you to examine the value of registers.

* it finally compares the output of the two executables

```
echo "# take the diff of the two"
diff out/f00.gcc out/f00.minc
```

if it fails, the debugging strategy is the same as above; you might be able to see the reason just by looking at the assembly code you generated; otherwise, run the executable with a debugger. GDB, for example, can step-execute an assembly program and allow you to examine the value of registers.

## 5-1. How to add new test programs
* if you work on any of the extension, you are likely to add test programs too
* src/src/fun.c contains all the C functions to test, each one being guarded by
```
#if TEST_NO == ???

#endif
```
add your test case at the end of the file, using the next number as your TEST_NO
* modify the following line in `test/src/src/Makefile`
```
tests := $(shell seq -f "%02.0f" 0 74)
```
to reflect the tests you added.  for example, if you add two test cases (TEST_NO = 75 and 76), you should change it to 
```
tests := $(shell seq -f "%02.0f" 0 76)
```
and run make in `test/src/src`
cd ~/notebooks/pl10/test/src/src
make

* do a similar thing for `test/main.c`; as long as all functions take only `long` arguments and return a `long` value, you can use the same `main` function. in that case you just change
```
#if 0 <= TEST_NO && TEST_NO <= 74
...
#endif
```
to, say, 
```
#if 0 <= TEST_NO && TEST_NO <= 76
...
#endif
```

* if you support types other than `long`, you are likely to add a different main function. modify `main.c` accordingly


# 6. Format of the report

## 6-1. Baseline requirements (Level 1)
* implement the compiler for minC (you will mainly write `minc_cogen.rs`)
* your code generator must be heavily commented (explain how it works, as if you are writing a report, except you write it in the source code)
* pass all the tests, that is, the following command executes without an error
```
cd test
make -B
```
* by default, the entire test stops as soon as any test fails. you may want to try `-k` option for make, to skip files that fails and go ahead to others
```
cd test
make -B -k
```
* write the summary of tests that passed/failed, in `results.csv` file in the `test/` directory
 * P : passed
 * C : cannot assemble (your compiler fails to produce assembly)
 * I : invalid assembly (your compiler produced an assembly code but it does not compile with gcc)
 * R : runtime error (your compiler produced an executable, but it does not terminate successfully)
 * W : wrong result (your compiler produced an executable that terminates successfully, but the output result is different from that of gcc-generated executable)
cat results.csv

## 6-2. Extra points [Level 2+]
* you get extra points by doing more than required above

* you can extend the minC language in any ways, but possible extensions include (but are not limited to):
  * syntactic extensions
   * [difficulty level 2] for loop
   * [difficulty level 2.5] initializing declaration (e.g., int x = y + 2)
  * type extensions and type checks
   * note that supporting a type other than long requires the compiler know the type of an expression; it's a heavy lifting
   * [difficulty level 3] pointers (long*, long**, etc.)
   * [difficulty level 4] floating point numbers (double)
   * [difficulty level 5] types of different sizes (int, float)
   * [difficulty level 6] structures and typedefs
  * optimization
   * use registers more aggressively
   * inline-expand function calls

* if you have done extra work beyond requirements, describe what you did below