#!/usr/bin/env bqn
l ← '0'-˜>•FLines ≠◶"17.in"‿⊑ •args
n ← ≠l

{ 𝕊 jmin‿jmax:
  jmask ← jmin≤↕jmax
  ls ← ⟨0,0⟩
  ns ← ⟨0‿0‿0‿@,3‿0‿0‿@⟩
  todo ← (4∾≢l)⥊1
  path ← (4∾≢l)⥊@

  deltas ← ⟨¯1‿0, 0‿1, 1‿0, 0‿¯1⟩
  res ← ∞
  Step ← { 𝕊:
    min ← ⊑⌊´⊸(⊐˜)ls
    k ← 3↑dir‿y‿x‿k0 ← min⊑ns
    len ← min⊑ls
    ls ↩ (min↑ls)∾(min+1)↓ls
    ns ↩ (min↑ns)∾(min+1)↓ns
    k⊑todo?
    {𝕊: res⌊↩len}⍟⊢ y‿x≡¯1+≢l
    todo 0⌾(dir‿y‿x⊸⊑)↩
    # path k0⌾(k⊸⊑)⍟(k≢@)↩
    {
      # p ← ((0≤⌊´¨)∧n>⌈´¨)⊸/ (y‿x+(𝕩⊑deltas)×⊢)¨ 1+↕3
      # p ← (y‿x+(𝕩⊑deltas)×⊢)¨ 1+↕3⌊𝕩⊑⟨y,n-x+1,n-y+1,x⟩
      p ← (y‿x+(𝕩⊑deltas)×⊢)¨ 1+↕jmax⌊𝕩⊑⟨y,n-x+1,n-y+1,x⟩
      # p!∧´ ((0≤⌊´¨)∧n>⌈´¨)p
      p≢⟨⟩?
      k2 ← 𝕩∾¨p
      m ← (k2⊑todo) ∧ (≠p)↑jmask
      # ls∾↩ len + m/+`p⊑l
      ls∾↩ ×∘≠◶⟨↕0,•internal.Squeeze⟩ len + m/+`p⊑l
      ns∾↩ (m/k2)∾¨<<k
      ;⟨⟩
    }¨ 4|dir+1‿3
    ;@
  }

  Step•_while_{𝕊: 0≠≠ls} @
  •Show res
}¨ ⟨0‿3, 3‿10⟩
# •Show¨ <˘path
# Step⍟10000 @
# •Show ls
# •Show ≠ns

# pu ← {{𝕩∾<(¯1⊑𝕩)⊑path}•_while_{@≢¯1⊑𝕩} ⋈𝕩∾¯1+≢l}¨ 1‿2
# •Show¨ {'#'¨⌾((¯1↓1↓¨𝕩)⊸⊑) '·'¨l}¨pu

