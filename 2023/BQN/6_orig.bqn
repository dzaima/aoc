#!/usr/bin/env bqn
⟨RB, B10, Num, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, Input⟩ ← •Import "../../utils/utils.bqn"
t‿d ← Ints¨ a←•FLines 2023‿6 Input •args

•Show ×´+´¨d {𝕨<(𝕩⊸-×⊢)↕𝕩}¨ t
•Show +´{𝕨<(𝕩⊸-×⊢)↕𝕩}˜´ •ParseFloat¨ ∊⟜('0'+↕10)⊸/¨ a