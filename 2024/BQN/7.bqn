#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿7 Input •args

Part ← { part 𝕊 𝕩:
  exp   ← 0⊑𝕩
  start ← 1⊑𝕩
  tail  ← 2↓𝕩
  exp × ∨´start = ⟨exp⟩ { val𝕊acc:
    sub ← acc - val
    r ← sub ∾ ⌊⊸=⊸/ acc÷val
    {𝕊:
      r∾↩ ⌊⊸=⊸/ sub ÷ 10⋆≠•Repr val
    }⍟⊢ part=2
    r
  }´ tail
}¨⟜l

•Show +´ Part 1
•Show +´ Part 2
