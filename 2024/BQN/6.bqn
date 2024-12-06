#!/usr/bin/env bqn
⟨MDSlash, _underSelect_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿6 Input •args

n ← ≠l
w ← l='#'
p0 ← 0 ⋈ ⋈⁼MDSlash l='^'

nd ← n-1
RotPos ← ⊣◶⟨⊢, (⊣⋈˜nd-⊢)´⊢, nd⊸-, (⊢⋈nd-⊣)´⊢⟩

ds ← (⌽-⌾⊑)⍟(↕4) ¯1‿0

mz ← 0¨ l
v ← •HashMap˜⟨⟩
G ← { part1 𝕊 wr:
  m ← mz
  S ← {
    0 v.Get 𝕩? 1;
    d‿p:
      𝕩 v.Set 1
      y2‿x2 ← d RotPos p
      forward ← (-y2)↑x2⊑d⊑wr
      steps ← ⊑forward⊐1
      dc ← d⊑ds
      {𝕊: m 1¨ _underSelect_ (p + dc ×⌜ ↕steps+1) ↩}⍟⊢ part1
      
      steps ≠ ≠forward?
      ⟨4|1+d, p + steps×dc⟩
    ;
      0
  }
  st ← S•_while_(1==) p0
  v.Delete¨ v.Keys@
  st‿m
}
# ! 0=⊑G w

wr ← <˘¨ ¯1⌽ ⌽∘⍉⍟(↕4) w
m0 ← 1⊑ 1 G wr
•Show +´⥊ m0
•Show +´ {
  ⊑ 0 G (RotPos⟜𝕩¨ ¯1⌽↕4) {x‿y𝕊𝕩: 1⌾(y⊑x⊑⊢)𝕩}¨ wr
}¨ MDSlash m0
