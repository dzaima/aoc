#!/usr/bin/env cbqn
⟨Num, SplitF⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜¯1+•FChars ≠◶"23.in"‿⊑ •args

F ← {
  m ← (⍋𝕩)⊏1⌽𝕩 # map from number to next
  t ← ≠m
  Step ← {
    p ← ⊑⟜m⍟(1+↕4) 𝕩  # picked up, plus a 4th element
    m (3⊑p)⌾(𝕩⊸⊑)↩    # remove the picked up from the map
    d ← {(t|-⟜1)•_while_{𝕊:⊑𝕩∊3↑p} t|𝕩}⍟((<⟜0) ∨´ p=⊢) 𝕩-1 # destination; ∨´p=⊢ overestimates, but we don't care
    dn ← d⊑m          # after destination
    m (⊑p)⌾(d⊸⊑)↩     # inset picked up
    m (dn)⌾((2⊑p)⊸⊑)↩ # and end picked up at dn
    𝕩⊑m               # next value
  }
  Step⍟𝕨 ⊑𝕩
  m
}

•Out '1'+⊑⟜(100 F l)⍟(1↓↕≠l) 0
•Show ×´1+{⊑⟜𝕩⍟1‿2 0} 10e6 F l∾(≠l)↓↕1e6
