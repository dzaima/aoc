#!/usr/bin/env bqn
⟨MDSlash, Input⟩ ← •Import "../../utils/utils.bqn"
l ← '0'-˜>•FLines 2024‿10 Input •args
_step ← {(l=𝕨) × (»𝕩) 𝔽 (»˘𝕩) 𝔽 («𝕩) 𝔽 «˘𝕩}
_run ← {+´⥊ 𝕩 𝔽 _step´ ⌽1+↕9}

empty ← 0¨ l
•Show +´{∨_run 1⌾(𝕩⊸⊑)empty}¨ MDSlash l=0
•Show +_run l=0
