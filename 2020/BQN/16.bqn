#!/usr/bin/env cbqn
⟨SplitF, Ints⟩ ← •Import "utils.bqn"
g0‿g1‿g2 ← "" SplitF •FLines ≠◶"16.in"‿⊑ •args

fields ← {⟨𝕩↑˜⊑𝕩⊐':' ⋄ Ints 𝕩⟩}¨ g0
mine ← Ints 1⊑g1
other ← >Ints¨ 1↓g2

fN ← ⊑¨ fields
fV ← 1⊑¨ fields

fS‿fE ← <˘⍉∧∘‿2⥊∾fV
fE+↩ 1 # inclusive-exclusive ranges
cEm ← fE⌊(¯1⊑fE)«fS # cut off ends covered by the next range
okNums ← 2|(⥊⍉fS≍cEm)⍋other

•Show +´ (¬okNums) /○⥊ other

okMask ← ∧˝˘ okNums
okCols ← <˘ ⍉okMask/other
[s0,e0,s1,e1] ← ⍉>fV
p ← {∧˝((𝕩≥⌜s0)∧𝕩≤⌜e0) ∨ (𝕩≥⌜s1)∧𝕩≤⌜e1}¨ okCols # for each column, its possibilities
counts ← +´¨p # possibility count for each column
o ← ⍋counts # order by counts
pos ← ⋈⁼¨ o⊔⍋+˝ {!∨`⌾⌽⊸≡𝕩 ⋄ 𝕩} ¬>o⊏p # for each column, its position in 
•Show ×´ ("departure"⊸{𝕨≡(≠𝕨)↑𝕩}¨ pos⊏fN)/mine
