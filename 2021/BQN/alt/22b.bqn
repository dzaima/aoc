#!/usr/bin/env -S cbqn -M 4200
# stores an array of whether each point is on, and sets them for each cube
# CBQN make command to make this faster:
# make t=day22 f='-DCHECK_VALID=0 -march=native -O3' singeli=1 c

⟨RB, B10, Num, Ints, SInts, Split⟩ ← •Import "../utils.bqn"
l ← {⟨'n'=1⊑𝕩 ⋄ <˘⍉3‿2⥊SInts𝕩⟩}¨ •FLines ≠◶"../22.in"‿⊑ •args

Do ← { 𝕊inp:
  on ← ⊑¨inp
  cs‿ce ← {<˘⍉>𝕩}¨ 0‿1+<˘⍉>1⊑¨inp
  u ← ⍷∘∧¨ cs∾¨ce

  mcs ← u⊐¨cs
  mce ← u⊐¨ce
  sh ← ≠¨u
  b ← ¯2+(×´sh)⥊2 # don't bitarr
  on {
    s‿e ← 𝕩⊑¨¨mcs‿mce
    idxs ← {∾𝕨+<𝕩}´ (⌽×`1»⌽sh)× s +↕¨ e-s
    b (¯2+(≠idxs)⥊2+𝕨)⌾(idxs⊸⊏)↩
    1
  }¨ ↕≠⊑mcs
  
  zsz ← 2⊑sh
  zi ← ↕zsz-1
  zw ← (1⊸↓-¯1⊸↓) 2⊑u
  br ← sh⥊b
  +´{𝕊xy:
    (×´ ((1+xy)⊑¨2↑u) - (xy⊑¨2↑u)) × +´zw× ¯1↓br⊏´⌽xy
  }¨ ⥊↕(2↑sh)-1
}


•Show Do {⟨v⋄s‿e⟩: ∧´ (s≥¯50)∧e≤50}¨⊸/ l
•Show Do l