#!/usr/bin/env bqn
⟨SInts, Input, SMT⟩ ← •Import "../../utils/utils.bqn"
⟨newrepl⟩ ← SMT "z3"‿"cvc5"‿"bitwuzla"
l ← {<˘2‿3⥊SInts 𝕩}¨ •FLines 2023‿24 Input •args

r ← Newrepl @
(r.REPLExec "l←@ ⋄ {l↩𝕩}") {𝕎𝕩} 4↑l

r.REPLExec "
r0 ← ""xyz"" $¨ i64
rv ← ""xyz"" 'v'⊸∾⊸$¨ i64

Sat {⟨c0,cv⟩: t←$i64 ⋄ ∧´ (r0 + t×rv) = c0 + t×cv}¨ l
•Show +´ EvalToBQN¨ Find¨ r0
"