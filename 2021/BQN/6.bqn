#!/usr/bin/env bqn
⟨Num, RB, Ints⟩ ← •Import "../../utils/utils.bqn"
l ← Ints ⊑•FLines ≠◶"6.in"‿⊑ •args

•Show¨ +´¨ {(⊑𝕩)⊸+⌾(6‿8⊸⊏) 0«𝕩}⍟80‿256 9↑ /⁼∧l