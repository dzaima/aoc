#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
h‿s ← (⊑⋈1↓⊢) •FLines 2025‿7 Input •args

h =↩ 'S'
s ↩ '^' = ⌽>s # reverse for aligning with ˝'s order

_f ← { Op _𝕣 𝕩:
  n ← 𝕩
  h { # 𝕩: accumulator (beam mask/counts); 𝕨: next line
    m ← 𝕨 × 𝕩 # beams hitting splitters
    n+↩ +´ m # count up splits
    (𝕩×¬𝕨) Op (« Op ») m # shift splits to sides, and keep counters that didn't hit a splitter
  }˝ s
  n
}

•Show ∨ _f 0
•Show + _f 1
