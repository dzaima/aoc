#!/usr/bin/env bqn
⟨MDSlashI, _fx_⟩ ← •Import "../../utils/utils.bqn"
l ← "#.O" ⊐ >•FLines ≠◶"14.in"‿⊑ •args


Move ← {m ← (1=»𝕩)∧2=𝕩 ⋄ 𝕩 + «⊸- m}_fx_≢

# version of Move that doesn't iterate until fixed-point, but about the same speed
# Move ↩ {
#   h ← 1∾h0←0=𝕩
#   hi ← /h
#   h0 -˜ 1+ ≠`¯1↓h≠(≠h)↑/⁼ hi + (≠hi)↑/⁼ ¯1+hi ⍋ /2=𝕩
# }˘⌾⍉

Load ← {+´ (+˝˘ × 1+⌽∘↕∘≠) 2=𝕩}

•Show Load Move l
# •Exit 0

p ← ⟨⟩
v ← l

m ← •HashMap˜ ⟨⟩
{ 𝕊:
  p∾↩ <v
  v ↩ Move⌾(⌽⍉) Move⌾⌽ Move⌾⍉ Move v
  {m.Has v? 0; 1⊣ v m.Set ≠p}
}•_while_⊢ 1

a ← m.Get v
b ← ≠p

•Show Load p⊑˜ a+(b-a)|1000000000-a