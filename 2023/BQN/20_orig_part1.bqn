#!/usr/bin/env bqn
⟨Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← {{⟨⊑𝕩⟩∾¯1↓¨2↓𝕩} ' ' Split 𝕩∾","}¨ •FLines 2023‿20 Input •args
l∾↩< ⟨"%rx"⟩
kn← ⊑¨l
vn← 1↓¨l
v ← (1↓¨kn)⊸⊐¨ vn
t ← ⊑¨kn
k ← ↕≠kn
conn ← ≠¨ ((∾v)∾≠k)⊔(≠¨v)/↕≠v # conn number
om ← =⟜<↕≠k # one mask
zm ← ¬om # zero mask

rx ← ¯1+≠k

# •Show (¬(∾v) ∊ k)/∾vn

! ∧´ (∾v) ∊ k

# •Show¨ t∾¨k∾¨v
br ← ⊑kn⊐<"broadcaster"
mem0 ← (0¨ t){𝕩≡'&'? 𝕗; 0}¨ t

ls ← 0
hs ← 0
Step ← {m𝕊w‿i‿h:
  ! ∧´(rx=i)/h
  ls+↩ +´¬h
  hs+↩ +´h
  # •Out ""
  # •Show m
  # •Show w‿i‿h
  f←'%'=i⊏t
  # •Out"--"
  # •Show ≡h
  # •Show h
  # •Show i
  ff←i/˜f∧¬h
  m¬⌾(ff⊸⊏)↩
  ffr ← {⟨ff/˜≠¨𝕩,∾𝕩,(≠¨𝕩)/ff⊏m⟩} ff⊏v
  # •Show 1+ff
  ! 1≥≡2⊑ffr
  a ← ¬f
  ah ← a∧h
  al ← a∧¬h
  ! 1=≡(t='%')/m
  m ↩ m∨{∨´𝕩⊏om}¨ ((ah/i)∾≠m) ⊔ ah/w
  ! 1=≡(t='%')/m
  m ↩ m∧{∧´𝕩⊏zm}¨ ((al/i)∾≠m) ⊔ al/w
  #•Show ah
  #•Show al
  #•Show a/w
  ! 1=≡(t='%')/m
  anr ← (⊏⟜v)⊸{l←≠¨𝕨⋄⟨l/𝕩, ∾𝕨, l/(𝕩⊏conn) ≠ +´¨𝕩⊏m⟩} a/i
  ! 1≥≡2⊑anr
  # •Show v
  # •Out ""
  ⟨m, ffr∾¨anr⟩
}

bp0 ← {⟨br¨𝕩,𝕩,0¨𝕩⟩} br⊑v
Press ← {ls+↩1 ⋄ ⊑ Step´•_while_{×≠⊑1⊑𝕩} 𝕩‿bp0}
Press⍟1000 mem0
# •Show ls
# •Show hs
•Show ls×hs
