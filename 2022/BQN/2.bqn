#!/usr/bin/env cbqn
l ← •FLines ≠◶"2.in"‿⊑ •args
[a,b] ← ⍉>(0‿2⊸⊏¨l) - <"AX"
WinsTo  ← ⊏⟜1‿2‿0
LosesTo ← ⊏⟜2‿0‿1
F ← {+´1+𝕩+(3×a=𝕩)+6×𝕩=WinsTo a}
•Show F b
•Show F ((LosesTo a) × b=0) + (a × b=1) + ((WinsTo a) × b=2)