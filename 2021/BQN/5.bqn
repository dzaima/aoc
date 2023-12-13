#!/usr/bin/env cbqn
⟨Num, RB, Ints⟩ ← •Import "../../utils/utils.bqn"

ps ← {<˘2‿2⥊𝕩}¨ Ints¨ •FLines ≠◶"5.in"‿⊑ •args
vs ← {s‿e: s<⊸+(<×e-s)×↕1+⌈´|e-s}¨ps
{•Show +´1=⊒∾𝕩}¨ vs⋈˜vs/˜(∨´=´)¨ps

# •Show +´˘•Show 1< •Show ⍉(0⥊˜1+⌈´∾vs) {1⊸+⌾(𝕨⊸⊑)𝕩}´ ∾vs