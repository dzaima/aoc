#!/usr/bin/env bqn
⟨BrailleDisplay, Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l0 ← Ints¨ •FLines 2025‿9 Input •args
t ← <˘⍉> l0
•Show ⌈´ (↕≠l0) {⌈´ ×´ |1+ (𝕨↑¨t)-𝕩}¨ l0

ul ← {{1↓⥊𝕩≍˘˜s+⌊0.5×𝕩-s←»𝕩}∧⍷𝕩}¨ t # unique coordinates, plus intermediates to not let flood-fill cross points outside
# ul ← ∧∘⍷¨t

upt ← ul⊐¨t
up ← <˘⍉> upt
p ← ∾ (⊢ {(<𝕨⌊𝕩)+⥊↕1+|𝕨-𝕩}¨ 1⌽⊢) up
m ← 1¨⌾(p⊸⊑) 0⥊˜1+⌈´¨upt

{
  n ← m < ∨´⟨𝕩,»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩
  n≢𝕩? m∨↩n ⋄ n;
  @
}•_while_(@⊸≢) 1⌾((⌊0.4‿0.4×≠¨ul)⊸⊑) 0¨m # flood-fill starting at some manually-picked position

# •Out˘ BrailleDisplay m

m <˘↩
mx ← 0
# best ← @
{
  >´⊑¨𝕨‿𝕩?@;
  ⟨y0,x0⟩𝕊⟨y1,x1⟩:
    # p0 ← 𝕨⋈𝕩
    x0‿x1 ∧↩
    y1‿x1+↩1
    sz ← ×´1+| (𝕨⋈¨𝕩) (-´⊏)¨ ul
    
    ok ← ∧´ {∧´x0↓x1↑𝕩}¨ y0↓y1↑m
    # d ← x1-x0 ⋄ ok ← ∧´ {d≤⊑0⊐˜x0↓𝕩}¨ y0↓y1↑m # alternative way of doing the above
    
    # {𝕊:best↩∧⌾(1⊸⊑¨)p0}⍟⊢mx<ok×sz
    mx⌈↩ok×sz
}⌜˜ up
•Show mx

# m ↩ 2⊸+⌾((⥊(<⊑best)+↕¬˜´best)⊸⊑) >m
# •Show m⊏"·#?⌷"

# •Show ⊏⟜"·#?⌷" m⊏˜ ul⍋¨ ⌊(⌈´¨t)× <(↕÷⊢)100
