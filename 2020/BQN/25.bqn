#!/usr/bin/env bqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
l ← Ints •FChars ≠◶"25.in"‿⊑ •args


F ← { find 𝕊 c:
  o←0 ⋄ n←10000
  r ← @
  { 𝕊:
    g ← (20201227|7×⊢)⍟(↕n+1) c
    c ↩ ¯1⊑g
    {
      ∨´g∊find? r ↩ ⟨⟩⌾(1⊸⊑)⍟(×≠∘⊑) o+/¨ g⊸=¨ find;
      o+↩ n
    }
  }•_while_{𝕊: r≡@} @
}

fd ← l F 1
has ← ×∘≠¨ fd

sn ← ⋈⁼ (¬has)/l
r ← ⊑∾fd
PMod ← {b𝕊m‿p: 1 {m|𝕩×m|𝕩×sn∨¬𝕨}´ 2|⌊p÷2⋆↕⌈2⋆⁼p+2}
•Show sn PMod 20201227‿r
