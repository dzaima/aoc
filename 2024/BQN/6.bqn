#!/usr/bin/env bqn
⟨MDSlash, _underSelect_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿6 Input •args

w ← l='#'
n ← ≠l
p0 ← 0 ⋈ ⋈⁼MDSlash l='^'

ds ← (⌽-⌾⊑)⍟(↕4) ¯1‿0

v←•HashMap˜⟨⟩
G ← { part1 𝕊 w:
  v.Delete¨ v.Keys@
  wr ← <˘∘⍉¨ ⍉∘⌽⍟(↕4) ⌽w
  m ← 0¨ l
  S ← {
    0 v.Get 𝕩? 1;
    d‿p:
      𝕩 v.Set 1
      y2‿x2 ← ((n-1)⊸-⌾⊑⌽)⍟d p
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
  
  st‿m
}
# ! 0=⊑G w
m0 ← 1⊑ 1 G w
•Show +´⥊ m0
•Show +´ {⊑0 G 1⌾(𝕩⊸⊑) w}¨ MDSlash m0
