#!/usr/bin/env cbqn
l ← >'0'-˜•FLines ≠◶"8.in"‿⊑ •args

F ← {𝕩>(¯1¨⊏𝕩)»⌈`𝕩}
•Show +´⥊ m ← (F ∨ F⌾⌽ ∨ F⌾⍉ ∨ F⌾(⌽⍉)) l

lt ← ⟨l,⍉l⟩
•Show ⌈´⥊l {×´ +´¨∧`¨1»¨ 𝕨 > ∾ lt {l𝕊a‿b: ⟨(1+b)↓a⊏l, ⌽b↑a⊏l⟩}¨ 𝕩⋈⌽𝕩}¨ ↕≢l