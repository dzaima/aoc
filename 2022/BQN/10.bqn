#!/usr/bin/env bqn
⟨SInts⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines ≠◶"10.in"‿⊑ •args
n ← 'n'=⊑¨l

v ← {⟨⟩:0; ⊑𝕩}¨ SInts¨ 5↓¨l
x ← »1+`v

cyc ← 1+`n⊏2‿1

oc ← 20+40×↕⌈40÷˜¯20+¯1⊑cyc
•Show +´ oc × (cyc⍋oc)⊏x

cc ← 1+↕240
•Out˘ ⊏⟜" #" ∘‿40⥊ (40|cc) {(𝕨≥𝕩)∧𝕨<𝕩+3} (cyc⍋cc)⊏x