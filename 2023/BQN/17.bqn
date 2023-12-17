#!/usr/bin/env bqn
l ← '0'-˜>•FLines ≠◶"17.in"‿⊑ •args
n ← ≠l

{ 𝕊 jmin‿jmax:
  jmask ← jmin≤↕jmax
  ls ← ⟨0,0⟩
  is ← 0‿1 ⋄ isC←2
  ns ← is •HashMap ⟨0‿0‿0,3‿0‿0⟩
  todo ← (4∾≢l)⥊1
  
  deltas ← ⟨¯1‿0, 0‿1, 1‿0, 0‿¯1⟩
  res ← ∞
  Step ← { 𝕊:
    min ← ⊑⌊´⊸(⊐˜)ls
    k ← dir‿y‿x ← ns.Get mk←min⊑is
    len ← min⊑ls
    ls ↩ (min↑ls)∾(min+1)↓ls
    is ↩ (min↑is)∾(min+1)↓is
    ns.Delete mk
    k⊑todo?
    {𝕊: res⌊↩len}⍟⊢ y‿x≡¯1+≢l
    todo 0⌾(dir‿y‿x⊸⊑)↩
    {
      p ← (y‿x+(𝕩⊑deltas)×⊢)¨ 1+↕jmax⌊𝕩⊑⟨y,n-x+1,n-y+1,x⟩
      p≢⟨⟩?
      k2 ← 𝕩∾¨p
      m ← (k2⊑todo) ∧ (≠p)↑jmask
      vs ← m/k2
      ls∾↩ ×∘≠◶⟨↕0,•internal.Squeeze⟩ len + m/+`p⊑l
      ks ← isC+↕≠vs
      is∾↩ ks
      ks ns.Set¨ vs
      isC+↩ ≠vs
      
      ;⟨⟩
    }¨ 4|dir+1‿3
    ;@
  }

  Step•_while_{𝕊: 0≠≠ls} @
  •Show res
}¨ ⟨0‿3, 3‿10⟩
