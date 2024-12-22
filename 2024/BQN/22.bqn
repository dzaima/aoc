#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints •FChars 2024‿22 Input •args

_step_ ← { s‿e _𝕣_ len:
  shift ← {s≥0? (s⥊0)⊸«; ((-s)⥊0)⊸»}
  mask ← (32×len) ⥊ 32↑ (-s)≤↕e-s
  ⊢ ≠ mask ∧ Shift
}

Next ← ⊢
Next ↩  ¯6‿18 _step_ (≠l) Next # << 6
Next ↩   5‿24 _step_ (≠l) Next # >> 5
Next ↩ ¯11‿13 _step_ (≠l) Next # << 11

steps ← (⥊1‿32•bit._cast)¨ Next⍟(↕2001) 32‿1•bit._cast l

•Show +´¯1⊑steps

prices ← ⍉ 10| >steps
deltas ← (1⊸↓ - ¯1⊸↓)˘ prices
mdelta‿mprice ← <˘⍉> (<˘ prices) {m←∊𝕩 ⋄ ⟨m/𝕩, (0‿0‿0‿0∾m)/𝕨⟩}¨ 4↕¨ <˘ deltas
uniq0 ← ⊐∾mdelta
uniq ← ((≠¨mdelta) / ↕≠l) ⊔ uniq0
zeroes ← (1+⌈´uniq0)⥊0
•Show ⌈´ +´ uniq {𝕩⌾(𝕨⊸⊏) zeroes}¨ mprice