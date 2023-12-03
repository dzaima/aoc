#!/usr/bin/env cbqn
l ← •file.MapBytes ≠◶"1.in"‿⊑ •args
! (@+10) = ¯1⊑l

_chunkByTo_ ← { F _𝕣_ char‿tgt raw:
  {min‿max: F min↓max↑raw}¨ <˘ 2↕⍷ (≠raw)∾˜ 0∾ {
    𝕩 + 1+⊑ (𝕩↓raw) ⊐ char # fast due to slices & short-circuit
  }¨ tgt×↕⌈(≠𝕩)÷tgt
}

names ← "one"‿"two"‿"three"‿"four"‿"five"‿"six"‿"seven"‿"eight"‿"nine"
unq ← ⍷∾names

unqNth ← ' '⊸≠⊸/¨ ⍷¨ <˘⍉>5↑¨names
reqShifts ← ∾⋈¨¨⟜↕⟜≠ unqNth
doShifts ← {𝕩=0? (⊑unq⊐𝕨)⊑⊢; (𝕩⥊0)«(⊑unq⊐𝕨)⊑⊢}´¨ reqShifts
doAnds ← {∧´(reqShifts⊐⋈¨⟜↕⟜≠ 𝕩)⊏⊢}¨ names

mults ← ('1'+↕9) - ⊑¨names

part1 ← 0
part2 ← 0

FirstLast ← {
  nls ← 𝕩=@+10
  d0 ← '0' -˜ (1»nls) / 𝕩
  d1 ← '0' -˜ (1«¯1↓nls) / ¯1↓𝕩
  +´d1 + 10×d0
}
Filter ← ∊⟜((@+10)∾'1'+↕9)⊸/

{
  part1+↩ FirstLast Filter 𝕩
  uv ← 𝕩⊸=¨ unq
  shifts ← {𝕏 uv}¨ doShifts
  ands ← {𝕏 shifts}¨ doAnds
  𝕩 ↩ 𝕩 + +´ mults × ands
  𝕩 ↩ Filter 𝕩
  part2+↩ FirstLast 𝕩
  @
} _chunkByTo_ ⟨@+10, 15000⟩ l

•Show part1
•Show part2