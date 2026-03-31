#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input, SMT⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨¨ ⟨⟩SplitF•FLines 2024‿13 Input •args

•Show +´∞⊸≠⊸/ { a‿b‿c:
  ⌊´+´¨ 3‿1⊸×¨ MDSlash c⊸≡¨ (a <⊸× ↕100) +⌜ b <⊸× ↕100
}¨ l

⟨newrepl⟩ ← SMT "z3"‿"cvc5"
r ← Newrepl @

foo ← r.REPLExec "
  { a‿b‿c:
    ac ← $int ⋄ _s ↩ {𝔽}
    bc ← $int ⋄ _u ↩ {𝔽}
    # ac ← $i64
    # bc ← $i64
    Sat q←⟨ac≥_s 0, bc≥_s 0, ∧´ c = (bc×b) + ac×a⟩?
    tk ← +´3‿1×ac‿bc
    tc ← Find tk
    # •Show FindToBQN¨ tc‿ac‿bc
    { 𝕊:
      # •Show FindToBQN¨ tc‿ac‿bc
      Sat q ∾ tk <_u tc?
      tc ↩ Find tk
      1
      ;0
    }•_while_ ⊢ 1
    EvalToBQN tc
    ; @
  }
"

# •Out 100⥊'#'
•Show +´ @⊸≢¨⊸/ { a‿b‿c:
  c+↩ 10000000000000
  Foo a‿b‿c
  # •Show a‿b‿c
  # # •Show b×⌽c
  # •Show (-´c) ÷ •Show a +○(-´) b
  # # •Show (-´c)÷a-○(-´)b
  # •Show 
}¨ l
