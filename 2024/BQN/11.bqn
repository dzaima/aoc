#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints⊑•FLines 2024‿11 Input •args

pows ← 10⋆↕16
evens ← 0⌾⊑ 0=2|↕16
rests ← 0⌾⊑ ¬evens

•Show¨ +´∘⊑¨ { ns𝕊vs:
  lens ← pows⍋vs
  
  rn‿rv ← ∾¨<˘⍉>⟨
    {ns←(lens=0)/ns ⋄ ⟨ns, 1¨ns⟩}
    {ns‿vs‿ls: ⟨ns∾ns, ((ls÷2)⊏pows) (| ∾ ⌊∘÷˜) vs⟩} (lens⊏evens)⊸/¨ ns‿vs‿lens
    2024⊸×⌾(1⊸⊑) (lens⊏rests)⊸/¨ ns‿vs
  ⟩
  
  g ← ⊐ rv
  ⟨+´¨ g ⊔ rn, (∊g)/rv⟩
}´⍟25‿75 1¨⊸⋈ l