Compiler
==========================================

A verified compilation for the IMP programming language.
This code is (modifed) part of the tutorial of the [interaction tree](https://github.com/DeepSpec/InteractionTrees) library.

To prove a compiler correct, we want to show a bisimulation between the original program and the compiled program.

This can happen in multiple ways (star-step, lock-step, events, observational, denotational, ...).

Interaction trees allow to formulate denotations of programs as a stream of events that might be further interpreted in stages.

Two programs are equivalent if the streams (traces through the program) are observational equivalent (same events -- equal up to tau transitions).

(Note this is a simplification -- See the paper and examples for a more detailed explanation and the Vellvm paper for a more complex application.)

Before diving into the code, it might be helpful to first have a look at the ITree library.
Two files to start with (before coming back here) might be `theories/Simple.v` and `tutorial/Introduction.v`.

All helper files are located in `helper/`.
The main files are:
* `Imp.v`: A standard imperative language like in Software Foundations along with its denotational interpretation.
* `Asm.v`: A simple assembly language similar to MIPS/LLVM (using basic blocks) along with its denotation
* `AsmCombinators.v`: Linking combinators to reason about control flow (and their correctness theorems)
* `Imp2Asm.v`: Syntax-directed code generation using the assembly combinators
* `Imp2AsmCorrectness.v`: Use the combinators and prove a bisimulation between the IMP and assembly program. Relate expression evaluation to the used registers and relate the assembly memory to the IMP state using an isomorphism.

The general idea is to relate the assembly linkage to the interpretation level (KTree) which in turn can be related to the IMP code.

Other files are:
* `AsmOptimization.v`: Verify optimizations on assembly level by proving a (restricted) bisimulation on the assembly programs.
* `PrintAssumptions.v`: Make sure that we did not cheat (did not use axioms)

## Literature

TODO: link literature (see folder)

- Vellvm
- CompCert
- Certified Compilation
- Interaction Trees
- Monads
- Category Theory


This tutorial consists of:

- [`ITree.Simple`](../theories/Simple.v):
  simplified tutorial interface, available as a part of the library itself.

- [`Introduction.v`](./Introduction.v):
  a detailed exposition of the core features.

- A case study with a small commented compiler from Imp to Asm:

    + [`Imp.v`](./Imp.v): The Imp language definition
      (a minimal imperative language from Software Foundations)
    + [`Asm.v`](./Asm.v): The Asm language definition
      (a control-flow-graph language)
    - [`AsmCombinators.v`](./AsmCombinators.v): High-level combinators for Asm
    - [`Imp2Asm.v`](./Imp2Asm.v): The compiler
    - [`Imp2AsmCorrectness.v`](./Imp2AsmCorrectness.v):
      The correctness theorem (`compile_correct`).
