#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Select, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2024‿18 Input •args
m←1+⌈´l
y0←{25=≠l? 12;1024}
w ← 1¨⌾((y0↑l)⊸⊑) m⥊0
# •Show w⊏"·#"
Step ← {w𝕊a‿b: ⟨a+1, (¬w)∧∨´⟨b,»b,«b,»˘b,«˘b⟩⟩}
init ← 0⋈1⌾⊑0¨w
•Show ⊑w⊸Step•_while_{𝕊: ¬¯1‿¯1⊑1⊑𝕩} init

•Out {𝕨∾','∾𝕩}´ •Repr¨ ⊑⟜l ¯1+ 1⊸+•_while_{¯1‿¯1⊑1⊑ (1¨⌾((𝕩↑l)⊸⊑) m⥊0)⊸Step _fx_(≢○(1⊸⊑)) init} y0
