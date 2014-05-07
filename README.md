The Art of Incremental Stream Processing
========================================

A psuedo language for defining these problems:

```
  type In i         -- Something that produces elements of type i
  type Out o        -- Something that consumes elements of type o
  type Pipeline i o -- Something that turns elements of type i into elements of type o
```

Note where you see "String" that will be "String" in Scala but should
be "Text" in Haskell.

Pipelines
---------

The first step in mastering stream processing is being able to build
stream transducers - that is the `Pipeline` components that consume
input _and_ produce output. This components are often small and well
defined, but it can still take some practice to identify the
combinators required to tackle particular problems.

To practice this we will build the streaming equivalants of the
following unix tools:

#### `cat` - `Pipeline a a`

The identity pipeline, it produces exactly the elements it consumes.


#### `yes` - `In String`

Continuously emits the string "y" while it is being asked for input.


### `fgrep` - `String -> Pipeline String String`

A fixed grep search, process the line by line and only produce
lines who contain the substring fgrep.

Note that you should _not_ assume you will be handed chunks a line
at a time, you need to make sure things are processed.

### `head` - `Pipeline String String`

Process input line by line and only output the first 10 input
elements, and drop the rest.

Note this is probably harder than it sounds!!!

### `tail` - `Pipeline String String`

Like `head`, process input line by line and only output the last 10 lines,
ignores the rest.

Note this is probably _a lot_ harder than it sounds!!!

### `nl` - `Pipeline String (String, Int)`

Line numbers, process input line by line, outputting each line with
the line number.

### `wcl` - `In String -> Int

Count the number of lines processed by In String.

###  `wc` - `In String -> Count { line :: Int, word :: Int, char }`

Count the number of lines, words and characters processed by In String

### `cksum` - `In String -> Int`

Produce a simple checkum. The checksum is calculated by xor'ing the ordinal
value of each character (i.e. ascii code).


Input and Output
----------------

Next we want to build up some tools to hook our simple stream processors
up to input and output (files and/or stdin & stdout).

### `tee` - `Pipeline a b -> Out b -> Pipeline a b`

Such that all output goes to `Out b` as well as the output pipeline.

### `read` - `FileName -> In Text`

Take a filename and produce a text input.

### `readBytes` - `FileName -> In Bytes`

Take a filename and produce a byte input (Bytes will be language specific -
ByteString in Haskell or ByteVector in Scala).

### `readStdIn` - `In Text`

Read standard input as text.

### `readStdInBytes` - `In Bytes`

Read standard input as bytes.


Test Driving
------------

Build a runnable program so that you can perform some test runs from the
command line.

We want to measure a number of things:
  - memory
  - cpu usage (multi-core?)
  - wall clock time
  - resource management

Generate a test file:

```
yes "this is a test line" | head -10000000 > testing.txt
```

```
time cat < testing > /tmp/ignore
time your-program cat < testing > /tmp/ignore
```

How do they compare?

```
time wc -l < testing
time your-program wcl < testing
```

```
time head < testing
time your-program head < testing
```

```
time tail < testing
time your-program tail < testing
```

How about, handling EOF and broken pipes:

```
your-program yes | head
```

Analysis
--------

Now it is time to share:

 - What did you find difficult, did it get easier once you started
   to pick up the patterns?

 - How did you go at working which of your processes were going to
   be slow (tail for example has a good reason to be slower) - but
   were you able to predict?

 - How about composition with your library?

 - Error handline and effects?

 - How was memory usage when you were operating on lines?
