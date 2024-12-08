#!/usr/bin/env bqn
⟨MDSlash, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿8 Input •args

n ← ≠l
fs ← (⊐ '.'⊸≠⊸/ ⥊l) ⊔ MDSlash l≠'.'
pairs ← ∾¨ <˘⍉> {
  { x‿y:
    ns←×˜ n←≠x
    (ns ⥊ ¬1↑˜n+1)⊸/¨ (n/¨x‿y) ∾ ns⥊¨x‿y
  } <˘⍉>𝕩
}¨ fs

x0‿y0‿x1‿y1 ← pairs
dx ← x0-x1
dy ← y0-y1

Count ← {≠⍷ (∧˝˘ ≥⟜0 ∧ <⟜n)⊸/ 𝕩}

•Show Count ⍉>⟨x0+dx, y0+dy⟩

•Show Count ∾{⍉>⟨x0+𝕩×dx, y0+𝕩×dy⟩}¨ ↕n