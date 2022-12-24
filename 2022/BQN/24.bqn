#!/usr/bin/env cbqn
i ← ¯1↓˘1↓˘¯1↓1↓>•FLines ≠◶"24.in"‿⊑ •args

r ← i='>'
l ← i='<'
u ← i='^'
d ← i='v'
B ← {𝕊: (𝕩⌽u) ∨ ((-𝕩)⌽d) ∨ ((-𝕩)⌽˘r) ∨ 𝕩⌽˘l}

b0 ← 0¨ i
To ← { g 𝕊 m0‿i:
  1+⊑{i‿m: ⟨i+1, (m0∨(⊢∨»∨«∨»˘∨«˘)m)∧¬B i+1⟩}•_while_{i‿m: ¬g⊑m} i⋈b0
}

m0 ← 1⌾⊑ 0¨ i
•Show ¯1‿¯1 To m0⋈0
•Show ¯1‿¯1 To m0⋈ 0‿0 To (⌽⌽˘m0)⋈ ¯1‿¯1 To m0⋈0