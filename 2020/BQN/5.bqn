#!/usr/bin/env bqn
⟨RB⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines ≠◶"5.in"‿⊑ •args

p ← <˘⍉>{RB¨ "BR"=7(↑⋈↓)𝕩}¨ l
i ← (⊢+8×⊣)´ p

•Show ⌈´i
•Show ⊑/{(¬𝕩∊i) ∧ ((𝕩-1)∊i) ∧ (𝕩+1)∊i} ↕⌈´i