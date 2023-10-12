# [RFC] C++ Manifold Operator

This repository contains the source code for the LLVM compiler infrastructure
with a single ([PoC](https://en.wikipedia.org/wiki/Proof_of_concept)) modification to introduce four new C++ operators.

| Operator  |        Syntax      |                       Equivalence                        | Alternative Token |
| :-------: | :----------------: | :------------------------------------------------------: | :---------------: |
|  one-of   | if (var [^] 1,2) ; | if ((var == 1 && var != 2) \|\| (var != 1 && var == 2)) ;|       one_of      |
|  all-of   | if (var [*] 1,2) ; | if (var == 1 && var == 2) ;                              |       all_of      |
|  any-of   | if (var [\|] 1,2) ;| if (var == 1 \|\| var == 2) ;                            |       any_of      |
|  none-of  | if (var [!] 1,2) ; | if (var != 1 && var != 2) ;                              |       none_of     |

## Example

A number of examples can be found under the [manifold-operator](/manifold-proposal) folder.

``` cpp
#include <cstdlib>

int main(void)
{
  int var = 1;

  if (var [^] 1,2) // one-of
    return EXIT_SUCCESS;

  return EXIT_FAILURE;
}
```

## Running
``` sh
$ cd llvm-project
$ build/bin/clang++ -fmanifold-expressions example.cpp -o example
```

## Building

``` sh
$ git clone https://github.com/llvm/llvm-project
Cloning into 'llvm-project'...
...
Receiving objects: 100% (5588761/5588761), 1.89 GiB | 4.35 MiB/s, done.

$ cd llvm-project

$ mkdir build && cd build/

$ cmake -DLLVM_ENABLE_PROJECTS=clang -DCMAKE_BUILD_TYPE=Debug -G "Unix Makefiles" ../llvm
...

$ make
...
```

## Testing

``` sh
$ cd llvm-project

$ build/bin/clang++ -fsyntax-only -Xclang -verify clang/test/Parser/manifold.cpp

$ make check-all
```

## Documentation

An article detailing the implementation can be found on [LinkedIn](https://www.linkedin.com/in/ben-crowhurst-95167464).
