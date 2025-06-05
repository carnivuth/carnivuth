---
title: "awk"
date: 2025-01-20
tags:
  - "oneliners"
  - "command guide"
description: "awk guide and snippets"
series: ["Technologies notes"]
draft: false
series_order: 2
---

`awk` is a language for text parsing and manipulation, it's often used as a tokenizer in bash pipes but it can do a lot more of that

> before starting i write down the most common use case of awk
>```bash
>some_command_that_prints_on_stdout | awk -F'[SEPARATOR]'  '{print $[FIELD]}'
>```

## Processing model

awk starts by loading user defined functions than execute `BEGIN` block that process text one record at a time (*default behavior is line filter*) :

{{< mermaid >}}
flowchart TD
A[load functions]
B[initial setup\n by running the BEGIN block]
C[read line]
D[process line]
E[clean up\by running END block]
A --> B --> C
C --> D
D --> C
D --> E
{{</ mermaid >}}

## Syntax

Blocks are delimited by `{}` each line contains an isntruction, instructoins can be separated by `;`

```awk
BEGIN{  }
{  }
END{  }
```

## Regex filters and `~` operator

lines can be regex parsed using a variable with a regular expression and then filter the input using the `~` operator

```awk
BEGIN{
filter="REGEX"
}


$0 ~ filter{
    # operation on matched records
}
```

## Match function

match regex element and put beckrefs in an array

```awk
    match($0, /.* — (.*) ft\. .*/, arr)
    print arr[1]
```

## Oneliners

- print all token except first one

```bash
awk '{$1=""; print $0}'
```
