#!/usr/bin/env bqn
⟨SInts⟩ ← •Import "../../utils/utils.bqn"
⟨newrepl⟩ ← •Import ⊑•args # bqn-smt/bitwuzla.bqn (or cvc5.bqn or z3.bqn) - https://codeberg.org/dzaima/bqn-smt
l ← {<˘2‿3⥊SInts 𝕩}¨ •FLines ≠◶"24.in"‿⊑ 1↓•args

r ← Newrepl @
(r.REPLExec "l←@ ⋄ {l↩𝕩}") {𝕎𝕩} 4↑l

r.REPLExec "
r0 ← I64¨ ""xyz""
rv ← I64¨ 'v'∾¨ ""xyz""

Sat {⟨c0,cv⟩: t←I64@ ⋄ ∧´ (r0 + t×rv) = c0 + t×cv}¨ l
•Show +´ EvalToBQN¨ Find¨ r0
"