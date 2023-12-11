#!/usr/bin/env cbqn
⟨RB, B10, Num, SInts, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "utils.bqn"
l ← >'#'=•FLines ≠◶"11.in"‿⊑ •args
x ← ⟨1+¬∨˝˘l, 1+¬∨˝l⟩/l
•Show a←2÷˜+´⥊{+´|𝕨-𝕩}⌜˜ MDSlash x
y ← ⟨1+2×¬∨˝˘l, 1+2×¬∨˝l⟩/l
b←2÷˜+´⥊{+´|𝕨-𝕩}⌜˜ MDSlash y
•Show a + (1e6-2)×b-a
