#!/usr/bin/env bqn
⟨Ints, MDSlash, _fx_⟩ ← •Import "../../utils/utils.bqn"
l ← <˘∘‿3⥊Ints •FChars ≠◶"18.in"‿⊑ •args


Adj ← {𝕩 +⌜ ∾⟜-=⟜<↕3}
•Show +´¬(⥊Adj l)∊l

w ← {¬1‿1‿1⌽⁼(2+𝕩)↑𝕩⥊1} 1+⌈´l
n ← ∊⟜l⌾⥊ ¯1+↕3+⌈´l
e ← {(¬n)∧∨´⟨𝕩,»𝕩,«𝕩,«⎉1𝕩,»⎉1𝕩,«⎉2𝕩,»⎉2𝕩⟩}_fx_≢ w
•Show +´(⥊Adj MDSlash e)∊1+l