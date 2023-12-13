#!/usr/bin/env cbqn
⟨Num, Split, LCM⟩ ← •Import "../../utils/utils.bqn"
l0‿l1 ← •FLines ≠◶"13.in"‿⊑ •args
t ← Num l0

bs ← Num⍟(@⊸≢)¨ {@¨⌾(("x"⊸≡¨𝕩)⊸/)𝕩} ','Split l1
f ← bs≠@
ns ← f/bs # actual bus numbers
os ← /f # time offsets

next‿idx ← ⌊´⊸(⊣⋈⋈⁼∘/∘=) ⌈⌾(÷⟜ns) t
•Show (next-t)×idx⊑ns

•Show ⊑0‿1 { n‿o𝕊r‿cy:
  cy2 ← cy LCM n
  r2 ← +⟜cy •_while_{0≠n|𝕩+o} r
  r2‿cy2
}´ ns⋈¨os