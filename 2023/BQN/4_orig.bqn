#!/usr/bin/env bqn
⟨Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← {•ParseFloat¨¨ ' 'Split¨ '|'Split 1⊑':'Split𝕩}¨•FLines 2023‿4 Input •args

•Show +´(0.5⊸≠⊸×) 2⋆¯1++´¨∊˜´¨l
cs←1¨l
(↕≠l) {
  p ← +´∊˜´𝕩
  
  cs (𝕨⊑cs)⊸+⌾(((p)⌊(¯1+≠cs)-𝕨)↑(1+𝕨)↓⊢)↩
}¨ l

•Show +´cs