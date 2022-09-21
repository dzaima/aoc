#!/usr/bin/env cbqn
⟨RB, B10, Num, Ints, Split⟩ ← •Import "utils.bqn"
l ← •FLines ≠◶"13.in"‿⊑ •args

p‿ins ← (l⊑∘⊐<⟨⟩)(↑⋈↓)l

ins ↩ {⟨11⊑𝕩⋄⊑Ints𝕩⟩}¨ 1↓ins
px‿py←<˘⍉> Ints¨ p

Step ← {
  'y'‿n𝕊px‿py: ⟨px⋄n-|n-py⟩;
  'x'‿n𝕊px‿py: ⟨   n-|n-px⋄py⟩
}

•Show +´∊⍉> (⊑ins) Step px‿py
ep ← px‿py Step´⌽ ins
•Out˘ " #"⊏˜ ⍉ 1¨⌾((<˘⍉>ep)⊸⊑) 0⥊˜ 1+ ⌈´¨ ep