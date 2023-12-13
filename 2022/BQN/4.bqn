#!/usr/bin/env cbqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
l ← <˘¨ 2‿2⊸⥊¨ Ints¨ •FLines ≠◶"4.in"‿⊑ •args

•Show +´{∨´{⟨a‿b,c‿d⟩:  (a≥c)∧b≤d}¨⟨𝕩,⌽𝕩⟩}¨ l
•Show +´   {⟨a‿b,c‿d⟩: ¬(b<c)∨a>d}¨ l
