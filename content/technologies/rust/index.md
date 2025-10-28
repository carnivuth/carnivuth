---
title: "Rust"
layout: simple
aliases:
  - content/tecnologies/rust.md
  - content/tecnologies
permalink: /tecnologies/rust.md
date: 2025-06-10T12:01:34+02:00
draft: false
description: "Notes on the rust programming language"
---

Rust is a compiled, function based language with a unique way to manage memory in order to be efficient (*no garbage collector*) and memory safety called ownership and borrowing

## Variables

Variables are declared with the `let` keyword and are immutable by default (keyword `mut` to make them mutable)

### Variable shadowing

Variables can be shadowed redefining them again with the keyword `let` and shadow variable persist until the scope where is decleared in survives

```rust
let x = 3;
{
  let x=6;
  println!("{x}") // will print 6
}
println!("{x}") // will print 3
```

### Constants

Constants are like variables but they cannot be defined as mutable

## Data types

### Scalable

Similar to `c` types: `integer,float,bool,char` with different precision for integers and float and distinction between signed and unsigned integers

### Compound

Type composed by a collection of values

- `tuple` size fixed set of element with heterogeneous types
- `array` size fixed set of element with homogeneous types

## Statement and expressions

**Assignment is a statement**

```rust
let x = y = 3; //this will not compile
```

But blocks are expression and the **semicolon at the end determines the return value** (*the line without semicolon must be an expression that determines the return value*) so this compiles

```rust
let x = {
  let y = 6;
  y
};
println!(" asdasd {x}");
```

## Flow control

### `if` statement

Classic if statement, no type inference in the condition so this will not compile

```rust
let x =3;
if x {
  println!("the value of x is: {x}");
}
```

The `if` statement is an expression and the return value is the same of the `if/else` blocks so they must agree in type

```rust
let condition = true;
let x = if condition {5} else {"s"}; // this will give error cause the else block must return int cause the if block returns int
```

### Loops statements

There are 3 statements for loops `loop` `while` `for`

#### `loop` statement

The `loop` statement loops indefinitely or until a `break` keyword is used loops can be tagged with a label to target a specific loop with a break statement (without it a break targets always the inner loop)

## Ownership

Ownership is a strange concept developed to manage memory allocation problems (*access to pointers that are not allocated, memory leaks*) at compile time, the concept is as follow:

> [!IMPORTANT]
> only a variable can posses a block of memory on the heap!!!!

For example if a variable is allocated in the heap (*mutable string in this example*) only the second one is the **owner** of the heap memory block

```rust
let a = String::from("hello");
// s gets the ownership
let s = a
```
> [!WARNING]
> In the example the `s` variable gets ownership and the heap memory block is de-allocated **only when `s` goes out of scope**

### Ownership in functions

In functions ownership is passed to the function's actual parameter

```rust
fn super_print(s: String) {
  println!("{s}")
}

let a = String::from("hello");

// ownership is passed to the actual parameter of the function
super_print(a);
// here the memory for the variable is been freed

// compilation error
println!("{a}")
```
> [!WARNING]
> In the example above `a` is being accessed after the ownership has been passed to the function parameter and it results in a compilation error cause the ownership of the heap memory goes out of scope
