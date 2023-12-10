#!/usr/bin/env cbqn
⟨RB, B10, Num, SInts, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "utils.bqn"
m ← >•FLines ≠◶"10.in"‿⊑ •args
l ← m∊"-J7S"
r ← m∊"-FLS"
u ← m∊"|LJS"
d ← m∊"|F7S"

l∧↩»˘r
r∧↩«˘l
u∧↩»d
d∧↩«u

max ← 1+≠⥊m
dist ← {a←1+𝕩 ⋄ 𝕩⌊´⟨(max×¬d)+«a,(max×¬u)+»a,(max×¬l)+»˘a,(max×¬r)+«˘a⟩}_fx_≢ 1¨⌾((⥊m='S')⊸/○⥊) max¨m
•Show ¯1+⌈´max⊸≠⊸/ ⥊dist

mw ← dist≠max
# e ← {𝕩 ∨´ (¬mw)⊸×¨ ⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}_fx_≢ mw<1(»˘∨«˘)1¨∘⊏⊸(»∨«)0¨ m
# •Show dist≠max
# •Show (¬e∨mw) ∧ m='.'
# •Show (≠⥊m) - (+´⥊mw) + +´⥊e

xw ← {mw‿l‿r‿u‿d: mw ∨´ ⟨»d,«u,»˘r,«˘l⟩} {(∾(1‿1⊸≡¨↕3‿3)¨𝕩)×3/˘3/𝕩}¨ mw⊸×¨mw‿l‿r‿u‿d

e ← {𝕩 ∨´ (¬xw)⊸×¨ ⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}_fx_≢ xw<1(»˘∨«˘)1¨∘⊏⊸(»∨«) 0¨ xw
•Show +´⥊¬mw∨(⥊⟜0‿1‿0¨ ≢e)/e