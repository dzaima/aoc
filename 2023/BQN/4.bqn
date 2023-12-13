#!/usr/bin/env bqn
⟨Split⟩ ← •Import "../../utils/utils.bqn"
l ← {•ParseFloat¨¨ ' 'Split¨ '|'Split 1⊑':'Split𝕩}¨•FLines ≠◶"4.in"‿⊑ •args

sc ← +´∘∊´¨ l
•Show +´ ⌊2⋆¯1+sc
•Show +´ (1¨ l) {(𝕩⊑𝕨)⊸+⌾((𝕩⊑sc)↑(1+𝕩)↓⊢) 𝕨}˜´⌽ ↕≠l