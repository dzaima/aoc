#!/usr/bin/env cbqn
⟨Split, Ints⟩ ← •Import "../../utils/utils.bqn"
[f,s,ns] ← ⍉>{t←' 'Split𝕩 ⋄ ⟨⊑Ints 𝕩, 1⊑t, ','⊸≠⊸/¨9↓t⟩}¨ •FLines ≠◶"16.in"‿⊑ •args

si ← ⋈⁼ /"AA"⊸≡¨ s
n ← s⊸⊐¨ ns
! (∧¨n) ≡ (∾n) ⊔ ∾↕∘≠⊸({𝕨¨𝕩}¨)n

uf ← ¬(si≠↕≠s)∧f=0
cost ← <˘⟨uf,uf⟩/>{
  r ← ∞¨ s
  1 {
    (𝕩⊑r)≤𝕨? @;
    r 𝕨⌾(𝕩⊸⊑)↩
    (𝕨+1) 𝕊¨ 𝕩⊑n
  } 𝕩
  r
}¨ ↕≠s

si2 ← ⋈⁼ /si=uf/↕≠s
f2 ← uf/f
iota ← ↕≠f2

Run ← {
  max ← 0
  Rec ← { c‿l‿r𝕊𝕩:
    nc ← 𝕩-c⊑cost
    ok ← l∧nc≥0
    ∨´ok?
      (ok/nc) {⟨𝕩, l∧iota≠𝕩, r+𝕨×𝕩⊑f2⟩ Rec 𝕨}¨ /ok ⋄ 1
    ;
      max⌈↩ 2⊑𝕨
  }

  ⟨si2, 𝕨, 0⟩ Rec 𝕩
  max
}
•Show (iota≠si2) Run 30

p2 ← {
  𝕩 ↩ •internal.Squeeze (si2↑𝕩)∾1∾si2↓𝕩
  (¬𝕩) Run 26
}¨ ⥊↕1↓2¨iota
•Show ⌈´p2+⌽p2
