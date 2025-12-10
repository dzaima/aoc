#!/usr/bin/env bqn
⟨SMT, Ints, Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2025‿10 Input •args
a‿b‿c ← <˘⍉> {
  i ← ⊑𝕩⊐']'
  r ← Ints¨ ' 'Split (2+i)↓𝕩
  ⟨'#'=1↓i↑𝕩, ¯1↓r, ¯1⊑r⟩
}¨ l

t ← a {((≠𝕨)↑/⁼)¨ 𝕩}¨ b

•Show +´ a {a𝕊t: ⌊´ +´¨ {∧´¬a≠˝𝕩/t}¨⊸/ ⥊↕2⥊˜≠t}⟜>¨ t

⟨newrepl⟩ ← SMT "z3"‿"cvc5"

r ← Newrepl@

solve ← r.Exec "
{ c 𝕊 t:
  k ← Int∘@¨ t
  req ← (∧´k≥0) ∧´ c = +´k × t
  sum ← +´k
  {𝕊: FindToBQN sum}•_while_{Sat req ∧ {@: 1; sum<𝕩}𝕩} @
}
"

•Show +´ c Solve¨ t
