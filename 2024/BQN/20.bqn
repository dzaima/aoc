#!/usr/bin/env bqn
⟨MDSlash, _fi_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿20 Input •args

ds ← ⌽¨⊸∾ ⋈⟜- 0‿1

e ← ⋈⁼ MDSlash l='E'
nw←l≠'#'
path ← > {𝕩∾<⋈⁼ ((¯2+≠𝕩)⊑𝕩)⊸≢¨⊸/ ⊑⟜nw⊸/ (¯1⊑𝕩)⊸+¨ ds}•_while_{e≢¯1⊑𝕩} MDSlash l='S'
pn ← ≠path

Solve ← {
  cs ← > ⍷ ∾ (⍷·⥊+⌜)` 𝕩⥊< ds
  to ← path ⊐ path +⎉1⎉1‿2 cs
  saves ← pn - ⥊ (to≠pn) /○⥊ (+˝˘|cs) +⎉1 (↕pn) + pn-to
  +´ saves≥100
}

•Show Solve 2
•Show Solve 20
