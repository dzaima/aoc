#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, Tr, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Num¨¨' 'Split¨•FLines 2024‿1 Input •args

•Show +´|-´∧¨ <˘ ⍉>l

a‿b←<˘⍉>l
•Show +´a×a Count b