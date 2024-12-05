#!/usr/bin/env bqn
MakeRand ← •MakeRand
⟨MDSlash⟩ ← •Import "../../utils/utils.bqn"

Join ← {(≠𝕨)↓ ∾ 𝕨⊸∾¨ 𝕩}
Repr ← '-'⌾⊑⍟('¯'=⊑) •Repr

days ← •HashMap˜⟨⟩

_gen ← {𝕩 days.Set 𝕗}

_fxRand ← {p ← 10⋆𝕩-1 ⋄ p + 𝕨 𝕗.Range 9×p} # 𝕩-digit numbers, no leading zeroes

{ 𝕊r:
  n ← ScaleF 1000
  n2 ← n×2
  {(⊣∾"   "∾⊢)´Repr¨𝕩}¨ <˘ n‿2⥊ (n2 r.Range n2) ⊏ n2 r _fxRand ScaleD 5
} _gen 1

{ 𝕊r:
  n ← ScaleF 1000
  vs ← (n r.Range 2) -∘⊢⍟⊣¨ (5+ n r.Range 4) {
    l ← +` 𝕨 r.Range 4
    o ← r.Range 3⌊≠l
    l (¯10+20 r.Range˜≠)⊸+⌾((o r.Deal ≠l)⊸⊏)↩
    l
  }¨ n
  vs {{𝕩 + r.Range 99-⌈´𝕩} 𝕩-⌊´𝕩}¨↩
  {' 'Join Repr¨ 𝕩}¨ vs
} _gen 2

{ 𝕊r:
  n ← ScaleF 17800
  l ← (n r.Range ≠)⊸⊏ "![]%^&*()_+muldon't()"
  Sprinkle ← {l 𝕩⌾((≠𝕩)↑(r.Range (≠l)-≠𝕩)↓⊢)↩ ⋄ 1}¨
  Sprinkle {𝕊: a‿b←2 r.Range 1000 ⋄ ∾⟨"mul(", Repr a, ",", Repr b, ")"⟩}¨ ↕⌊n÷15
  Sprinkle (⌊n÷600)⥊<"do()"
  Sprinkle (⌊n÷600)⥊<"don't()"
  l (@+10)¨⌾(((⌊0.5+ n÷3500) r.Deal ≠l)⊸⊏)↩
  l∾@+10
} _gen 3

{ 𝕊r:
  n ← ScaleF 140
  pts ← ⌽∘⍉⍟(↕4) ≍"XMAS"
  pts∾↩ {⌽˘¨⊸∾ ⌽⊸⋈ 𝕩} 4‿4⥊∾∾⟜"...."¨ "XMAS"
  pts∾↩ ⌽∘⍉⍟(↕4) ["M.S",".A.","M.S"]
  m ← "XMAS" ⊏˜ n‿n r.Range 4
  pti ← {MDSlash 𝕩≠'.'}¨ pts
  ptc ← pti ⊑¨ pts
  ptr ← n- ⌈´¨ pti
  {
    m (𝕩⊑ptc)⌾(((r.Range¨ 𝕩⊑ptr)⊸+¨ 𝕩⊑pti)⊸⊑)↩
    1
  }¨ (⌊×˜n) r.Range ≠pts
  m
} _gen 4

{ 𝕊r:
  nodes ← ⌈⌾(÷⟜4) 24⌈ ScaleF 100
  tests ← ScaleD ⌊nodes×1.85
  
  q ← nodes÷4
  conn ← nodes‿nodes⥊0
  
  qs ← ⟨
    ⟨nodes-q-2, nodes-q-1⟩⊸+¨ ↕q-2
    ⟨nodes-q+1, nodes-q⟩⊸+¨ - ↕q-1
    ⌽⟨nodes-q, nodes-q-1⟩⊸+¨ -⊸⋈¨ ↕q-1
    ⌽⟨nodes-q-1, nodes-q+1⟩⊸+¨ ⋈⟜-¨ ↕q-1
  ⟩
  {
    y‿x ← <˘⍉>𝕩
    conn 1¨⌾((∾ y ⋈¨¨ 1↓↑x)⊸⊑)↩
    1
  }¨ qs
  
  t ← { 𝕊:
    qc ← (2+r.Range 2) ⊑ qs # I have no clue what happens with the other two quadrants
    k ← 1+2× 2+ r.Range ¯2+⌊q÷2
    is ← k r.Subset ≠qc
    r.Deal∘≠⊸⊏⍟(r.Range 2) ⊑¨is⊏qc
  }¨ ↕tests
  
  d ← MDSlash conn
  
  nl←⌊nodes÷10
  shuf ← (↕nl) ∾ nl+r.Deal nodes-nl
  d‿t ⊏⟜shuf¨¨↩
  d‿t r.Deal∘≠⊸⊏¨↩
  
  ({'|'Join Repr¨𝕩}¨ d)∾⟨⟨⟩⟩∾ (','Join Repr¨)¨ t
} _gen 5

# { 𝕊r:
# } _gen

ScaleD ← !
ScaleF ← !
{
  args ← •args
  Arg ← {𝕊: (args↓˜↩1) ⊢ (1⌊≠)⊸↑args}
  path ← ⋈⁼ Arg@
  day ← •ParseFloat (∧`('0'⊸≤∧≤⟜'9'))⊸/ •file.Name path
  seed ← ≠◶⟨1, ("u"⊸≡◶⟨•ParseFloat, {𝕊: •rand.Range 1e9}⟩)⊑⟩ Arg@
  ScaleD ↩ Arg⊸{⟨⟩𝕊𝕩: 𝕩; ⟨a⟩𝕊𝕩: •ParseFloat a}
  ScaleF ↩ Arg⊸{⟨⟩𝕊𝕩: 𝕩; ⟨a⟩𝕊𝕩: m←'x'=¯1⊑a ⋄ 𝕩⊸×⍟m •ParseFloat m-⊸↓a}

  path (0=•Type∘⊑)∘⊢◶•FChars‿•FLines <˘⍟(2==) {𝕏 MakeRand seed} days.Get day
}