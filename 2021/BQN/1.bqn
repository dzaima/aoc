#!/usr/bin/env bqn
⟨Num⟩ ← •Import "../../utils/utils.bqn"
l ← Num¨ •FLines ≠◶"1.in"‿⊑ •args
•Show +´<´˘2↕l
•Show +´<´˘2↕+´˘3↕l
