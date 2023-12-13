#!/usr/bin/env bqn
⟨MDSlash⟩ ← •Import "../../utils/utils.bqn"
l ← '.'∾˜˘>•FLines ≠◶"3.in"‿⊑ •args # adds a column of '.' so that there's always a '.' between adjacent numbers in deshape
nadj ← ∨´¬∊⟜('.'∾'0'+↕10)¨ ∾'.'(⊢<⊸∾»˘⋈«˘)¨ l<⊸∾ '.'¨∘⊏⊸(»⋈«)l
D←≥⟜'0'∧≤⟜'9'
ml0 ← D ⥊l
a←ml0⊸((¬-˜⊢×·+`»⊸>)⊸⊔) ⥊l
b←∨´¨ml0⊸((¬-˜⊢×·+`»⊸>)⊸⊔) ⥊nadj
•Show +´•ParseFloat¨b/a

ni ← ((1+`⊢)⌾⥊¬)⊸× D l # unique identifier for each number
adn ← {0⊸≠⊸/⍷⥊(𝕩<⊸+¯1+↕3‿3)⊑ni}¨ MDSlash l='*'

•Show +´{×´{•ParseFloat l/˜○⥊𝕩=ni}¨𝕩}¨ adn/˜2≤≠¨adn