#!/usr/bin/env bqn
⟨Ints, SplitF⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines ≠◶"5.in"‿⊑ •args

i ← ' '⊸≠⊸/¨ <˘ ¯1↓˘ {1+4×↕4÷˜1+≠𝕩}⊸⊏ ⍉> a

_m ← { Op _𝕣 𝕩:
  ⊑¨ i {𝕨𝕊n‿s‿d:
    s‿d-↩1
    ∾˜⟜(Op n↑s⊑𝕨)⌾(d⊸⊑) n⊸↓⌾(s⊸⊑) 𝕨
  }˜´⌽ Ints¨ 𝕩
}

•Out ⌽ _m b
•Out ⊢ _m b