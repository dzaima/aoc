#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints⊑•FLines 2024‿11 Input •args

•Show ≠(∾{0:⟨1⟩; n←•Repr 𝕩 ⋄ 0=2|≠n? •ParseFloat¨(2÷˜≠n)(↑⋈↓)n; ⋈𝕩×2024}¨)⍟25 l
F ← {0:⟨1⟩; n←•Repr 𝕩 ⋄ 0=2|≠n? •ParseFloat¨(2÷˜≠n)(↑⋈↓)n; ⋈𝕩×2024}
•Show +´⊑{b←F¨ 𝕩⋄c←((≠¨b)/𝕨)⋈∾b⋄g←⊐1⊑c⋄⌽⟨⍷1⊑c,+´¨g⊔⊑c⟩}´⍟75 1¨⊸⋈ l