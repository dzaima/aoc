#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints⊑•FLines 2024‿11 Input •args

pows ← 10⋆↕16
evens ← 0⌾⊑ 0=2|↕16

•Show¨ +´∘⊑¨ { ns𝕊vs:
  lens ← pows⍋vs
  
  zero ← lens=0
  even ← lens⊏evens
  rest ← (¬zero) ∧ ¬even
  
  rn‿rv ← ∾¨<˘⍉>⟨
    {vs ← zero/ns ⋄ vs ⋈ (≠vs)⥊1}
    {ns‿vs‿ls: ⟨ns∾ns, ((ls÷2)⊏pows) (| ∾ ⌊∘÷˜) vs⟩} even⊸/¨ ns‿vs‿lens
    2024⊸×⌾(1⊸⊑) rest⊸/¨ ns‿vs
  ⟩
  
  g ← ⊐ rv
  ⟨+´¨ g ⊔ rn, (∊g)/rv⟩
}´⍟25‿75 1¨⊸⋈ l