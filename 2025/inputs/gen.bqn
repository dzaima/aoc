#!/usr/bin/env bqn
# Usage: ./gen.bqn outputFilename [seed (u for random, 1 for default)] [...day-specific args]
# Day number is inferred as the numeric prefix of the filename
MakeRand ← •MakeRand
⟨MDSlash, Repr0⇐Repr⟩ ← •Import "../../utils/utils.bqn"

Join ← {(≠𝕨)↓ ∾ 𝕨⊸∾¨ 𝕩}
Repr ← '-'⌾⊑⍟('¯'=⊑) Repr0

days ← •HashMap˜⟨⟩

_gen ← {𝕩 days.Set 𝕗}

_fxRand ← {p ← 10⋆𝕩-1 ⋄ p + 𝕨 𝕗.Range 9×p} # 𝕩-digit numbers, no leading zeroes

_retryThis ← {𝕨𝔽{𝕨𝔽𝕘}𝕩 •_while_(≡⟜retry) retry} # retry 𝕨𝔽𝕩 until result isn't retry

{ 𝕊r:
  K ← r.Range
  Q ← {𝕩≥K 0}
  n ← ScaleF 4350
  fracZero ← 0.25
  fracHigh ← 0.2
  c ← 50
  {𝕊:
    r ← K 2
    o ← {0≠c? Q fracZero? 100|-⍟(¬r) c; K 100}
    fo ← {Q fracHigh? 100×1+K 9; 0} + o
    0≠fo?
    d ← o×¯1⋆r
    c2 ← 100|c+d
    (n≠𝕩+1) ∨ 0≠c2? # don't end on 0 on last line
    c ↩ c2
    (r⊑"LR")∾•Repr fo
    ; retry
  }_retryThis¨ ↕n
} _gen 1


{ 𝕊r:
  _rDist ← {⌊ 𝔽⁼ (r.Range 0)×𝔽 𝕩}
  total ← ScaleF 2000000
  one ← ScaleF 200000
  max ← 1e10
  err ← 0.05×total # tolerated deviation from total ID count
  
  NonRepeating ← {𝕊:
    s ← •Repr 𝕩
    k ← ≠s
    ∧´ {1≠≠⍷∘‿𝕩⥊s}¨ (0=|⟜k)⊸/ 1↓↕k
  }
  
  res ← ""
  curr ← 0
  starts‿ends ← 2⥊<↕0
  {𝕊:
    new ← 1
    k ← 2⌈√ _rDist one
    (curr+k)≤total+err?
    start ← ⋆⁼ _rDist max
    end ← start+k
    ∧´¬ (start≤ends)∧end≥starts? # range shouldn't overlap any previous range
    1≥ -´ ≠∘•Repr¨ end‿start? # endpoint lengths should differ by at most 1 digit
    ∧´ 0.001<|0.5-1|0.5+ 10⋆⁼ end‿start? # endpoints shouldn't be an exact power of 10
    ∧´ NonRepeating¨ start‿end? # endpoints themselves shouldn't be repeating
    curr+↩ k
    res∾↩ ∾⟨',', •Repr start, '-', •Repr end⟩
    starts‿ends∾¨↩ start‿end
    ;retry
  }_retryThis •_while_{𝕊: curr≤total-err} @
  1↓res
} _gen 2

Gaussian ← {s𝕊𝕩: (÷√2×π××˜s) × ⋆-0.5××˜𝕩÷s}
{ 𝕊r:
  h ← ScaleF 200
  w ← ScaleF 100
  s ← ScaleD 5
  {𝕊:
    '1'+(w r.Range 0)⍋˜ +`(⊢÷+´) 2‿7‿5‿3‿2‿1‿0.7‿0.4‿0.2 × s Gaussian (¯8×r.Range 0)+↕9
  }¨ ↕h
} _gen 3

{𝕊r:
  side ← ScaleF 136
  sz ← side‿side
  b ← sz r.Range 2
  b∨↩ 2<(sz r.Range 0) × +´ «‿»‿⊢{𝕎𝕩}¨< +´«‿»‿⊢{𝕎𝕩}¨< b
  ⊏⟜".@" b
} _gen 4

{𝕊r:
  max ← 6e14
  rn ← ScaleF 184
  in ← ScaleF 1000
  rs ← ∘‿2⥊ ∧ (rn×2) r.Range 0
  rs+↩ 0≍˘ rn÷⊸× {[a,b]: b×÷0.4+a} 2‿rn r.Range 0
  
  rs ↩ ⌊max×rs
  ∧˘⊸≡ rs?
  rs r.Deal∘≠⊸⊏↩
  rs ↩ {∾∾⟜'-'⌾⊑ Repr¨ 𝕩}¨ <˘ rs
  is ← Repr¨ ⌊max×in r.Range 0
  
  rs ∾ ⟨""⟩ ∾ is
  ;retry
} _gen 5

{𝕊r:
  Ra ← r.Range
  n ← ScaleF 1000
  
  v ← 4
  h ← 4
  
  bs ← { 𝕊:
    h ← 2+Ra h-1
    b ← '1'+v‿h Ra 9
    i ← ⌊v× ∧ 4⋆˜h Ra 0
    i 0⌾⊑↩
    i ⌽⍟(Ra 2)↩
    m ← (↕v) <⌜ i
    b ↩ ⌽⍟(Ra 2) ' '¨⌾(m⊸(/○⥊)) b
    o ← {
      h≥4? '+';
      {1=Ra 4? '+'; '*'}
    }
    b⋈o
  }¨ ↕n
  
  res ← ∾≍ ' '⊸∾˘¨⌾(1⊸↓) ⊑¨bs
  res∾↩ ¯1↓∾ (1⊑¨bs) ↑˜¨ 1+≠∘⊏¨ ⊑¨bs
} _gen 6

{𝕊r:
  Ra ← r.Range
  h ← ScaleF 70
  w ← 1+2×h
  
  e ← w⥊'.'
  
  m ← ∾⋈⟜e¨ {
    ⊏⟜".^" (0⥊˜h-𝕩) (∾∾⊣) 1⌾(¯1⊸⊑) 1∾ ⥊0≍˘ 0≠𝕩 Ra 3
  }¨ ↕h
  
  ⟨'S'⌾(h⊸⊑)e,e⟩ ∾ m
} _gen 7

# {𝕊r:
# } _gen

ScaleD ← !
ScaleF ← !
retry ← {⇐}
{
  args ← •args
  Arg ← {𝕊: (args↓˜↩1) ⊢ (1⌊≠)⊸↑args}
  path ← ⋈⁼ Arg@
  day ← •ParseFloat (∧`('0'⊸≤∧≤⟜'9'))⊸/ •file.Name path
  seed ← ≠◶⟨1, ("u"⊸≡◶⟨•ParseFloat, {𝕊: s←•rand.Range 1e9 ⋄ •Out "Seed: "∾•Repr s ⋄ s}⟩)⊑⟩ Arg@
  ScaleD ↩ Arg⊸{⟨⟩𝕊𝕩: 𝕩; ⟨a⟩𝕊𝕩: •ParseFloat a}
  ScaleF ↩ Arg⊸{⟨⟩𝕊𝕩: 𝕩; ⟨a⟩𝕊𝕩: m←'x'=¯1⊑a ⋄ 𝕩⊸×⍟m •ParseFloat m-⊸↓a}

  f ← days.Get day
  rng ← MakeRand seed
  rn ← 0
  args0 ← args
  res ← {𝕊: args↩args0 ⋄ rn+↩1 ⋄ F rng}•_while_ (retry⊸≡) retry
  path •FLines ⋈⍟(2=•Type∘⊑) <˘⍟(2==) res
  •Out ∾⟨"Wrote ",path,{1≠rn? ∾⟨"; ",•Repr rn, " retries"⟩; ""}⟩
}