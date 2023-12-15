#!/usr/bin/env bqn
⟨_fx_⟩ ← •Import "../../utils/utils.bqn"
l ← ".#O" ⊐ >•FLines ≠◶"14.in"‿⊑ •args


inds ← ⥊ (≠l) / ≍↕1+≠l
main ← ⥊ (1¨l) ∾˘ 0¨⊏l
zero ← ⥊ 0⥊˜1‿0+≢l
Move ← { # filter a whole-array scan
  wm‿t1j‿tj1‿tj1s𝕊𝕩:
  cs ← tj1 / ⥊⍉ (⊢∾¯1⊏⊢) +`2=𝕩
  ls ← cs - »cs × tj1 / main
  xs ← / tj1s
  ys ← ls + t1j / inds
  wm -˜ 2×¬ ≠` wm ≠ (≢𝕩) ⥊ 1¨⌾((xs+ys×≠𝕩)⊏⊢) zero
}
pre0‿pre1‿pre2‿pre3 ← {
  row1 ← 1¨⊏l
  wm ← 1=𝕏 l
  t1j ← ⥊⍉ row1 ∾ wm
  tj1m ← ⍉ wm ∾ row1
  tj1 ← ⥊ tj1m
  tj1s ← +˝˘tj1m
  wm‿t1j‿tj1‿tj1s
}¨ ⟨⊢, ⍉, ⌽, ⌽⍉⟩

# l⊏↩1‿0‿2 ⋄ Move ↩ {𝕩 + «⊸- (1=»𝕩)∧2=𝕩}_fx_≢∘⊢ # simple iterative moving

Load ← {+´ (+˝˘ × 1+⌽∘↕∘≠) 2=𝕩}

•Show Load pre0 Move l

p ← ⟨⟩
v ← l

m ← •HashMap˜ ⟨⟩
{ 𝕊:
  p∾↩ <v
  v ↩ pre3⊸Move⌾(⌽⍉) pre2⊸Move⌾⌽ pre1⊸Move⌾⍉ pre0⊸Move v
  {m.Has v? 0; 1⊣ v m.Set ≠p}
}•_while_⊢ 1

a ← m.Get v
b ← ≠p

•Show Load p⊑˜ a+(b-a)|1000000000-a