#!/usr/bin/env cbqn
l ← >'0'-˜•FLines ≠◶"8.in"‿⊑ •args

F ← {𝕩>(¯1¨⊏𝕩)»⌈`𝕩}
•Show +´⥊ (F ∨ F⌾⌽ ∨ F⌾⍉ ∨ F⌾(⌽⍉)) l

t ← ⍉l
•Show ⌈´⥊ l {𝕨𝕊a‿b: ×´ (+´∧`)¨ 1»¨ 𝕨 > ⟨(1+b)↓a⊏l, ⌽b↑a⊏l, (1+a)↓b⊏t, ⌽a↑b⊏t⟩}¨ ↕≢l