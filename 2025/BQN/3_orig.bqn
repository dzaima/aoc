#!/usr/bin/env bqn
# part 1: 2:30; both: 5:20
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜•FLines 2025‿3 Input •args

•Show +´{(10×m)+⌈´𝕩↓˜1+⊑𝕩⊐m←⌈´¯1↓𝕩}¨ l
K ← {k𝕊𝕩: m⋈𝕩↓˜1+⊑𝕩⊐m←⌈´(-k)↓𝕩}
•Show +´{B10 ⊑{a‿b: c‿d←(11-≠a) K b ⋄ ⟨a∾c,d⟩}⍟12 ⟨⟩‿𝕩}¨ l