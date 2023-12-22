#!/usr/bin/env bqn
⟨Split,_fx_⟩ ← •Import "../../utils/utils.bqn"
l ← {0‿1 + {•ParseFloat¨ ',' Split 𝕩}¨ '~' Split 𝕩}¨ •FLines ≠◶"22.in"‿⊑ •args

{𝕩!∧´<´𝕩}¨ l

x0‿y0‿z0‿x1‿y1‿z1 ← <˘⍉> ∾¨ l

di ← {/((2⊑0⊑𝕩)≥z1) ∧ ((0‿1⊏1⊑𝕩)>x0‿y0)∧○(∧´)(0‿1⊏0⊑𝕩)<x1‿y1}¨ l # which bricks the n'th bridge can depend on
dh ← ⊏⟜(z1-z0)¨ di # the height of the specific dependency

Min ← {di‿dh 𝕊 zC: zC ⌊ dh {1⌈´ 𝕨 + 𝕩⊏zC}¨ di}            #             decrease heights to those demanded by dependencies
z2  ← {      𝕊 zC: zC ⌈ dh {1⌈´ 𝕨 + 𝕩⊏zC}¨ di} _fx_≢ 1¨ l # iteratively increase heights to those demanded by dependencies
•Show (≠l) - +´∊ ∾ (↕≠z2) {(1=≠)⊸/ ((𝕨⊑z2) = (𝕨⊑dh) + 𝕩⊏z2)/𝕩}¨ di # for each brick, filter its dependencies to those that are directly below it, and report if there's only one such


•Show +´ {+´ z2 ≠ ((di≠𝕩)⊸(/¨)¨ di‿dh)⊸Min _fx_≢ z2}¨ ↕≠l # remove each brick, see whose z changes