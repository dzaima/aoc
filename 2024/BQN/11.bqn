#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints⊑•FLines 2024‿11 Input •args

F ← {
  0: ⟨1⟩;
  0=2|≠n←•Repr 𝕩? •ParseFloat¨ (2÷˜≠n)(↑⋈↓) n;
  ⋈ 𝕩×2024
}

•Show¨ +´∘⊑¨ {
  b ← F¨ 𝕩
  j ← ∾ b
  g ← ⊐ j
  ⟨+´¨ g ⊔ (≠¨b)/𝕨, (∊g)/j⟩
}´⍟25‿75 1¨⊸⋈ l