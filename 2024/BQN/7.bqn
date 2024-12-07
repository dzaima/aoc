#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿7 Input •args

Part ← { 𝕊 ops:
  {
    exp   ← 0⊑𝕩
    start ← 1⊑𝕩
    tail  ← 2↓𝕩
    exp × ∨´ exp = ⟨start⟩ { val𝕊acc:
      ≤⟜exp⊸/ ∾ {acc 𝕏 val}¨ ops # assumes no zeroes in input
    }´ ⌽tail
  }¨ l
}

•Show +´ Part +‿×
•Show +´ Part +‿×‿{(𝕨 × 10⋆≠•Repr𝕩) + 𝕩}
