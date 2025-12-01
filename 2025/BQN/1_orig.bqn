#!/usr/bin/env bqn
# part 1: 1:44; both: 3:53
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2025‿1 Input •args

m ← {⟨⊑⊑𝕩,Num 1↓𝕩⟩}¨l
a‿b ← <˘⍉>m

d ← b×¯1⋆a='L'
e ← 100|50+`d
•Show +´0=e
•Show +´0=∾(50»e){100|𝕨+(×𝕩)×↕|𝕩}¨d
