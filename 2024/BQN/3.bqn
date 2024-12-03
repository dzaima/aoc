#!/usr/bin/env bqn
⟨Num, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2024‿3 Input •args

on ← 1
Process ← {part2 𝕊 l:
  S ← (¯1+≠∘⊣) {∨⟜»⍟𝕨 𝕩∾𝕨⥊0} ⍷
  _next ← { 𝔽_𝕣𝕩:
    m ← ∧`𝔽 l
    ⊑1↑m?
      n ← +´m
      (l↓˜↩n) ⊢ 1⋈n↑l
    ;
      0‿@
  }
  r ← ↕0
  { 𝕊:
    {𝕊:
      ⊑   "do()"⊸S _next@? on↩1 ⋄ 1;
      ⊑"don't()"⊸S _next@? on↩0 ⋄ 1;
      0
    } •_while_⊢ part2
    ⊑        "mul("⊸S _next@?
    ⊑·‿a←('0'⊸≤∧≤⟜'9')_next@?
    ⊑           ","⊸S _next@?
    ⊑·‿b←('0'⊸≤∧≤⟜'9')_next@?
    ⊑           ")"⊸S _next@?
    r∾⍟on˜↩ a ×○Num b;
    l ↓˜↩1
    @
  } •_while_ {𝕊:×≠l}@
  +´r
}

•Show +´ 0 Process¨ l
•Show +´ 1 Process¨ l
