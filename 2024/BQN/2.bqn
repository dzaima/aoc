#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿2 Input •args

Deltas ← 1⊸↓ - ¯1⊸↓
vs ← {
  d ← Deltas 𝕩
  dsc ← (+´d≤0) > 0.5×≠𝕩 # input length ≥ 5; multiple zero deltas will fail regardless
  ⟨
    (1⊸≤∧≤⟜3) -⍟dsc d
    -⍟dsc 𝕩
  ⟩
}¨ l

P1 ← ∧´ ⊑
P2 ← { ok‿v:
  m ← (»∘¬ ∧`)⊸∨ ok
  ∨´ {∧´ (1⊸≤∧≤⟜3) Deltas 𝕩}¨ /⟜v¨ ⟨m∾1, 1∾m⟩
}

•Show +´ P1¨ vs
•Show +´ P2¨ vs
