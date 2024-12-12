#!/usr/bin/env bqn
⟨Input, _fx_⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿12 Input •args

shifts ← ⟨»˘,»,«˘,«⟩
eq ← {l = 𝕏l}¨ shifts

is ← ⊐⌾⥊ {𝕊 p: p ⌈´ eq {𝕨 × 𝕏p}¨ shifts} _fx_ ≢ ↕∘≠⌾⥊ l
isp ← is+1 # so that Nudge shifting in zeroes doesn't collide with index 0

shs ← {𝕏isp}¨ shifts
edges ← isp⊸≠¨ shs

areas ← /⁼⥊is
•Show +´ areas × +´¨ is ⊔○⥊ +´edges
•Show +´ areas × +´¨ is ⊔○⥊ +´edges ∧ (¯1⌽edges) ∨ (¯1⌽shifts) {isp=𝕎𝕩}¨ shs
