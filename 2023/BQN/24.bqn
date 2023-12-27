#!/usr/bin/env bqn
# does only part 1; part 2 is in a separate file as it needs bqn-smt
⟨SInts, Tr⟩ ← •Import "../../utils/utils.bqn"
l ← (2‿3⥊SInts)¨ •FLines ≠◶"24.in"‿⊑ •args

[x1‿y1‿z1 ⋄ vx1‿vy1‿vz1] ← Tr l

b0‿b1 ← 200000000000000‿400000000000000

•Show +´⥊ {>⌜˜↕≠𝕩}⊸×> {[x2‿y2‿z2 ⋄ vx2‿vy2‿vz2]:
  s1 ← vy1 ÷ vx1
  s2 ← vy2 ÷ vx2
  o1 ← y1 - x1×s1
  o2 ← y2 - x2×s2
  px ← (o1-o2) ÷ s2-s1
  py ← o1 + s1 × px
  b ← ∧´ (px‿py≥b0) ∧ px‿py≤b1
  b∧↩ 0 ≤ (px-x1) ÷ vx1
  b∧↩ 0 ≤ (px-x2) ÷ vx2
  b
}¨ l