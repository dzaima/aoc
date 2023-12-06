#!/usr/bin/env cbqn
⟨RB, B10, Num, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "utils.bqn"
l ← •FLines ≠◶"2.in"‿⊑ •args

n←"red"‿"green"‿"blue"
m←12‿13‿14
•Show +´1+/{
  v←{n‿s←' 'Split𝕩⋄⟨•ParseFloat n,s⟩}¨¨ ','Split¨1↓¨';'Split 1⊑':'Split𝕩
  ∧´{∧´m≥(⊑¨𝕩)⌾((n⊐1⊑¨𝕩)⊸⊏) 3⥊0}¨ v
}¨l

•Show +´{
  v←{n‿s←' 'Split𝕩⋄⟨•ParseFloat n,s⟩}¨¨ ','Split¨1↓¨';'Split 1⊑':'Split𝕩
  ×´⌈´{(⊑¨𝕩)⌾((n⊐1⊑¨𝕩)⊸⊏) 3⥊0}¨ v
}¨l