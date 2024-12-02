#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿2 Input •args

Ok ← {∧⊸(≡∨⌽⊸≡)𝕩? ∧´ (1⊸≤∧≤⟜3) | -˝˘ 2↕𝕩; 0}
•Show +´ Ok¨ l
•Show +´ {∨´ Ok∘/⟜𝕩˘ ≠⌜˜↕≠𝕩}¨ l
