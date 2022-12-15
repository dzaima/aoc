#!/usr/bin/env cbqn
⟨SInts⟩ ← •Import "utils.bqn"
l ← SInts¨ •FLines ≠◶"15.in"‿⊑ •args
sp ← <˘⍉>2↑¨l
bp ← <˘⍉>2↓¨l
d ← +´|sp-bp

testInput ← 0 # ∧´(⌈˝∾2‿2⊸⥊¨ l)≤1000
y ← {testInput? 10; 2000000}
m ← {testInput? 20; 4000000}

spx‿spy ← sp
_ranges ← { 𝔽_𝕣 y:
  range ← d-|spy-𝕩
  xs‿ws ← (<range≥0)/¨ spx‿range
  x0‿x1 ← 𝔽 ⟨xs-ws, xs+ws⟩
  x0‿x1 (⍋x0)⊸⊏¨↩
  x1 ⌈`↩
  y‿x0‿x1
}

{
  ·‿x0‿x1 ← ⊢_ranges y
  x1⌊↩ ∞«x0
  •Show +´x1-x0
}

{ y‿x0‿x1:
  0≠≠r←((2+»x1)=x0)/x0?
  •Show y+4000000×⋈⁼r-1;
  1
}∘({m⌊0⌈𝕩}_ranges)¨ ↕m