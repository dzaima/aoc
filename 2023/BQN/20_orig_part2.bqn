#!/usr/bin/env bqn
⟨Split⟩ ← •Import "../../utils/utils.bqn"
l ← {{⟨⊑𝕩⟩∾¯1↓¨2↓𝕩} ' ' Split 𝕩∾","}¨ •FLines ≠◶"20.in"‿⊑ •args
l∾↩< ⟨"%rx"⟩
kn← ⊑¨l
vn← 1↓¨l
v ← (1↓¨kn)⊸⊐¨ vn
t ← ⊑¨kn
k ← ↕≠kn
conn ← ≠¨ ((∾v)∾≠k)⊔(≠¨v)/↕≠v # conn number
om ← =⟜<↕≠k # one mask
zm ← ¬om # zero mask


# •Show¨ ∾(kn)(<⊸(⋈¨))¨vn
# •Exit 0

rx ← ¯1+≠k

rx3 ← {/∨´¨ 𝕩⊸∊¨v}⍟2 ⋈rx

# •Show (¬(∾v) ∊ k)/∾vn

! ∧´ (∾v) ∊ k


# •Show¨ t∾¨k∾¨v
br ← ⊑kn⊐<"broadcaster"
mem0 ← (0¨ t){𝕩≡'&'? 𝕗; 0}¨ t

ls ← 0
hs ← 0
hist ← ⟨⟩¨ k
bpc←0
Step ← {𝕊tick‿m‿w‿i‿h:
  # ! ∧´(rx=i)/h
  rxm ← h∧w∊rx3
  hist ∾⟜bpc¨⌾((rxm/w)⊸⊏)↩
  # {hist∾⟜(𝕩⊑h)⌾((𝕩⊑i)⊸⊑)↩⋄1}¨ /rxm
  # {𝕩⊑h? hist∾⟜tick⌾((𝕩⊑i)⊸⊑)↩⋄1;1}¨ /rxm
  # •Show rxm/i
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
  # ! 1≥≡2⊑ffr
  a ← ¬f
  ah ← a∧h
  al ← a∧¬h
  # ! 1=≡(t='%')/m
  # ! 1=≡(t='%')/m
  # m ↩ m∨{∨´𝕩⊏om}¨ ((ah/i)∾≠m) ⊔ ah/w
  # m ↩ m∧{∧´𝕩⊏zm}¨ ((al/i)∾≠m) ⊔ al/w
  # {⟨⟩𝕊𝕩:0; m∨⟜(∨´𝕨⊏om)⌾(𝕩⊸⊑)↩⋄0}¨⟜↕⟜≠ ((ah/i)∾≠m) ⊔ ah/w
  # {⟨⟩𝕊𝕩:0; m∧⟜(∧´𝕨⊏zm)⌾(𝕩⊸⊑)↩⋄0}¨⟜↕⟜≠ ((al/i)∾≠m) ⊔ al/w
  {m∨⟜((𝕩⊑w)⊑om)⌾((𝕩⊑i)⊸⊑)↩⋄0}¨ /ah
  {m∧⟜((𝕩⊑w)⊑zm)⌾((𝕩⊑i)⊸⊑)↩⋄0}¨ /al
  #•Show ah
  #•Show al
  #•Show a/w
  ! 1=≡(t='%')/m
  anr ← (⊏⟜v)⊸{l←≠¨𝕨⋄⟨l/𝕩, ∾𝕨, l/(𝕩⊏conn) ≠ +´¨𝕩⊏m⟩} a/i
  ! 1≥≡2⊑anr
  # •Show v
  # •Out ""
  ⟨tick+1,m⟩∾ffr∾¨anr
}

bp0 ← {⟨br¨𝕩,𝕩,0¨𝕩⟩} br⊑v
Press ← {ls+↩1 ⋄ 1⊑ t←Step •_while_{×≠2⊑𝕩} 0‿𝕩∾bp0}
Press⍟1000 mem0
•Show ls×hs
# •Show ls
# •Show hs


# hist ← ⟨0,≠rx3⟩⥊0
{
  bpc+↩1
  m ← Press 𝕩
  # hist∾↩ rx3⊏m
  m
}⍟30000 mem0
# {•Show -⟜» /{¬𝕩∊1‿2} -⟜»/𝕩}¨ rx3⊏hist
# •Show¨ {q←-⟜» /{¬𝕩∊1‿2} -⟜»/𝕩 ⋄ 1<≠q? q; 20↑1000↓𝕩}¨ rx3⊏hist
•Show •math.LCM´ ¯1⊑¨ {-⟜»𝕩}¨ ×∘≠¨⊸/ hist
# vs ← {-⟜»/0‿1⍷𝕩}¨ <˘ ⍉hist
# •Show¨ {⊐⌾⌽𝕩}¨ vs

# > 35891323 # 6289×5707
# < 123813786835145216L