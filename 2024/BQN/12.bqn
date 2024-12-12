#!/usr/bin/env bqn
⟨Input, _fx_⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿12 Input •args

shifts ← ⟨»˘,«˘,«,»⟩
eq ← {l = 𝕏l}¨ shifts

n ← ≠l
is ← ⊐⌾⥊ {𝕊 p: p ⌈´ eq {𝕨 × 𝕏p}¨ shifts} _fx_ ≢ n‿n⥊1+↕≠⥊l

p1 ← 0
p2 ← 0
{
  c ← 𝕩=is
  area ← +´⥊c
  p1+↩ area × +´ {+´⥊ c ∧ ¬ 𝕏 c}¨ shifts
  p2+↩ area × +´ (2⌽shifts) {+´⥊ (⊢∧·¬𝕎) c ∧ ¬ 𝕏 c}¨ shifts
}¨ ⍷⥊is
•Show p1
•Show p2