#!/usr/bin/env bqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
l ← Ints •FChars ≠◶"15.in"‿⊑ •args

# •Show ¯1⊑{𝕩∾⊑ (≠𝕩)⊸≠⊸× 1+ (1↓⌽𝕩)⊐¯1⊑𝕩}⍟(2020-≠) l

F ← {
  m ← 0∾˜ ∊⌾⌽ ¯1↓l
  p ← (/m)⌾((m/l)⊸⊏) (1+𝕩⌈´l)⥊¯1+2⋆31
  (¯1⊑l) {
    t←𝕩⊑p
    p 𝕨⌾(𝕩⊸⊑)↩
    0⌈𝕨-t
  }´⌽ ¯1+(≠l)↓↕𝕩
}

•Show F 2020
•Show F 30000000