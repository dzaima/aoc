#!/usr/bin/env bqn
l ← •FLines ≠◶"18.in"‿⊑ •args

BQNify ← {𝕩 '×'¨⌾(('*'=𝕩)⊸/) ↩}

l BQNify¨ ↩

P1 ← {
  {i←"()"⊐𝕩 ⋄ (")("⊏˜2⊸≠⊸/i)⌾((i≠2)⊸/)𝕩} (⍒+`∨⟜»𝕩∊"+×()")⊏𝕩
}

P2 ← {
  𝕩 {𝕩/˜1+𝕩∊"()"} ↩
  m ← 𝕩='×'
  x ← 1+2×m
  "("∾ ")"∾˜ (")("⥊˜≠)⌾((<`x/m)⊸/) x/𝕩
}

EvalList ← {•BQN "⟩"∾˜"⟨"∾ ∾∾⟜','¨ 𝕩}
•Show +´ EvalList P1¨ l
•Show +´ EvalList P2¨ l