#!/usr/bin/env cbqn
# iterates through compressed range points, sees which cube it intersected with last

⟨RB, B10, Num, Ints, SInts, Split⟩ ← •Import "../utils.bqn"
l ← {⟨'n'=1⊑𝕩 ⋄ <˘⍉3‿2⥊SInts𝕩⟩}¨ •FLines ≠◶"../22.in"‿⊑ •args

Do ← { 𝕊inp:
  on ← ⊑¨inp
  cs‿ce ← {<˘⍉>𝕩}¨ 0‿1+<˘⍉>1⊑¨inp
  u ← ⍷∘∧¨ cs∾¨ce

  mcs ← u⊐¨cs
  mce ← u⊐¨ce

  szx‿szy‿szz ← ≠¨u
  zi ← ↕szz-1
  zw ← (1⊸↓-¯1⊸↓) 2⊑u
  
  +´{𝕊xy:
    v ← /∧´(𝕩≥2↑mcs)∧𝕩<2↑mce
    s‿e‿con ← v⊸⊏¨ (2⊑¨mcs‿mce)∾<on
    con ↩ 0∾con
    s‿e⌽¨↩
    xyw ← ×´ ((1+xy)⊑¨2↑u) - (xy⊑¨2↑u)
    xyw× +´zw×{con⊑˜+´∨` (𝕩≥s)∧𝕩<e}¨ zi
    # +´{con⊑˜+´∨` (𝕩≥s)∧𝕩<e}¨ zi
  }¨ ⥊↕szx‿szy-1
}


•Show Do {⟨v⋄s‿e⟩: ∧´ (s≥¯50)∧e≤50}¨⊸/ l
•Show Do l