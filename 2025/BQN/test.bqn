#!/usr/bin/env bqn
{
  exp ⇐ ⟨
    ⟨ "1", 900‿6331⟩
    ⟨ "2", 22139386442‿22523820653⟩
  ⟩
  
  path ⇐ •path
  args ⇐ •args
  all ⇐ ⊑¨ exp
  most ⇐ all
  orig ⇐ ∾⟜"_orig"¨ all
} •Import "../../utils/test.bqn"
