#!/usr/bin/env bqn
# Usage: ./gen.bqn outputFilename [seed (u for random, 1 for default)] [...day-specific args]
# Day number is inferred as the numeric prefix of the filename
MakeRand ← •MakeRand
⟨MDSlash⟩ ← •Import "../../utils/utils.bqn"

Join ← {(≠𝕨)↓ ∾ 𝕨⊸∾¨ 𝕩}
Repr ← '-'⌾⊑⍟('¯'=⊑) •Repr

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