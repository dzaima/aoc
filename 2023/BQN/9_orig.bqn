#!/usr/bin/env bqn
⟨SInts⟩ ← •Import "../../utils/utils.bqn"
l ← SInts¨ •FLines ≠◶"9.in"‿⊑ •args

•Show +´{¯1⊑{+`(⊑𝕨)∾𝕩}´ ∾⟜0⌾(¯1⊑⊢) {𝕩∾<1↓+`⁼¯1⊑𝕩}•_while_{𝕊:∨´0≠¯1⊑𝕩} ⋈𝕩}¨ l
•Show +´{¯1⊑{+`(⊑𝕨)∾𝕩}´ ∾⟜0⌾(¯1⊑⊢) {𝕩∾<1↓+`⁼¯1⊑𝕩}•_while_{𝕊:∨´0≠¯1⊑𝕩} ⋈⌽𝕩}¨ l
# 1866957968 high - used Ints instead of SInts :/