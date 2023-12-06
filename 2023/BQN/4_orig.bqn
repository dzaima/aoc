#!/usr/bin/env cbqn
⟨RB, B10, Num, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "utils.bqn"
l ← {•ParseFloat¨¨ ' 'Split¨ '|'Split 1⊑':'Split𝕩}¨•FLines ≠◶"4.in"‿⊑ •args

•Show +´(0.5⊸≠⊸×) 2⋆¯1++´¨∊˜´¨l
cs←1¨l
(↕≠l) {
  p ← +´∊˜´𝕩
  
  cs (𝕨⊑cs)⊸+⌾(((p)⌊(¯1+≠cs)-𝕨)↑(1+𝕨)↓⊢)↩
}¨ l

•Show +´cs