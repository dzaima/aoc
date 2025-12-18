#!/usr/bin/env bqn
⟨Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← ' 'Split¨ •FLines 2015‿7 Input •args

Dig ← '0'⊸≤∧≤⟜'9'
h‿m ← 2⋆15‿16
I16 ← ⊢ - m×≥⟜h # convert unsigned 16-bit to signed 16-bit

rs ← ¯1⊑¨l # wire names
es ← ¯2↓¨l # expressions
ns ← ≠¨es # expression part count

P2 ← ⊑⟜(2⋆↕16) # 2⋆𝕩, limited to 𝕩≤15
opn‿opf ← <˘⍉>⟨
  ⟨"AND",    16•bit._and⌾⋈⟩
  ⟨"OR",     16•bit._or⌾⋈⟩
  ⟨"LSHIFT", I16 m|×⟜P2⟩
  ⟨"RSHIFT", {⌊ (m|𝕨) ÷ P2 𝕩}⍟(×⊢)⟩
  ⟨"NOT",    16•bit._not⌾⋈∘⊢⟩
  ⟨@, ⊢⟩ # identity operation
⟩

# encode operands as:
#   ≥0: constant
#   <0: index in expressions (actual index, i.e. from end)
NIdx ← -⟜(≠rs)
Oper ← {
  const ← Dig ⊑¨ 𝕩
  cs ← I16 •ParseFloat¨ const/𝕩 # parse out the constants
  ds ← NIdx rs ⊐ const¬⊸/𝕩      # and the non-constants
  (⍋⍋const) ⊏ ds∾cs             # and blend the cases together
}
or ← Oper ¯1⊑¨es  # right operand
ol ← Oper ⊑¨es    # left operand
ol 0¨⌾((3≠ns)⊸/)↩ # make sure to not recompute garbage for unneeded left operands
op ← ⊏⟜opf (¯1↓opn) ⊐ (ns-2) ⊑¨ es # operation of each wire

c ← •HashMap˜⟨⟩
Get ← {
  @≢r←@c.Get 𝕩? r;
  r ← (𝕩⊑op)´ Get⍟(<⟜0)¨ 𝕩⊑¨ol‿or
  𝕩 c.Set r
  r
}

ia‿ib ← rs⊐"a"‿"b"

p1 ← m|Get NIdx ia
•Show p1

c.Delete¨ c.Keys@
or p1⌾(ib⊸⊑)↩
•Show m|Get NIdx ia
