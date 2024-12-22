#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints •FChars 2024‿22 Input •args
Xor ← 32•bit._xor
S ← {{𝕩 Xor 16777216| 2048 32•bit._mul 𝕩} {𝕩 Xor ⌊32÷˜𝕩} 𝕩 Xor 16777216| 𝕩×64}
•Show +´S⍟2000 l

prices ← 10| >S⍟(↕2001) l
deltas ← ⍉ {(1↓𝕩)-¯1↓𝕩} prices
mdelta‿mprice ← <˘⍉> (<˘ ⍉prices) {m←∊𝕩 ⋄ ⟨m/𝕩, (0‿0‿0‿0∾m)/𝕨⟩}¨ 4↕¨ <˘ deltas
uniq0 ← ⊐∾mdelta
uniq ← ((≠¨mdelta) / ↕≠l) ⊔ uniq0
zeroes ← (1+⌈´uniq0)⥊0
•Show ⌈´ +´ uniq {𝕩⌾(𝕨⊸⊏) zeroes}¨ mprice