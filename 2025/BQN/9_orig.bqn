#!/usr/bin/env bqn
# part 1: 19:51; both: 46:21
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2025‿9 Input •args
•Show ⌈´(<˘⍉>l) {⌈´×´|1+𝕗-𝕩}¨ l

# miserable garbage from having somehow misread the problem as disallowing red tiles within the rectangle
# {𝕊l:
#   y‿x ← <˘⍉>∧l
#   cy ← ⊐y
#   yx ← cy⊔x
#   m ← 0
#   {𝕊 y0‿x0:
#     cy0 ← ¯1+⊑y⍋y0
#     w ← ∞
#     (cy0↓cy){ cy1𝕊cy:
#       # •Show 𝕨‿𝕩
#       h ← 1+cy-y0
#       f ← ≥⟜x0⊸/ cy1⊑ yx
#       ×≠f?
#       w0 ← (⌈´ f)-x0
#       m⌈↩ h×w0
#       w⌊↩ w0
#       1;1
#     }¨cy0↓y
#   }¨ l
#   •Show "D"⋈m
# }¨ ⟨l, -⌾(⊑¨) l⟩

# •Show {⊏⟜"·#"1¨⌾(𝕩⊸⊑) 0⥊˜1+⌈´𝕩}∘(<˘·⍉>) ⊐¨<˘⍉>l
{
  t ← <˘⍉>l
  ul ← ∧∘⍷¨t
  # up ←{⊐⌾((⍋𝕩)⊸⊏)𝕩}¨t
  up ← ul⊐¨t
  m ← {
    p ← 𝕩
    p ↩ ∾𝕩 {(<𝕨⌊𝕩)+⥊↕1+|𝕨-𝕩}¨ 1⌽𝕩
    1¨⌾(p⊸⊑) 0⥊˜1+⌈´𝕩
  } <˘⍉> up
  
  f ← 1⌾((⌊0.5‿0.25×≠¨ul)⊸⊑) 0¨m
  ⊢•_while_{𝕊:
    n ← (¬m)∧∨´⟨f,»f,«f,»˘f,«˘f⟩
    n≢f?
    f ↩ n⋄1;0
  } @
  m∨↩ f
  # •Show ⌽⍉⌽˘⊏⟜"·#"m
  m <˘↩
  upt ← <˘⍉>up
  mx ← 0
  {
    >´⊑¨𝕨‿𝕩?@;
    ⟨y0,x0⟩𝕊⟨y1,x1⟩:
      x0‿x1 ∧↩
      y1‿x1+↩1
      # x0‿y0+↩1 ⋄ x1‿y1-↩1
      sz ← ×´1+|-´⊑¨⟜ul¨ 𝕨‿𝕩
      ok ← ∧´{∧´x0↓x1↑𝕩}¨ y0↓y1↑m
      # •Show ok‿sz‿𝕨‿𝕩‿⟨y0,x0,y1,x1⟩
      mx⌈↩ok×sz
  }⌜˜ upt
  •Show mx
}
