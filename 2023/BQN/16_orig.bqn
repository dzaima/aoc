#!/usr/bin/env bqn
l ← >•FLines ≠◶"16.in"‿⊑ •args

lt ← {⊏⟜".-|\/" ".|-/\"⊐⍉⌽𝕩}⍟(↕4) l
z←0¨l
S←{{∨˝¯1‿0‿1⌽˘⍉>𝕩} lt {⌽⟨⌽⍉«˘𝕩∧𝕨∊"-/", »𝕩∧¬𝕨∊"-/\", ⍉⌽»˘𝕩∧𝕨∊"-\"⟩}¨𝕩}
# F←{+´⥊×+´{⌽∘⍉⍟𝕩𝕨}¨⟜↕⟜≠ ×+´ S⍟(↕1000) 𝕩} # thing that originally got me the solution
F←{ # thing I was in the middle of writing while waiting for the above to finish; finished outside of the initial solve
  +´⥊∨´ {⌽∘⍉⍟𝕩𝕨}¨⟜↕⟜≠ 1⊑{a‿m‿b: t←S⍟(↕10) b ⋄ m2←m∨´t ⋄ ⟨m≢m2,m2,¯1⊑t⟩}•_while_⊑ ⟨1,4⥊<z,𝕩⟩
}
•Show F ⟨z,⍉⌽1⌾⊑z,⍉⌽⍉⌽z,⍉⌽⍉⌽⍉⌽z⟩
•Show ⌈´⥊ (↕4) {F 1⌾(0‿𝕩⊑𝕨⊑⊢) 4⥊<z}⌜ ↕≠l
# •Show ⌈´ (↕4) {•Show F 1⌾(0‿𝕩⊑𝕨⊑⊢) 4⥊<z}⌜ ↕≠l # is what I originally had, and manually copied out the results & ⌈-ed the stdout after the ⌈´ errored :|