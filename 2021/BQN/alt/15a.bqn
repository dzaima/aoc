#!/usr/bin/env bqn
l ← >'0'-˜•FLines ≠◶"../15.in"‿⊑ •args

# high-rank version using high-depth ⊑
sc‿c←@‿@
Init ← {𝕊:
  sc ↩ 0⌾⊑ (≢l)⥊∞
  c ↩ ⟨0‿1⋄1‿0⟩
}

Step ← {𝕊:
  0<≠c?
  wsc ← ∞¨∘⊏⊸(∾∾⊣) ∞∾˘˜∞∾˘sc
  p ← c⊑sc
  n ← (c⊑l) + ⌊´{(c+<𝕩)⊑wsc}¨ ⟨1‿0⋄0‿1⋄1‿2⋄2‿1⟩
  c‿p‿n (n<p)⊸/¨↩
  0<≠c?
  sc↩ n⌾(c⊸⊑)sc
  c ↩ ⍷(∧´¨(0⊸≤ ∧ <⟜(<≢l)))⊸/ ∾{c+<𝕩}¨ ⟨¯1‿0⋄0‿¯1⋄1‿0⋄0‿1⟩
  1;0
}
Init@
Step•_while_⊢1
•Show ¯1‿¯1⊑sc


l ↩ 9⊸|⌾(-⟜1) ∾(<l) + +´¨↕5‿5
Init@
Step•_while_⊢1
•Show ¯1‿¯1⊑sc