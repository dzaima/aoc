#!/usr/bin/env cbqn
⟨Num⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines ≠◶"8.in"‿⊑ •args

ins0‿arg0 ← <˘⍉>{⟨3↑𝕩, -⍟('-'=4⊑𝕩) Num 5↓𝕩⟩}¨ l
ins0 ⊐˜↩ "nop"‿"acc"‿"jmp"

Eval ← { ins‿arg:
  { prev‿acc‿pc:
    {
      ⊑pc∊prev? acc‿pc;
      pc≥≠ins? {pc≡≠ins? ⋈acc; acc‿pc};
      prev∾↩ pc
      argv ← pc⊑arg
      ⊢◶⟨
        {𝕊: ⟨prev, acc, pc+1⟩}
        {𝕊: ⟨prev, acc+argv, pc+1⟩}
        {𝕊: ⟨prev, acc, pc+argv⟩}
      ⟩ pc⊑ins
    }
  }•_while_{3≡≠𝕩} ⟨⟩‿0‿0
}

•Show ⊑ {!2=≠𝕩⋄𝕩} Eval ins0‿arg0

•Show ⋈⁼ ⋈⁼ (1=≠¨)⊸/ {
  Eval ⟨2⊸-⌾(𝕩⊸⊑) ins0, arg0⟩
}¨ /ins0∊0‿2