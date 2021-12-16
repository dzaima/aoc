#!/usr/bin/env cbqn
⟨RB⟩ ← •Import "utils.bqn"
l ← ⊑•FLines ≠◶"16.in"‿⊑ •args

St ← {𝕊s:
  i ⇐ 0
  B ⇐ {𝕊: i+↩1 ⋄ (i-1)⊑s}
  N ⇐ {𝕊: RB B¨↕𝕩}
}

s ← St ∾(l⊐˜('0'+↕10)∾('A'+↕6))⊏⥊↕4⥊2

vsum ← 0
Packet ← {𝕊p:
  v ← p.N 3
  t ← p.N 3
  vsum+↩ v
  {
    t=4?
      num←0
      {𝕊: n←p.B@ ⋄ num ↩ (num×16) + p.N 4 ⋄ n}•_while_⊢1
      num
    ;
    lty ← p.B@
    rs ← {
      lty=0?
        end ← p.i + p.N 15
        ps ← ⟨⟩
        {𝕊:ps∾↩<Packet p}•_while_{𝕊:p.i<end} @;
      lty=1?
        {𝕊:Packet p}¨ ↕p.N 11
    }
    t◶+‿×‿⌊‿⌈‿!‿>‿<‿=´ rs
  }
}

res ← Packet s
•Show vsum
•Show res