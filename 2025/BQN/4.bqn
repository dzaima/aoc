#!/usr/bin/env bqn
⟨Input, _fx_⟩ ← •Import "../../utils/utils.bqn"
m ← '@'=>•FLines 2025‿4 Input •args

F ← {
  c ← 𝕩 # counts in a 3×3 region
  c ↩ +´ «‿⊢‿» {𝕎 𝕩}¨ <c # spread horizontally
  c ↩ +´ «‿⊢‿» {𝕎˘𝕩}¨ <c # spread vertically
  𝕩 ∧ c≤4 # mask of accessible
}

•Show +´⥊ F m # count accessible
•Show +´⥊ m ≠ {𝕩∧¬F 𝕩}_fx_≢ m # remove accessible while possible, count differences from original
