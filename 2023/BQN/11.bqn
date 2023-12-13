#!/usr/bin/env bqn
⟨MDSlashI⟩ ← •Import "../../utils/utils.bqn"
l ← '#'=>•FLines ≠◶"11.in"‿⊑ •args

Dist ← {+´∾ +´| (¯1↓↑)¨⊸- MDSlashI 𝕩}

dx ← Dist ⟨1+¬∨˝˘l, 1+¬∨˝l⟩/l # distances when expanded to 2 separating spaces
•Show dx
dr ← Dist l # distances when not expanded
•Show dr + (1e6-1)×dx-dr # extrapolate behavior at 1000000
