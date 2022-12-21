#!/usr/bin/env cbqn
⟨Num, Split⟩ ← •Import "utils.bqn"
l ← ' 'Split¨ •FLines ≠◶"21.in"‿⊑ •args

n ← ¯1↓¨⊑¨ l
v ← {⟨a⟩: Num a; a‿b‿c: ⟨a,c,⊑⟜+‿-‿×‿÷⊑"+-*/"⊐b⟩}¨ 1↓¨l

v n⊸⊐⌾(∾¯1↓¨(3=≠¨v)⊸/) ↩

Get ← {
  a‿b‿c: (∨´3=•Type¨got)◶⟨C, {𝕎C𝕏}⟩´ got ← Get¨ a‿b;
  𝕩
} {𝕩⊑v}

root ← ⊑n⊐<"root"
•Show Get root

v ⊢˙⌾((⊑n⊐<"humn")⊸⊑)↩
const‿f ← (⍋•Type¨)⊸⊏ Get¨ 2↑root⊑v
•Show F⁼ const
