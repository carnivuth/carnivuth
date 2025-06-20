---
title: "Rust"
aliases:
  - content/tecnologies/rust.md
  - content/tecnologies
permalink: /tecnologies/rust.md
date: 2025-06-10T12:01:34+02:00
draft: true
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
