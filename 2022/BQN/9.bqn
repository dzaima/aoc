#!/usr/bin/env cbqn
⟨Num⟩ ← •Import "utils.bqn"
l ← {⟨⊑𝕩, Num 2↓𝕩⟩}¨ •FLines ≠◶"9.in"‿⊑ •args


l2 ← (1⊑¨l)/⊑¨l
dx ← +`("RL"⊐l2)⊏1‿¯1‿0
dy ← +`("UD"⊐l2)⊏¯1‿1‿0
hps ← <˘⍉dx≍dy

NT ← { hp𝕊ptp:
  1<⌈´|hp-ptp? ptp+×hp-ptp;
  𝕩
}
F ← {
  ps ← ⟨⟩
  𝕩 { ptps𝕊hp:
    ch ← hp
    r ← {ch↩ch NT 𝕩}¨ ptps
    ps∾↩< ¯1⊑r
    r
  }˜´⌽ hps
  ≠⍷ps
}

•Show F ⟨0‿0⟩
•Show F 9⥊⟨0‿0⟩