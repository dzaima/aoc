#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
# part 1: 1:58; both: 4:39
a‿b ← ¯1(↓⋈↑) l←•FLines 2025‿6 Input •args

a↩ Ints¨ a
b↩ ' '⊸≠⊸/ ⋈⁼b
•Show +´(<˘⍉>a) {𝕩´𝕨}¨ o←⊏⟜×‿+b='+'
•Show +´o{𝕨´Ints ⥊' '∾˘𝕩}¨ {𝕩⊔˜+`∧˝˘' '=𝕩}⍉>l
•Show 
•Show 
•Show 