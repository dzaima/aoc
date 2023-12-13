#!/usr/bin/env bqn
⟨RB, B10, Num, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, ⟩ ← •Import "../../utils/utils.bqn"
t‿d ← Ints¨ a←•FLines ≠◶"6.in"‿⊑ •args

•Show ×´+´¨d {𝕨<(𝕩⊸-×⊢)↕𝕩}¨ t
•Show +´{𝕨<(𝕩⊸-×⊢)↕𝕩}˜´ •ParseFloat¨ ∊⟜('0'+↕10)⊸/¨ a