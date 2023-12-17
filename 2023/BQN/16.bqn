#!/usr/bin/env bqn
⟨_fx_, Tr⟩ ← •Import "../../utils/utils.bqn"
l ← >•FLines ≠◶"16.in"‿⊑ •args
# direction lists: up, right, down, left

rots ← ⟨⊢, ⌽⍉, ⌽⌽˘, ⍉⌽⟩
n ← ≠l
ym‿xm ← Tr ↕≢l
iota ← ↕n

info ← >(↕4) { dir 𝕊 𝕩:
  c ← ⊏⟜"/\-|." ("/\-|"‿"\/|-"⊑˜2|dir) ⊐ 𝕏l # unrotate to going upwards, aka negative y, aka towards ¯∞‿0
  e ← c ∊ "/\-"
  dist ← (⊢-·⌈`e×⊢)↕≠e
  ib ← ∨`e # in-bounds
  end ← ↕∘≠⊸- dist
  tgt ← (iota +⎉1 end×n) ⊏ ⥊c
  𝕏⁼ Tr ⟨dist, (xm≠0)∧ib∧tgt∊"-\", (xm≠n-1)∧ib∧tgt∊"-/"⟩
}¨ rots


memo ← •HashMap˜⟨⟩
deltas ← ⟨¯1‿0, 0‿1, 1‿0, 0‿¯1⟩
Get ← {
  dir‿y0‿x0:
    𝕩 memo.Set 0
    dist‿l‿r ← 𝕩⊑info
    y1‿x1 ← y0‿x0 + dist×dir⊑deltas
    me ← {
      2|dir? x0s‿x1s←∧x0‿x1 ⋄ (iota=y0) ∧⌜  (iota≥x0s) ∧ iota≤x1s;
             y0s‿y1s←∧y0‿y1 ⋄ (iota=x0) ∧⌜˜ (iota≥y0s) ∧ iota≤y1s
    }
    res ← me ∨´ (4|dir+3‿1) {
      ¬𝕩? 0;
      Get 𝕨 ∾ y1‿x1 + 𝕨⊑deltas
    }¨ l‿r
    𝕩 memo.Set res
    res
} {memo.Has 𝕩? memo.Get 𝕩; 𝔽 𝕩}

Count ← {
  memo ↩ •HashMap˜⟨⟩
  +´⥊Get 𝕩
}

•Show Count ⟨1,0,0⟩

•Show ⌈´ ∾⟨
  {Count ⟨0, n-1, 𝕩⟩}¨ iota # up
  {Count ⟨1, 𝕩,   0⟩}¨ iota # right
  {Count ⟨2, 0,   𝕩⟩}¨ iota # down
  {Count ⟨3, 𝕩, n-1⟩}¨ iota # right
⟩
