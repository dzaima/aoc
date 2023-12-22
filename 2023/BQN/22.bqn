#!/usr/bin/env bqn
⟨Split⟩ ← •Import "../../utils/utils.bqn"
l ← {0‿1 + {•ParseFloat¨ ',' Split 𝕩}¨ '~' Split 𝕩}¨ •FLines ≠◶"22.in"‿⊑ •args

{𝕩!∧´<´𝕩}¨ l

x0‿y0‿z0‿x1‿y1‿z1 ← <˘⍉> ∾¨ l

di ← {/((2⊑0⊑𝕩)≥z1) ∧ ((0‿1⊏1⊑𝕩)>x0‿y0)∧○(∧´)(0‿1⊏0⊑𝕩)<x1‿y1}¨ l # which bricks the n'th bridge can depend on
dh ← ⊏⟜(z1-z0)¨ di # the height of the specific dependency
dj ← (≠di) ↑ (∾ ⊔ (≠¨ / ↕∘≠)) di # which bricks depend on the n'th bridge

Min ← { di‿dh‿dj 𝕊 upd‿zC:
  1 ⊑ { 𝕨 𝕊 zC:
    r ← 𝕨⊸({1⌈´ (𝕨⊑dh) + ⊏⟜zC 𝕨⊑di}¨)⌾(𝕨⊸⊏) 𝕩
    ⟨∾(r≠𝕩)/dj, r⟩
  }´•_while_{×≠⊑𝕩} upd‿zC
}
z2 ← di‿dh‿dj Min ⟨↕≠di, (⌈´z1)¨ di⟩
•Show (≠l) - +´∊ ∾ (↕≠z2) {(1=≠)⊸/ ((𝕨⊑z2) = (𝕨⊑dh) + 𝕩⊏z2)/𝕩}¨ di # for each brick, filter its dependencies to those that are directly below it, and report if there's only one such

•Show +´ { # for each brick, remove that brick & minimize
  keep ← di≠𝕩
  +´ z2 ≠ ⟨keep/¨di, keep/¨dh, dj⟩ Min ⟨𝕩⊑dj, z2⟩
}¨ ↕≠l