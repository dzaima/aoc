#!/usr/bin/env bqn
⟨Num⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines ≠◶"7.in"‿⊑ •args

curr ← ⟨⟩
fs ← @⊸≢¨⊸/ {(⊑𝕩){
  "$ cd /"𝕊𝕩: curr ↩ ⟨⟩ ⋄ @;
  "$ cd .."𝕊𝕩: curr ↓˜↩ ¯1 ⋄ @;
  "$ ls"𝕊𝕩: {
    a ← (𝕩⊑∘⊐¨' ') ↑¨ 𝕩
    curr ⋈ +´ Num¨ "dir"⊸≢¨⊸/ a
  }𝕩;
  "$ cd "≡5↑𝕨? curr∾↩ <5↓𝕨 ⋄ @;
  •Exit 1
}1↓𝕩}¨ (¯1+`'$'=⊑¨l)⊔l

dszs ← ⟨⟩
used ← {
  ps ← ⊑¨ 𝕩
  cl ← 0=≠¨ ps
  msz ← +´1⊑¨cl/𝕩
  chsz ← +´ 𝕊∘({1⊸↓⌾⊑¨ 𝕩})¨ (⊐⊑¨(¬cl)/ps) ⊔ (¬cl)/𝕩
  dszs∾↩ msz+chsz
  msz+chsz
} fs

•Show +´≤⟜100000⊸/ dszs

need ← 30000000 - 70000000-used
•Show {(⊑/need≤𝕩)⊑𝕩} ∧dszs