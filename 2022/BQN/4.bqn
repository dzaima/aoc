#!/usr/bin/env cbqn
⟨RB, B10, Num, SInt, Ints, SInts, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _f_, _fi_, T⟩ ← •Import "utils.bqn"
l ← <˘¨ 2‿2⊸⥊¨ Ints¨ •FLines ≠◶"4.in"‿⊑ •args

•Show +´{∨´{⟨a‿b,c‿d⟩:  (a≥c)∧b≤d}¨⟨𝕩,⌽𝕩⟩}¨ l
•Show +´   {⟨a‿b,c‿d⟩: ¬(b<c)∨a>d}¨ l
