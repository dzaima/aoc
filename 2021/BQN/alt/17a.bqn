#!/usr/bin/env bqn
# version doing scalar calculations
⟨RB, B10, Num, Ints, Split⟩ ← •Import "../utils.bqn"
l ← ⊑•FLines ≠◶"../17.in"‿⊑ •args
NInts ← {{'-'=⊑𝕩?-Num 1↓𝕩;Num𝕩}¨((¯1+⊢×·+`»⊸<)𝕩∊'-'∾'0'+↕10)⊔𝕩}
xs‿xe‿ys‿ye←NInts l
s←xs‿ys
e←xe‿ye

Step ← {⟨h ⋄ my ⋄ p ⋄ v⟩: vx‿vy←v
  np ← p+v
  ⟨h∨∧´(np≥s)∧np≤e ⋄ my⌈1⊑p ⋄ np ⋄ ⟨vx-×vx ⋄ vy-1⟩⟩
}

Do ← {Step•_while_{⟨h⋄my⋄x‿y⋄v⟩: (¬h)∧y≥ys} ⟨0 ⋄ ¯∞ ⋄ 0‿0 ⋄ 𝕩⟩}

all ← Do¨ ⥊{(<𝕩)-↕1+2×𝕩} 1+s⌈○|e
ok ← ⊑¨all
•Show ⌈´1⊑¨ok/all
•Show +´ok