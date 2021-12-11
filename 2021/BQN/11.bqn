#!/usr/bin/env cbqn
l ← '0'-˜>•FLines ≠◶"11.in"‿⊑ •args

Step ← {
  n←𝕩+1
  f←(≢𝕩)⥊0
  {
    m ← (n≥10)∧¬f
    f∨↩ m
    n+↩ 0(«+»+⊢)˘ (0¨⊏)⊸(«+»+⊢) m
    ∨´⥊m?𝕊@;@
  }@
  ⟨n×¬f⋄f⟩
}
•Show 1⊑ (⊢ +⟜(+´∘⥊)⌾(1⊸⊑) Step∘⊑)⍟100 ⟨l ⋄ 0⟩
•Show ⊑ {n‿c‿f: ⟨n+1⟩∾Step c}•_while_{n‿p‿f: ¬∧´⥊f} ⟨0 ⋄ l ⋄ (≢l)⥊0⟩