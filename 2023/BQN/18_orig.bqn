#!/usr/bin/env bqn
⟨Split,_fx_⟩ ← •Import "../../utils/utils.bqn"
l ← ' 'Split¨•FLines ≠◶"18.in"‿⊑ •args
d ← ⊑∘⊑¨l
j ← (•ParseFloat 1⊑⊢)¨ l

d ↩ j/d
w ← {1¨⌾((<˘𝕩)⊸⊑) 0⥊˜1+⌈˝𝕩} c ← {𝕩-⎉1⌊˝𝕩} +`("URDL"⊐d)⊏[¯1‿0, 0‿1, 1‿0, 0‿¯1]

pos ← (¯1+(⊑/"DL"⍷d)⊏c) # added after finishing to become general; I just tried random positions until it worked

m ← w∨{(¬w)∧∨´⟨𝕩,»𝕩,«𝕩,»˘𝕩,«˘𝕩⟩}_fx_≢ 1⌾(pos⊸⊑) 0¨w
# •Show ⊏⟜"·#" m
•Show +´⥊m

q←0
x‿y ← <˘⍉>+`{
  a ← ¯1↓2↓𝕩
  d ← ('0'-˜¯1⊑a)⊏[0‿1, 1‿0, 0‿¯1, ¯1‿0]
  l←+´(⌽16⋆↕5)×{𝕩+(𝕩≥10)×10+'0'-'a'} (¯1↓a)-'0'
  q+↩|l
  d × l
}¨ 2⊑¨l

•Show 1+2÷˜q+|+´(x×¯1⌽y)-y×¯1⌽x