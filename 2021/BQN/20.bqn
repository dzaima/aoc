#!/usr/bin/env bqn
⟨RB⟩ ← •Import "../../utils/utils.bqn"
l ← '#'=•FLines ≠◶"20.in"‿⊑ •args
p ← ⊑ l

Step ← { s‿b:
  r ← {RB ⟨s‿s∾𝕩 ⋄ s∾𝕩∾s ⋄ 𝕩∾s‿s⟩}¨b
  r0 ← (s×7)¨⊑r
  ⟨p⊑˜511×s ⋄ ⊏⟜p¨ +´64‿8‿1×{⟨r0‿r0∾𝕩 ⋄ ∾⟨⟨r0⟩⋄𝕩⋄⟨r0⟩⟩ ⋄ 𝕩∾r0‿r0⟩}r⟩
}

{•Show +´∾1⊑𝕩}¨ Step⍟2‿50 ⟨0 ⋄ 2↓l⟩
