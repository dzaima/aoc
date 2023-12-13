#!/usr/bin/env cbqn
⟨RB, B10, Num, SInts, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "utils.bqn"
l ← >¨ ⟨⟩SplitF •FLines ≠◶"13.in"‿⊑ •args

•Show¨ +´⋈⁼¨ ∾¨ 100‿1⊸×¨ {1+/{≡´𝕩↑˜¨-⌊´≠¨𝕩}¨ ¯1↓1↓<˘⍉>⟨↑𝕩,⌽¨↓𝕩⟩}¨∘{⟨𝕩,⍉𝕩⟩}¨ l
•Show¨  +´⋈⁼¨ ∾¨ 100‿1⊸×¨ {1+/{1=+´⥊≠´𝕩↑˜¨-⌊´≠¨𝕩}¨ ¯1↓1↓<˘⍉>⟨↑𝕩,⌽¨↓𝕩⟩}¨∘{⟨𝕩,⍉𝕩⟩}¨ l