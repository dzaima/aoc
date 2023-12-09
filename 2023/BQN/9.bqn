#!/usr/bin/env cbqn
⟨SInts⟩ ← •Import "utils.bqn"
l ← SInts¨ •FLines ≠◶"9.in"‿⊑ •args

F ← ¯1⊑{S𝕩: {∧´0=1↓𝕩? 𝕩∾0; (⊑𝕩)∾S 1↓𝕩}⌾(+`⁼) 𝕩}
•Show +´ F¨ l
•Show +´ F∘⌽¨ l