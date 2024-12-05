#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, Tr, Input⟩ ← •Import "../../utils/utils.bqn"
a‿b ← Ints¨¨⟨⟩SplitF•FLines 2024‿5 Input •args
pn←1+⌈´∾a
m← pn↑⊔´<˘⍉>a
ok←{
  ¬∨´(𝕩) {∨´𝕩∊𝕨⊑m}¨ ¯1↓↑𝕩
}¨ b
•Show +´{𝕩⊑˜⌊2÷˜≠𝕩}¨ ok/b
•Show +´{𝕩⊑˜⌊2÷˜≠𝕩}¨ {
  𝕩⊏˜⍋⍉(𝕩⊏m) ⊑∘∊˜⌜ 𝕩
}¨ (¬ok)/b