#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Num¨ •FLines 2024‿22 Input •args
Xor ← 32•bit._xor
S ← {{𝕩 Xor 16777216| 2048×𝕩} {16777216| 𝕩 Xor ⌊32÷˜𝕩} 16777216| 𝕩 Xor 𝕩×64}
•Show +´S⍟2000 l

d ← ⍉{(1↓𝕩)-¯1↓𝕩} o←10| >S⍟(↕2001) l
# •Show ≠o
ot ← <˘ ⍉o
ws ← 4↕¨ <˘ d
b ← ot {m←∊𝕩 ⋄ (m/𝕩)⋈(4+/m)⊏𝕨}¨ ws
a ← ∾⊑¨b
au ← ⍷a
c ← ((≠∘⊑¨b)/↕≠l)⊔⊐a
# •Show (((≠au)↑/⁼)¨ c) × 1⊑¨b
# •Show c
# •Show ≠au
# •Show (1⊑¨b)⊏¨ <˘ ⍉o
•Show ⌈´ +´ c {(≠au) ↑ +´¨ 𝕨⊔1⊑𝕩}¨ b
