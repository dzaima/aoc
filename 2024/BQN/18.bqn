#!/usr/bin/env bqn
⟨Ints, _fx_, _underSelect_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← <˘⍉> Ints¨ •FLines 2024‿18 Input •args
n0 ← 1024 # 12 for the example input
zero ← (1+⌈´¨l) ⥊ 0
start ← 1⌾⊑ zero

Step ← {w𝕊b: (¬w)∧∨´⟨b,»b,«b,»˘b,«˘b⟩}
Init ← {1¨_underSelect_(𝕩↑¨l) zero}


w0 ← Init n0
•Show ⊑{a‿b: ⟨a+1, w0 Step b⟩}•_while_{𝕊: ¬¯1‿¯1⊑1⊑𝕩} 0‿start

•Show {𝕨∾','∾𝕩}´ •Repr¨ l⊑˜¨ ⊑ {m←⌊2÷˜+´𝕩 ⋄ m⌾((¬¯1‿¯1⊑(Init m)⊸Step _fx_ (≢∧·¬¯1‿¯1⊑⊣) start)⊸⊑) 𝕩}•_while_{¯1>-´𝕩} n0⋈≠⊑l
