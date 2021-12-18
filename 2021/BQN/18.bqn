#!/usr/bin/env cbqn
l ← •FLines ≠◶"18.in"‿⊑ •args

P ← {
  m ← (≥⟜'0'∧≤⟜'9')𝕩
  d ← +`(𝕩='[')-𝕩=']'
  ⟨'0'-˜m/𝕩 ⋄ m/d⟩
}
l P¨↩

NHP ← {𝕨‿𝕩} # non-horrible pair

Mag ← ⊑∘⊑ {c𝕊v‿d:
  cd ← d=c
  l ← ≠`cd
  r ← »l
  nv ← ((3×l/v)+2×r/v)⌾(l⊸/) v
  nd ← (c-1)¨⌾(l⊸/) d
  (¬r)⊸/¨ nv‿nd
}´⟜(1+↕4)

Expl ← {𝕊v‿d:
  ml ← d=5
  ×+´ml?
    ml>↩ »∨`ml
    mr ← »ml
    v+↩ «ml×v
    v+↩ »mr×v
    v×↩ ¬ml
    (¬mr)⊸/¨ v NHP d-ml
  ;𝕩
}

Spl ← {𝕊v‿d:
  m ← v>9
  ×+´m?
    m>↩ »∨`m
    i ← ⊑/m
    nv ← ∾⟨i↑v ⋄ (⌊NHP⌈)2÷˜i⊑v ⋄ (1+i)↓v⟩
    nd ← (m+1)/d+m
    nv‿nd
  ;𝕩
}

Step ← {Spl⍟(𝕩⊸≡) Expl 𝕩}
Simplify ← {⊑{p‿c:c NHP Step c}•_while_(≢´) 𝕩 NHP Step𝕩}

Add ← {Simplify 1⊸+⌾(1⊸⊑) 𝕨∾¨𝕩}

•Show Mag Add˜´⌽ l
•Show ⌈´⥊ Mag∘Add⌜˜ l