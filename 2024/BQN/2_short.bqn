#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿2 Input •args

# not really a golfed solution, but just a shorter one than 2.bqn at the cost of being O(n^2) per line
P1 ← {d←-˝˘2↕𝕩 ⋄ (1=≠⍷×d) ∧´ (1⊸≤∧≤⟜3) | d}
P2 ← {∨´ P1∘/⟜𝕩˘ ≠⌜˜↕≠𝕩}
•Show +´ P1¨ l
•Show +´ P2¨ l
