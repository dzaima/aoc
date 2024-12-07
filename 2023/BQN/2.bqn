#!/usr/bin/env bqn
⟨Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2023‿2 Input •args

cols ← "red"‿"green"‿"blue"
l {
  {
    [n,s] ← ⍉>{•ParseFloat⌾⊑ ' 'Split𝕩}¨ ','Split 1↓𝕩
    n⌾((cols⊐s)⊸⊏) 3⥊0
  }¨ ';'Split 1⊑':'Split 𝕩
}¨ ↩

•Show +´1+/ {∧´ {∧´12‿13‿14≥𝕩}¨ 𝕩}¨ l

•Show +´ {×´ ⌈´ 𝕩}¨ l