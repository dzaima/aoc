#!/usr/bin/env bqn
⟨MDSlash, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿8 Input •args

n ← ≠l
fs ← (⊐ '.'⊸≠⊸/ ⥊l) ⊔ MDSlash l≠'.'
x0‿y0‿x1‿y1 ← ∾¨ <˘⍉> {
  xy ← <˘⍉>𝕩
  ns←×˜ n←≠𝕩
  (ns ⥊ ¬1↑˜n+1)⊸/¨ (n/¨xy) ∾ ns⥊¨xy
}¨ fs

ps ← ⟨x0≍˘y0, (x0-x1) ≍˘ y0-y1⟩

# ! 1 = ⌈´ (x0-x1) •math.GCD○| y0-y1

InBounds ← ∧˝˘ ≥⟜0 ∧ <⟜n

•Show ≠⍷ InBounds⊸/ +´ps

•Show ≠⍷ ∾ ⊑¨ { p‿d:
  r←p+d
  (InBounds r)⊸/¨ ⟨r, d⟩
}⍟(↕n) ps