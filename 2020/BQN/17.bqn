#!/usr/bin/env cbqn
⟨SplitF, Ints⟩ ← •Import "../../utils/utils.bqn"
l ← >'#'=•FLines ≠◶"17.in"‿⊑ •args

Iter ← {
  x ← (2+≢𝕩)↑𝕩
  s ← x⌽˜𝕨⥊¯1
  n ← s -˜ x {+´¯2‿¯1‿0⌽⎉𝕨¨< 𝕩}´ 1+↕𝕨
  (n=3) ∨ s∧n=2
}

•Show +´⥊ 3 Iter⍟6 ≍l
•Show +´⥊ 4 Iter⍟6 ≍≍l