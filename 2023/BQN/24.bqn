#!/usr/bin/env bqn
# does only part 1; part 2 is in a separate file as it needs bqn-smt
⟨SInts, Tr⟩ ← •Import "../../utils/utils.bqn"
l ← {2‿3⥊SInts 𝕩}¨ •FLines ≠◶"24.in"‿⊑ •args

[x1‿y1‿z1 ⋄ vx1‿vy1‿vz1] ← [p1⋄v1] ← Tr l
x2‿y2‿z2 ← p1+v1

b0‿b1 ← 200000000000000‿400000000000000

•Show +´⥊ {>⌜˜↕≠𝕩}⊸×> {[x3‿y3‿z3 ⋄ vx3‿vy3‿vz3]:
  x4‿y4‿z4 ← x3‿y3‿z3 + vx3‿vy3‿vz3
  s1 ← vy1 ÷ vx1
  s3 ← vy3 ÷ vx3
  o1 ← y1 - x1×s1
  o3 ← y3 - x3×s3
  px ← (o1-o3)÷s3-s1
  py ← o1 + s1 × px
  b ← ∧´(px‿py≥b0) ∧ px‿py≤b1
  b∧↩ 0 ≤ (px-x1) ÷ vx1
  b∧↩ 0 ≤ (px-x3) ÷ vx3
  b
}¨ l