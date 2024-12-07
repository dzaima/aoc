#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, Tr, Input⟩ ← •Import "../../utils/utils.bqn"
l ← {<˘2‿3⥊SInts 𝕩}¨ •FLines 2023‿24 Input •args
# l ↩ {{•ParseFloat¨ ','Split𝕩}¨ '@'Split ' '⊸≠⊸/ 𝕩}¨ •FLines 2023‿24 Input •args
x‿y‿z‿vx‿vy‿vz ← Tr ∾¨l
x2‿y2‿z2 ← x‿y‿z + vx‿vy‿vz
b0‿b1 ← 200000000000000‿400000000000000
{𝕊:b0‿b1 ↩ 7‿27}⍟⊢ 5=≠l

Cr ← { x1‿y1‿x2‿y2‿x3‿y3‿x4‿y4:
  # px ← ((((x1×y2)-y1×x2)×(x3-x4)) - (x1-x2)×((x3×y4)-(y3×x4))) ÷ ((x1-x2)×(y3-y4)) - (y1-y2)×(x3-x4)
  # py ← ((((x1×y2)-y1×x2)×(y3-y4)) - (y1-y2)×((x3×y4)-(y3×x4))) ÷ ((x1-x2)×(y3-y4)) - (y1-y2)×(x3-x4)
  # px‿py
  vx1 ← x2-x1
  vy1 ← y2-y1
  vx3 ← x4-x3
  vy3 ← y4-y3
  # ax + c
  # bx + d
  s1 ← vy1÷vx1
  s3 ← vy3÷vx3
  o1 ← y1 - x1×s1
  o3 ← y3 - x3×s3
  px ← (o1-o3)÷s3-s1
  py ← o1 + s1 × px
  px‿py
}
•Show +´⥊ {>⌜˜↕≠𝕩}⊸×> {⟨x3‿y3‿z3, vx3‿vy3‿vz3⟩:
  x4‿y4‿z4 ← x3‿y3‿z3 + vx3‿vy3‿vz3
  px‿py ← Cr x‿y‿x2‿y2‿x3‿y3‿x4‿y4
  # •Show (px-x )÷vx
  # •Show (px-x3)÷vx3
  b ← ∧´(px‿py≥b0) ∧ px‿py≤b1
  b∧↩ 0 ≤ (px-x) ÷ vx
  b∧↩ 0 ≤ (px-x3) ÷ vx3
  # •Out "--------"
  # •Show >⌊x‿px
  # •Show >⌊y‿py
  # •Show 0 ≤ (py-y) ÷ vy
  # •Show 0 ≤ (py-y3) ÷ vy3
  # •Show 0 ≤ (px-x) ÷ vx
  # •Show 0 ≤ (px-x3) ÷ vx3
  # {•Show 𝕩⋈x3}⍟(×≠) x /˜ b ∧ ¬ (0 ≤ (px-x) ÷ vx) ∧ (0 ≤ (px-x3) ÷ vx3)
  # pr ← =´vx‿vy÷vx3‿vy3
  # b∧↩ ¬pr
  # pr ← (vy3×vx) = vx3×vy
  # •Show /pr ∧ =´ (x3‿y3-x‿y)÷vx‿vy
  # •Show (px∊∞‿¯∞)⊸/b
  # b∨↩ pr ∧ (px≠px) ∧ ∨´ {{∧´(𝕩≥b0)∧𝕩≤b1} Cr 𝕩∾⟨x3,y3,x4,y4⟩}¨ ⟨b0‿b0‿b0‿b1, b0‿b0‿b1‿b0, b1‿b0‿b1‿b1, b0‿b1‿b1‿b1⟩
  # •Show px∊∞‿¯∞
  # b∨↩ px≠px
  # •Show >px‿py‿pr
  # •Show >px‿py‿(((px=x ) ∨ (×vx ) = ×px-x) ∧ (px=x3) ∨ (×vx3) = ×px-x3)‿(¬=´vx‿vy÷vx3‿vy3)
  # •Show b
  b
}¨ l
# 14042 low
# 14045 wrong
# 28084 high


⟨newrepl⟩ ← •Import"path/to/bqn-smt/bitwuzla.bqn" # https://codeberg.org/dzaima/bqn-smt
r ← Newrepl @
(r.REPLExec "l←@ ⋄ {l↩𝕩}") {𝕎𝕩} 4↑l

r.REPLExec "

r0 ← I64¨ ""xyz""
rv ← I64¨ 'v'∾¨ ""xyz""

Sat {⟨c0,cv⟩: t←I64@ ⋄ ∧´ (r0 + t×rv) = c0 + t×cv}¨ l
•Show +´ EvalToBQN¨ Find¨ r0
"