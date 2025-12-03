#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜•FLines 2025‿3 Input •args

F ← {
  r ← 0
  𝕩 { # fold; 𝕩≡accumulator - n↓line, 𝕨≡¯k to 0:
    m ← ⌈´ 𝕨↓𝕩   # next largest digit (leaving 𝕨 elements for later iterations)
    r ↩ m + r×10 # add that to the result
    𝕩↓˜ 1+⊑𝕩⊐m   # slice accumulator to after m
  }´ -↕𝕨
  r
}
•Show +´ 2 F¨ l
•Show +´12 F¨ l
