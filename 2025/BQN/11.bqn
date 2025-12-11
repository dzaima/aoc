#!/usr/bin/env bqn
⟨Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← ' 'Split¨ •FLines 2025‿11 Input •args
k ← (¯1↓⊑)¨ l
v ← 1 ↓¨ l

Outs ← ("out"≡⊑)¨⊸/

{ # part 1
  map ← k •HashMap v
  r ← 0
  {
    r+↩ +´ 1⊑¨ Outs 𝕩
    ss ← ∾ {⋈⟜𝕩¨ ⟨⟩map.Get 𝕨}´¨ 𝕩
    k ← ⊑¨ ss
    u ← ⊐ k
    nks ← u ∊⊸/ k
    nvs ← +´¨ u ⊔ 1⊑¨ss
    nks ⋈¨ nvs
  }•_while_(×≠) ⟨"you"‿1⟩
  •Show r
}

{ # part 2
  map ← k •HashMap k {⟨⋈¨𝕩, "dac"‿"fft"≡¨<𝕨⟩}¨ v
  r ← 0
  {
    r+↩ +´ {·‿dac‿fft‿n: n × dac∧fft}¨ Outs 𝕩
    ss ← ∾ {
      s ← ⊑ 𝕩
      vs‿m ← ⟨⟨⟩,0‿0⟩ map.Get s
      vs ∾¨ < m⊸∨⌾(2⊸↑) 1↓𝕩
    }¨ 𝕩
    k ← 3 ↑¨ ss 
    u ← ⊐ k
    nks ← u ∊⊸/ k
    nvs ← +´¨ u ⊔ 3⊑¨ss
    nks ∾¨ nvs
  }•_while_(×≠) ⟨"svr"‿0‿0‿1⟩
  •Show r
}
