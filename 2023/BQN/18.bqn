#!/usr/bin/env bqn
⟨Split,_fx_,Input⟩ ← •Import "../../utils/utils.bqn"
l ← ' 'Split¨•FLines 2023‿18 Input •args

Calc ← {
  x‿y ← <˘⍉ +`𝕨×𝕩
  1+2÷˜ (+´𝕨) + |+´ (x×1⌽y) - y×1⌽x
}

•Show {
  ds ← ("URDL" ⊐ ⊑∘⊑¨l) ⊏ [¯1‿0, 0‿1, 1‿0, 0‿¯1]
  ls ← (•ParseFloat 1⊑⊢)¨ l
  ls Calc ds
}

•Show {
  ds ← ('0'-˜¯2⊏˘𝕩)⊏[0‿1, 1‿0, 0‿¯1, ¯1‿0]
  ls ← +˝˘ (⌽16⋆↕5) ×⎉1 {𝕩-(𝕩≥'a')⊏⟨'0','a'-10⟩} ¯2↓˘2↓˘𝕩
  ls Calc ds
} >2⊑¨l