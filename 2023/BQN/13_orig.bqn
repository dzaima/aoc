#!/usr/bin/env bqn
⟨SplitF,Input⟩ ← •Import "../../utils/utils.bqn"
l ← >¨ ⟨⟩SplitF •FLines 2023‿13 Input •args

•Show +´⋈⁼¨ ∾¨ 100‿1⊸×¨ {1+/{≡´𝕩↑˜¨-⌊´≠¨𝕩}¨ ¯1↓1↓<˘⍉>⟨↑𝕩,⌽¨↓𝕩⟩}¨∘{⟨𝕩,⍉𝕩⟩}¨ l
•Show +´⋈⁼¨ ∾¨ 100‿1⊸×¨ {1+/{1=+´⥊≠´𝕩↑˜¨-⌊´≠¨𝕩}¨ ¯1↓1↓<˘⍉>⟨↑𝕩,⌽¨↓𝕩⟩}¨∘{⟨𝕩,⍉𝕩⟩}¨ l
