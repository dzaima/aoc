#!/usr/bin/env bqn
⟨Num, RB, Ints⟩ ← •Import "../../utils/utils.bqn"
l ← Ints ⊑•FLines ≠◶"7.in"‿⊑ •args

# •Show ⊑∧{+´|l-𝕩}¨ ↕⌈´l
# •Show ⊑∧{+´{2÷˜𝕩×𝕩+1}|l-𝕩}¨ ↕⌈´l
ds←|l⊸-¨ ↕⌈´l
•Show¨ {⌊´+´¨𝕏ds}¨ ⊢‿{2÷˜𝕩×𝕩+1}