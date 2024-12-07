#!/usr/bin/env bqn
⟨SInts, Input⟩ ← •Import "../../utils/utils.bqn"
l ← SInts¨ •FLines 2023‿9 Input •args

F ← ¯1⊑{S𝕩: {∧´0=1↓𝕩? 𝕩∾0; (⊑𝕩)∾S 1↓𝕩}⌾(+`⁼) 𝕩}
•Show +´ F¨ l
•Show +´ F∘⌽¨ l