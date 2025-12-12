#!/usr/bin/env bqn
# part 1: 7:49; both: 7:55
⟨SMT, RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ¯1(↓⋈⊑) ⟨⟩SplitF •FLines 2025‿12 Input •args
a (>1⊸↓)¨↩
a=↩'#'
b {Ints¨ ':'Split𝕩}¨↩

# ⟨newrepl⟩ ← SMT "z3"‿"cvc5"

# r ← Newrepl@

# solve ← r.Exec "{a𝕊b:
#   •Show a
# }
# "
# •Show a Solve b
k←+´∘⥊¨a
•Show +´{a‿b: (×´a) < +´b×k? 0; 1}¨ b
