#!/usr/bin/env bqn
# part 1: 6:08; both: 22:42
⟨SMT, RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, _memo, Input⟩ ← •Import "../../utils/utils.bqn"
l ← {a‿b←(⊑𝕩⊐']')((1↓↑) ⋈ ·Ints¨ ' 'Split 2⊸+⊸↓)𝕩⋄⟨'#'=a,¯1↓b,¯1⊑b⟩}¨ •FLines 2025‿10 Input •args

•Show+´ { a‿b‿c:
  t ← >((≠a)↑/⁼)¨b
  ⌊´+´¨ {∧´¬a≠˝𝕩/t}¨⊸/ ⥊↕2⥊˜≠b
}¨ l

⟨newrepl⟩ ← SMT "z3"‿"cvc5"

r ← Newrepl@

•Show +´ {·‿b‿c:
  t ← ((≠c)↑/⁼)¨b
  r ← ⟨"","",t‿c⟩ r.Exec "
    t‿c ← •args
    k ← $¨ (≠t)⥊int
    n ← (∧´k≥0) ∧´ c = +´k × t
    best ← @
    sum ← +´k
    {𝕊:
      Sat n ∧ {best≡@? 1; sum<best}?
      b2 ← FindToBQN sum
      (best ↩ b2) ⊢ b2≠best
      ;0
    }•_while_⊢ 1
    best
  "
  # •Show c
  # •Show {(⍋⊏𝕩)⊸⊏˘𝕩}⌾(¯1⊸↓˘) (c∾@)∾(⊏⟜" ▉"∾˘+˝˘) (⍋+˝˘)⊸⊏ t
}¨ l
•Show 
•Show 
•Show 
•Show 
•Show 
