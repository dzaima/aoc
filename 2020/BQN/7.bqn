#!/usr/bin/env cbqn
⟨Split,Num,_f_⟩ ← •Import "utils.bqn"
l ← •FLines ≠◶"7.in"‿⊑ •args

p ← {
  ws ← ' ' Split 𝕩
  t0 ← 2↑ws
  W ← (⊣∾' '∾⊢)´
  ⟨W t0, {a‿b‿c←ws⊏˜4‿5‿6+4×𝕩 ⋄ ⟨Num a, W b‿c⟩}¨ ↕⌊4÷˜¯4+≠ws⟩
}¨ l

s ← ⊑¨p
n‿c ← <˘⍉> {(⊑¨⋈1⊑¨⊢) 𝕩}¨ 1⊑¨p
ns ← s ⋄ ! ns ≡ ⍷s∾∾c
si ← ns⊐s
ci ← ns⊸⊐¨ c
ri ← (∾ci) ⊔ (≠¨ci)/↕≠ci # reverse indices

shiny ← ⊑ns⊐<"shiny gold"

•Show ¯1+≠ {⍷𝕩∾∾𝕩⊏ri} _f_≢ ⋈shiny

•Show ⊑{s‿m‿l: ln←l⊏n ⋄ ⟨s+´∾m×ln ⋄ ((≠¨ln)/m)×∾ln ⋄ ∾l⊏ci⟩}•_while_{s‿m‿l:×≠l} ⟨0, ⋈1, ⋈shiny⟩