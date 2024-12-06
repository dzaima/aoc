#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, Tr, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿6 Input •args
w←l='#'
p ← 0 ⋈ ⋈⁼MDSlash l='^'
n←≠l

ds ← (⌽-⌾⊑)⍟(↕4) ¯1‿0

G ← { 𝕊 w:
  m ← 0¨l
  wr←<˘∘⍉¨ ⍉∘⌽⍟(↕4) ⌽w
  v←•HashMap˜⟨⟩
  S ←{
    0 v.Get 𝕩? 1;
    ·‿p: ∨´(p≤0) ∨ p≥n-1? 0;
    ⟨d,p⟩:
      𝕩 v.Set 1
      y2‿x2 ← (⌽(n-1)⊸(-)⌾⊑)⍟(-d) p
      # •Show ⟨d,p,y2‿x2,(-y2)↑x2⊑d⊑wr⟩
      s ← +´∧`¬>(-y2)↑x2⊑d⊑wr
      m (1+d)¨⌾((p⊸+¨(d⊑ds)⊸×¨↕s+1)⊸⊑) ↩
      (4|1+d) ⋈ p+ (d⊑ds)×s
  }
  st ← S•_while_(1==) p
  
  st‿m
}
# •Show S⍟11 p
# •Show +´⥊G@
•Show +´×⥊1⊑G w
•Show +´{
  w2 ← 1⌾(𝕩⊸⊑) w
  ⊑G w2
}¨ ⥊↕n‿n
