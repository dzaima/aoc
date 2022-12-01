#!/usr/bin/env cbqn
⟨Num,SplitF⟩ ← •Import "utils.bqn"
l ← Num¨¨ ⟨⟩SplitF •FLines ≠◶"1.in"‿⊑ •args

•Show¨ 0‿2⊏ +` 3↑∨ +´¨ l