#!/usr/bin/env bqn
⟨Num, Input, Split, Count⟩ ← •Import "../../utils/utils.bqn"
a‿b ← <˘⍉ Num¨ > ' 'Split¨ •FLines 2024‿1 Input •args

•Show +´ |-´ ∧¨ a‿b
•Show +´ a× a Count b