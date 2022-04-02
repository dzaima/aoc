#!/usr/bin/env cbqn
⟨Num⟩ ← •Import"utils.bqn"
l ← Num¨ •FLines ≠◶"1.in"‿⊑ •args
•Show +´<´˘2↕l
•Show +´<´˘2↕+´˘3↕l
