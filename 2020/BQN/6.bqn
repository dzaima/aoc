#!/usr/bin/env bqn
⟨SplitF⟩ ← •Import "../../utils/utils.bqn"
l ← ⟨⟩ SplitF •FLines ≠◶"6.in"‿⊑ •args

•Show +´ {+´∊∾𝕩}¨ l
•Show +´ {≠(∊/⊣)´𝕩}¨ l