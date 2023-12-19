#!/usr/bin/env bqn
⟨SplitF,Split⟩ ← •Import "../../utils/utils.bqn"
workflows‿ratings ← ⟨⟩SplitF •FLines ≠◶"19.in"‿⊑ •args

rk‿rv ← <˘⍉>{
  name‿rest←'{' Split 𝕩
  name ⋈ {
    cond‿next ← ':' Split 𝕩
    gt ← ⊑'>'∊cond
    l‿r ← (gt⊑"<>") Split cond
    ⟨⊑"xmas"⊐l, gt, •ParseFloat r, {"R": 0; "A": 1; 𝕩} next⟩ # alt: (⊑"R"‿"A"⊐<next)⊑0‿1‿next
  }¨ "x<4001:"⊸∾⌾(¯1⊸⊑) ','Split ¯1↓rest
}¨ workflows



m1 ← rk •HashMap {i‿gt‿const‿next: ⟨(i)⊸⊑ (gt⊑<‿>){𝔽} const{𝔽}, next⟩}¨¨ rv
in ← m1.Get "in"
Get ← {c‿r←⊑l←𝕨 ⋄ a←𝕩 ⋄ {¬C a? (1↓l) Get a; 0==r? r; (m1.Get r) Get a}}
•Show +´ {+´in⊸Get⊸× •ParseFloat¨ 2↓¨','Split ¯1↓1↓𝕩}¨ ratings



m2 ← rk •HashMap rv
# done ← •HashMap˜⟨⟩ # caching isn't beneficial
all ← ⟨1‿1‿1‿1, 4001‿4001‿4001‿4001⟩
Do ← {
  # done.Has 𝕩? done.Get 𝕩;
  And  ← {𝕨𝕊i‿gt‿c‿·: {gt? 𝕩⌈1+c; 𝕩⌊c}⌾(i⊑(¬gt)⊑⊢) 𝕨}
  AndN ← {𝕨𝕊i‿gt‿c‿·: {gt? 𝕩⌊1+c; 𝕩⌈c}⌾(i⊑  gt ⊑⊢) 𝕨}
  res ← ∾{¯1↓↑𝕩}⊸({0≡3⊑𝕩? ⟨⟩; 1≡3⊑𝕩? ⟨(all And 𝕩) AndN˜´⌽ 𝕨⟩; (⊢ AndN˜´⟜⌽ 𝕨˙)¨ And⟜𝕩¨ Do 3⊑𝕩}¨) m2.Get 𝕩
  # 𝕩 done.Set res
  res
}

•Show +´{×´-´⌽𝕩}¨ Do "in"