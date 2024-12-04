#!/usr/bin/env bqn
⟨Input⟩ ← •Import "../../utils/utils.bqn"
l ← •file.MapBytes 2023‿1 Input •args
# l ← •file.MapBytes "../inputs/gen/1_10MB.in"
{l ↩ •file.MapBytes ⊑𝕩}⍟≠ •args
! (@+10) = ¯1⊑l

_chunkByTo_ ← { F _𝕣_ char‿tgt raw:
  {min‿max: F min↓max↑raw}¨ <˘ 2↕⍷ (≠raw)∾˜ 0∾ {
    𝕩 + 1+⊑ (𝕩↓raw) ⊐ char # fast due to slices & short-circuit
  }¨ tgt×↕⌈(≠𝕩)÷tgt
}

names ← "one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"-@

kmap ← ∾1↑¨⊔16| +´¨ 2↑¨ 1↓¨ names
c0‿c1‿c2‿c3‿c4 ← <˘⍉>5↑¨ ⊑⟜names¨ kmap
mults ← kmap ⊏ (49+↕9) - ⊑¨names


part1 ← 0
part2 ← 0

FirstLast ← {
  𝕩 ≤⟜('9'-@)⊸/↩
  nls ← 𝕩=10
  d0 ← (1»nls) / 𝕩
  d1 ← (1«¯1↓nls) / ¯1↓𝕩
  ((+´d1) + 10 × +´d0) - 528×≠d0
}


{
  𝕩 8‿8•bit._cast↩
  part1+↩ FirstLast 𝕩
  
  sh1 ← 0«𝕩
  sh2 ← 0‿0«𝕩
  key ← 16|sh1+sh2
  m ←             (key⊏c0) = 𝕩
  m∧↩             (key⊏c1) = sh1
  m∧↩             (key⊏c2) = sh2
  m∧↩ (t3=0) ∨ (t3←key⊏c3) = 0‿0‿0«𝕩
  m∧↩ (t4=0) ∨ (t4←key⊏c4) = 0‿0‿0‿0«𝕩
  𝕩+↩ (key⊏mults) × m
  
  part2+↩ FirstLast 𝕩
  @
} {30000≤≠𝕩? 𝔽_chunkByTo_ ⟨@+10, 15000⟩ 𝕩; 𝔽 𝕩} l

•Show part1
•Show part2