#!/usr/bin/env bqn
⟨SInts, _underSelect_, Input⟩ ← •Import "../../utils/utils.bqn"
ps‿vs ← {<˘⍉>𝕩}¨ <˘⍉> {<˘2‿2⥊𝕩}¨ SInts¨ •FLines 2024‿14 Input •args

sz ← 101‿103 # {(≠l)<15? 11‿7; 101‿103}
•Show {k←×𝕩 - 2÷˜sz-1 ⋄ ×´/⁼+´1‿2×1= (∧´|k)⊸/¨ k} sz | ps + vs×100

empty ← sz ⥊ 0
•Show 1⊑{ 𝕊 c‿i:
  m ← 1¨_underSelect_ c empty
  ∨´⥊ ∧⟜»⍟10 m?
    # •Show m⊏"·#"
    @‿i
  ; 𝕊 c‿i:
    ⟨sz|c+vs, 1+i⟩
}•_while_ (@≢⊑) ps‿0
