#!/usr/bin/env bqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
l ← ∧ Ints •FChars ≠◶"10.in"‿⊑ •args

d ← -⟜» ∾⟜(3+¯1⊑⊢) l

•Show ×´1‿3⊏/⁼d

•Show ¯1⊑¯1⊑⟨0⟩‿⟨1⟩ { n𝕊pp‿pc:
  pp‿pc/˜¨↩ <pp≥n-3
  ⟨pp∾n, pc∾+´pc⟩
}´⌽ l