#!/usr/bin/env cbqn
⟨Ints⟩ ← •Import "utils.bqn"
l ← •FLines ≠◶"6.in"‿⊑ •args

# Calc ← {+´ 𝕩 < ≠⊸-⊸× ↕𝕨} # basic O(n) array thing
# Calc ← {¬˜´ ⌈‿⌊{𝕎𝕩}¨ 2÷˜ 𝕨 (-⋈+) √(×˜𝕨) - 4×𝕩+1} # basic math; ⌈‿⌊{𝕎𝕩}¨ → ⌈⊸⋈⟜⌊´ is a fun option
Calc ← {𝕨 (⌊∘+ ¬ ⌈∘-)○(÷⟜2) √(×˜𝕨) - 4×𝕩+1} # merging the math together with logic

•Show ×´ Calc¨○Ints´ l
•Show Calc´ {•ParseFloat ∊⟜('0'+↕10)⊸/ 𝕩}¨ l