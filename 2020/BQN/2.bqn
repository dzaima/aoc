#!/usr/bin/env cbqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
l ← {p←⊑𝕩⊐':' ⋄ (Ints p↑𝕩)∾⟨𝕩⊑˜p-1, 𝕩↓˜2+p⟩}¨ •FLines ≠◶"2.in"‿⊑ •args

•Show +´ {s‿e‿c‿p: (≥⟜s∧≤⟜e) +´c=p}¨ l
•Show +´ {s‿e‿c‿p: 1=+´c=(s‿e-1)⊏p}¨ l