#!/usr/bin/env bqn
# part 1: 6:07; both: 13:16
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines 2025‿5 Input •args
a {1⊸+⌾(1⊸⊑)}∘Ints¨↩
b Num¨↩

# af ← {𝕊a:a⌊∞«⌈`⌾⌽⊑¨a}∧a

a1‿a2 ← <˘⍉>∧a
•Show +´{∨´(𝕩≥a1)∧𝕩≤a2}¨ b
# •Show ⍷⊸≡∾∧af
# •Show +´×+˝a {x‿y𝕊a: (a≥x)∧a<y}⌜ b

a2 ⌈`↩
t ← ⍉a1≍a2⌊∞«a1
# •Show ⟨(∧>a) , t, ≍˘-˜˝˘ t⟩
# •Show ∧⊸≡⥊ t
•Show +´-˜˝˘ t
