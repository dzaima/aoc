#!/usr/bin/env bqn
⟨Input, _fx_⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿12 Input •args

is0 ← {{𝕩 +⎉1 »+`1+¯1⊏𝕩}»+`𝕩≠«𝕩}{⟨𝔽𝕩, 𝔽⌾⍉𝕩⟩} l

gm ← 1+⌈´ ⌈´∘⥊¨ is0

minFFI ← "lib12.so" •FFI "&"‿"group_min_i16"‿"&i16"‿"*i16"‿"*i16"‿"u64"
sumFFI ← "lib12.so" •FFI "&"‿"group_sum_i8_i16"‿"&i16"‿"*i16"‿"*i8"‿"u64"
GroupMin ← {MinFFI ⟨gm⥊32767, 𝕨, 𝕩, ≠⥊𝕨⟩}
GroupSum ← {SumFFI ⟨0⥊˜1+⌈´⥊𝕨, 𝕨, 𝕩, ≠⥊𝕨⟩}
# GroupMin ← ⌊´¨⊔○⥊
# GroupSum ← +´¨ ⊔○⥊

is ← ⊐⌾⥊ ⊑ (⊢ ⋈ ⊣⊏GroupMin)´•_while_(≢´) is0
# •Show z

shifts ← ⟨»˘,»,«˘,«⟩
isp ← is+1 # so that Nudge shifting in zeroes doesn't collide with index 0
shs ← {𝕏isp}¨ shifts
edges ← isp⊸≠¨ shs

areas ← /⁼⥊is
•Show +´ areas × is GroupSum +´edges
•Show +´ areas × is GroupSum +´edges ∧ (¯1⌽edges) ∨ (¯1⌽shifts) {isp=𝕎𝕩}¨ shs
# TODO: remove ○⥊ from ⊔s when CBQN does that fast
