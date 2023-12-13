#!/usr/bin/env bqn
⟨SplitF⟩ ← •Import "../../utils/utils.bqn"
l ← >¨ ⟨⟩SplitF •FLines ≠◶"13.in"‿⊑ •args
# slightly overcomplicated solution, somewhat optimized for perf
# converting inputs to bitarrs is slightly not worth it (even if padding cells to closest 8/16/32)

p ← > {{((𝕩¨∾↓⟜𝕩¨) 1+2×i) {+´⥊ (𝕩↑𝕨) ≠ ⌽𝕩↑𝕩↓𝕨}¨ 1 + i ∾ ⌽i←↕⌊2÷˜≠𝕩}¨ ⟨𝕩,⍉𝕩⟩}¨ l
•Show +´ ∾ ⥊ 100‿1 ×⎉1 {1+/0=𝕩}¨ p
•Show +´ ∾ ⥊ 100‿1 ×⎉1 {1+/1=𝕩}¨ p
