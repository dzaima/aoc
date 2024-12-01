#!/usr/bin/env bqn
⟨Ints, Input, Split, Count⟩ ← •Import "../../utils/utils.bqn"
a‿b ← <˘⍉> Ints¨ •FLines 2024‿1 Input •args

•Show +´ |-´ ∧¨ a‿b
•Show +´ a× a Count b
