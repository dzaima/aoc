#!/usr/bin/env bqn
⟨Split,_fx_,Input⟩ ← •Import "../../utils/utils.bqn"
l ← 0‿1⊸+¨ •ParseFloat¨¨¨ ','Split¨¨'~'Split¨ •FLines 2023‿22 Input •args

{𝕩!∧´<´𝕩}¨ l

x0‿y0‿z0‿x1‿y1‿z1 ← <˘⍉>∾¨l
deps ← {/((2⊑0⊑𝕩)≥z1) ∧ ((0‿1⊏1⊑𝕩)>x0‿y0)∧○(∧´)(0‿1⊏0⊑𝕩)<x1‿y1}¨ l

bh ← z1-z0
deph ← ⊏⟜bh¨ deps
# •Show deps
# •Show deph

# •Show 'a'+(≠¨/↕∘≠)⊸(⊔˜)⟜∾deps
Step ← {𝕊hs: hs ⌈ {⌈´ (𝕩⊑deph) + ⊏⟜hs 𝕩⊑deps}¨⟜↕⟜≠ hs}
h0 ← Step _fx_≢ 0¨ l

# •Show h0
•Show +´¬(↕≠l)∊∾{m←(𝕩⊑h0) = (𝕩⊑deph) + ⊏⟜h0 𝕩⊑deps ⋄ (1=+´m)/m/𝕩⊑deps}¨⟜↕⟜≠ h0

deph2‿deps2←@‿@
Step2 ← {𝕊hs: hs ⌈ {⌈´ (𝕩⊑deph2) + ⊏⟜hs 𝕩⊑deps2}¨⟜↕⟜≠ hs}
•Show +´{𝕊:
  deph2‿deps2 ↩ (deps≠𝕩)⊸(/¨)¨ deph‿deps
  +´ h0 ≠ Step2 _fx_≢ 0¨ l
}¨ ↕≠l