#!/usr/bin/env bqn
⟨Ints, Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨','Split ⊑•FLines 2025‿2 Input •args

S ← {
  k ← ≠⊑𝕩
  m ← >𝕩
  ds ← (0=|⟜k)⊸/ ↕k
  ms ← {m≡˘(k⥊↕𝕩)⊸⊏˘ m}¨ ds
  (+´ ·/⟜𝕨 ∨´)¨ ⟨(k=2×ds)/ms, ms⟩
}
F ← {
  r ← •Repr¨ 𝕩
  +´ 𝕩 S¨○(×∘≠¨⊸/ (≠¨r)⊸⊔) r
}

•Show¨ +´ {F (⊣ + ↕∘¬˜)´ 𝕩}¨ l
