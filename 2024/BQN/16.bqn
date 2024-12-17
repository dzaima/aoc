#!/usr/bin/env bqn
⟨MDSlash, _fx_, Input⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines 2024‿16 Input •args
nw ← l ≠ '#'
vs ← l = 'S'
ve ← l = 'E'

start ← - 1000 × ×˜≠l # we want "infinity" to be zero (for »/«, and also to keep things in i32 range), so we make the start far into the negatives

Mv  ← ⟨»,»˘,«,«˘⟩{𝕎𝕩}¨⊢
MvI ← ⟨«,«˘,»,»˘⟩{𝕎𝕩}¨⊢

dists ← {
  nw⊸×¨ ⌊´⟨
    Mv 𝕩+1,
    {⌊´ ⟨1⌽𝕩, ¯1⌽𝕩⟩} 𝕩+1000,
    𝕩
  ⟩
}_fx_≢ (⊏⟜0‿start vs)⌾(1⊸⊑) 4⥊< 0¨vs

best ← (⋈⁼ MDSlash ve) ⊑ ⌊´dists

•Show best-start

mv1 ← nw⊸∧¨ dists = MvI dists-1
r1  ← nw⊸∧¨ dists =  1 ⌽ dists-1000
r3  ← nw⊸∧¨ dists = ¯1 ⌽ dists-1000
•Show +´⥊∨´ {
  ∨´⟨
    mv1 ∧ MvI 𝕩,
    r1  ∧  1⌽𝕩,
    r3  ∧ ¯1⌽𝕩,
    𝕩
  ⟩
}_fx_≢ (<ve) ∧ dists=best

