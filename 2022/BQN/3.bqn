#!/usr/bin/env bqn
l ← {m←𝕩≥'a' ⋄ 1+(26×¬m)+𝕩-m⊏"Aa"}¨ •FLines ≠◶"3.in"‿⊑ •args

•Show +´ {⋈⁼⍷(∊/⊣)´𝕩}¨ {<˘2‿∘⥊𝕩}¨ l
•Show +´ {⋈⁼⍷(∊/⊣)´𝕩}¨  <˘∘‿3⥊    l