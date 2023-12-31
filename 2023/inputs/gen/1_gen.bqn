#!/usr/bin/env bqn
"1_ones.in" •FLines "1"⊸+¨ 100 (•MakeRand 1).Range 9
"1_twos.in" •FLines <˘ '1' + 100‿2 (•MakeRand 2).Range 9

# {•Show ⟨(+´÷≠)𝕩, ⌈´𝕩, +´𝕩⟩ ⋄ 60↑⎉1 ↕∘≠⊸{(𝕩≠0) /⎉1 𝕨≍𝕩} ⌊100×(⊢÷⌈´) /⁼ 𝕩} lengths

MkRand ← { seed 𝕊 target:
  Range ← (•MakeRand seed).Range
  baseset ← ∾1‿3 / "1a" +⟜↕¨ 9‿26
  namesBelow ← "one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"⊸{(𝕩≥≠¨𝕨)/𝕨}¨ ↕6
  MkLine ← { 𝕊 l:
    a ← (l Range ≠)⊸⊏ baseset # base text
    
    { # sprinkle in names
      a 𝕩⌾(((↕≠𝕩) + Range 1+a -○≠ 𝕩)⊸⊏)↩
      @
    }¨ ({l≥3? Range ⌈l÷2.9; 0}Range≠)⊸⊏ (5⌊l)⊑namesBelow
    
    {𝕊: # have at least one digit
      a ('1'+Range 9)⌾((Range ≠a)⊸⊑)↩
    }⍟¬ ∨´ (a≥'1') ∧ (a≤'9')
    a
  }
  LnLengths ← {𝕊 n: 1+ 1000 ⌊ 1 ⌈ (+˝2‿n Range 20) + ⌊÷1-×˜ n Range 0}
  
  l ← ⟨⟩
  { 𝕊:
    c ← LnLengths ⌈target÷100
    l∾↩ c
    𝕩 + +´ c
  }•_while_{𝕊: 𝕩 ≤ target} 0
  
  MkLine¨ ¯1+ {𝕩∾target-+´𝕩} ((target-2) ≥ +`l) / l
}

# 30 {! 𝕨 = +´1+≠¨ 𝕩 MkRand 𝕨}¨ 100000 •rand.Range 0
"1_100KB.in" •FLines 3 MkRand 100e3
"1_1MB.in"   •FLines 4 MkRand 1e6
"1_10MB.in"  •FLines 5 MkRand 10e6
"1_50MB.in"  •FLines 6 MkRand 50e6