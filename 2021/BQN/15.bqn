#!/usr/bin/env cbqn
l ← >'0'-˜•FLines ≠◶"15.in"‿⊑ •args

ll‿w‿sc‿c‿dirs←@‿@‿@‿@‿@
Init ← {𝕊:
  w ↩ ≠𝕩
  ll ↩ ⥊𝕩
  sc ↩ 0⌾⊑ (1+≠ll) ⥊ 10×+´ll
  c ↩ 1‿w
  dirs ↩ ⥊¨ ∾{⟨(≠ll)¨∘⊏⊸(«⋈»)𝕩 ⋄ (≠ll)(«˘⋈»˘)𝕩⟩} w‿w⥊↕≠ll
}


Step ← {𝕊:
  p ← c⊏sc
  nd ← c⊸⊏¨ dirs
  n ← (c⊏ll) + ⌊´ ⊏⟜sc¨ nd
  m ← n<p
  sc (m/n)⌾((m/c)⊸⊏)↩
  c ↩ ⍷ ∾(m ∧ (≠ll)≠⊢)⊸/¨ nd
}

Init l
Step•_while_(×≠) c
•Show ¯2⊑sc

Init 9⊸|⌾(-⟜1) ∾(<l) + +´¨↕5‿5
Step•_while_(×≠) c
•Show ¯2⊑sc