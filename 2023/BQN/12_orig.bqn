#!/usr/bin/env cbqn
⟨RB, B10, Num, SInts, Ints, Split, SplitF, ReIndex, MDSlash, Unjoin, Count, GCD, LCM, _fx_, _fi_, T⟩ ← •Import "utils.bqn"
l ← •FLines ≠◶"12.in"‿⊑ •args

•Show +´ {
 l‿n ← ' 'Split𝕩
 i ← ¯1+Ints n
 +´{i ≡ (/𝕩>»𝕩)-˜/𝕩>«𝕩}¨ (l='#')⊸+¨ ⥊↕1+l='?'
}¨ l

•Show +´ {
  l‿n ← ' 'Split𝕩
  i ← Ints n
  l ↩ ¯1↓∾5⥊<l∾'?'
  i ↩ ∾5⥊<i
  +´⊑¨ {(≠i)=2⊑𝕩}¨⊸/ ⟨1‿0‿0⟩ { # count,streak,offset
    g ← ⊑𝕩∊"?#"
    e ← ⊑𝕩∊"?."
    r1 ← ∾{n‿s‿o: ⟨⟨n,s+1,o⟩⟩}¨ g/𝕨
    r2 ← ∾(0≠1⊑⊢)◶⋈‿{n‿s‿o: o≠≠i? s=o⊑i? ⟨⟨n,0,o+1⟩⟩; ⟨⟩}¨ e/𝕨
    r ← r1∾r2
    r ↩ ((⌈´i)≥1⊑¨r)/r
    {(+´⊑¨𝕩)∾1↓⊑𝕩}¨ (⊐1↓¨r) ⊔ r
  }˜´⌽ l∾'.'
}¨ l
