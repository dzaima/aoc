#!/usr/bin/env bqn
⟨Input, Count⟩ ← •Import "../../utils/utils.bqn"
bs ← •file.MapBytes 2024‿1 Input •args

nw ← 0.5×1+⊑bs⊐@+10
a‿b ← <˘ ⍉∘‿2⥊ 10⊸×⊸+˜´ ⌽ ¯1↓<˘ ⍉0⌈ '0'-˜ ∘‿nw⥊bs

a ↩ •internal.Squeeze a×÷10
a‿b ∧¨↩
•Show +´ |a-b
•Show +´ a× a⊏/⁼b
# better for larger numbers, but slower for the input:
# +´ a× a Count b
