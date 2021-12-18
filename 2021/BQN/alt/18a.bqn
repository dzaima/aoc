#!/usr/bin/env cbqn

# recursion based, with nested arrays everywhere
P ← •BQN {'⟨'¨⌾(('['=𝕩)⊸/) 𝕩}∘{'⟩'¨⌾((']'=𝕩)⊸/) 𝕩}
l ← P¨ •FLines ≠◶"../18.in"‿⊑ •args

ai←∞ ⋄ aa←0

i ← 0
ExplGet ← {
  4𝕊l‿r: aa≡0?
    ai ↩ i+0‿2
    aa ↩ l‿r‿0
    0;
  0=•Type𝕩?
    (𝕨+1) 𝕊¨ 𝕩;
  d𝕊𝕩:
    i+↩ 1
    𝕩
}⟜{i↩0⋄aa↩0⋄𝕩}
ExplSet ← {
  𝕊l‿r:
    𝕊¨ l‿r;
  𝕊𝕩:
    i+↩ 1
    𝕩 + (⊑ai⊐i)⊑aa
}∘{i↩0⋄ai‿aa⋄𝕩}

spld ← 0
Spl ← {
  𝕊l‿r: 𝕊¨ l‿r;
  spld? 𝕩;
  𝕩>9? spld↩1 ⋄ (⌊⋈⌈)𝕩÷2;
  𝕩
}∘{spld↩0⋄𝕩}

Expl ← {
  ExplSet⍟(aa≢0) 0 ExplGet 𝕩
}

Step ← {Spl⍟(𝕩⊸≡) Expl 𝕩}

Simplify ← {⊑{p‿c:c⋈Step c}•_while_(≢´) 𝕩⋈Step𝕩}


Add ← Simplify ⋈


Mag ← {𝕊l‿r: +´3‿2×𝕊¨l‿r; 𝕩}

•Show Mag Add˜´⌽ l
•Show ⌈´ ⥊Mag∘Add⌜˜ l