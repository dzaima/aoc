#!/usr/bin/env bqn
⟨Num,MDSlash⟩ ← •Import "../../utils/utils.bqn"
l ← Num¨ •FLines ≠◶"1.in"‿⊑ •args

# basic brute force; fast enough, but we can do better
# F0 ← {×´ l⊏˜⊑MDSlash 2020=+⌜´ 𝕩⥊<l}
# •Show F0 2
# •Show F0 3

# factor of ≠l faster:
F ← {×´ (⊢∾2020-+´) ⊏⟜l ⊑/○⥊⟜↕⟜≢ (≠l)≠l⊐2020-𝕩}

•Show F l
•Show F l+⌜l