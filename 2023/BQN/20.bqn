#!/usr/bin/env bqn
⟨Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← {{⟨⊑𝕩⟩∾¯1↓¨2↓𝕩} ' ' Split 𝕩∾","}¨ •FLines 2023‿20 Input •args
l∾↩< ⟨"%rx"⟩
kn← ⊑¨l
vn← 1↓¨l
v ← (1↓¨kn)⊸⊐¨ vn
t ← ⊑¨kn
k ← ↕≠kn
cc ← ≠¨ ((∾v)∾≠k) ⊔ (≠¨v)/↕≠v # connection count
! ∧´ (∾v) ∊ k


rx ← ¯1+≠k
rx2 ← {/∨´¨ 𝕩⊸∊¨v}⍟2 ⋈rx


om ← =⟜<↕≠k # one mask
zm ← ¬om # zero mask
ls ← 0
hs ← 0
first ← ∞¨ k
bpc ← 0
Step ← {𝕊m‿w‿i‿h:
  
  rxm ← h∧w∊rx2
  first bpc¨⊸⌊⌾((rxm/w)⊸⊏) ↩
  
  ls+↩ +´¬h
  hs+↩ +´h
  
  f ← '%'=i⊏t
  a ← ¬f
  
  ff ← i/˜f∧¬h
  m ¬⌾(ff⊸⊏) ↩
  ffr ← {l←≠¨𝕩 ⋄ ⟨l/ff, ∾𝕩, l/ff⊏m⟩} ff⊏v
  
  ah ← a∧h
  al ← a∧¬h
  {m ((𝕩⊑w)⊑om)⊸∨⌾((𝕩⊑i)⊸⊑) ↩ ⋄ 0}¨ /ah
  {m ((𝕩⊑w)⊑zm)⊸∧⌾((𝕩⊑i)⊸⊑) ↩ ⋄ 0}¨ /al
  anr ← (⊏⟜v)⊸{l←≠¨𝕨⋄⟨l/𝕩, ∾𝕨, l/(𝕩⊏cc) ≠ +´¨𝕩⊏m⟩} a/i
  
  ⟨m⟩∾ffr∾¨anr
}

br ← ⊑kn⊐<"broadcaster"
bp0 ← {⟨br¨𝕩,𝕩,0¨𝕩⟩} br⊑v
Press ← {ls+↩1 ⋄ ⊑Step •_while_{×≠1⊑𝕩} ⟨𝕩⟩∾bp0}

mem0 ← (0¨ t){𝕩≡'&'? 𝕗; 0}¨ t
{
  bpc+↩ 1
  r ← Press 𝕩
  •Show⍟(bpc≡1000) ls×hs
  r
}•_while_{𝕊: (bpc<1000) ∨ (≠rx2) ≠ +´ ∞≠first} mem0

•Show •math.LCM´ ∞⊸≠⊸/ first
