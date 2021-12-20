#!/usr/bin/env cbqn
⟨RB⟩ ← •Import "utils.bqn"
l ← '#'=•FLines ≠◶"20.in"‿⊑ •args
p ← ⊑l

Step ← {𝕊s‿b:
  b ↩ s∾˘˜s∾˘(s¨⊏)⊸(∾∾⊣)b
  ⟨¬⍟(⊑p) s ⋄ p⊏˜RB ∾{⟨s»˘𝕩 ⋄ 𝕩 ⋄ s«˘𝕩⟩}¨ ⟨s¨∘⊏⊸»b ⋄ b ⋄ s¨∘⊏⊸«b⟩⟩
}

•Show +´⥊1⊑Step⍟2 ⟨0 ⋄ >2↓l⟩
•Show +´⥊1⊑Step⍟50 ⟨0 ⋄ >2↓l⟩