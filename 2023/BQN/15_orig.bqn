#!/usr/bin/env bqn
⟨Split⟩ ← •Import "../../utils/utils.bqn"
l ← ','Split•FChars ≠◶"15.in"‿⊑ •args

H←{0{256|17×𝕩+𝕨}´⌽𝕩-@}
•Show +´{0{256|17×𝕩+𝕨}´⌽𝕩-@}¨ l
i←{⊑'='∊𝕩? '='Split 𝕩; ⟨¯1↓𝕩,@⟩}¨ l
•Show +´∾(1+↕∘≠)⊸× {(1+↕∘≠)⊸×•ParseFloat¨ 1⊑¨𝕩}¨ (256⥊<⟨⟩) {𝕨𝕊a‿@: ((a≢⊑)¨⊸/)⌾((H a)⊸⊑) 𝕨; 𝕨𝕊a‿b: 𝕩⊸{m←(a≡⊑)¨𝕩⋄𝕨{∨´m? 𝕨¨⌾(m⊸/)𝕩; 𝕩∾<𝕨}𝕩}⌾((H a)⊸⊑) 𝕨}˜´⌽ i