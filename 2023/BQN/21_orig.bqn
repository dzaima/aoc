#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2023‿21 Input •args

w ← l='#'
nw ← ¬w
ls ← l='S'

Step ← {nw∧∨´⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}
•Show +´⥊Step⍟64 ls
# •Show +´⥊{nw∧∨´⟨»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}⍟26501365 l='S'
# 7329

s0 ← ≠l
x ← 11
nw ↩ ∾x‿x⥊<nw
ls ↩ ∾ls⌾((⌊x‿x÷2)⊸⊑)x‿x⥊<0¨ ls

# •Show +´∘⥊¨ {<⎉2 0‿2‿1‿3⍉x‿s0‿x‿s0⥊𝕩} Step⍟(s0+s0+s0+s0+s0|26501365) ls
#•Show +´∘⥊ Step⍟(s0+s0+s0|26501365) ls
smax ← 26501365
r0 ← 4
sdone ← (r0×s0) + s0|smax
sums ← +´∘⥊¨ {<⎉2 0‿2‿1‿3⍉x‿s0‿x‿s0⥊𝕩} Step⍟(sdone) ls
# •Show sums

rep ← (smax-sdone)÷s0
kv←∨{𝕩⋈˜+´⥊sums=𝕩}¨ 0⊸≠⊸/ ⍷⥊sums
# •Show >kv
rtot ← rep + r0

•Show +´{r‿v: {r≡r0? v×rtot; r≡r0-1? v×rtot-1; r≡×˜r0? v××˜rtot; r≡×˜r0-1? v××˜rtot-1; v}}¨ kv
