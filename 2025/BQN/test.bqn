#!/usr/bin/env bqn
{
  exp ⇐ ⟨
    ⟨ "1", 900‿6331⟩
    ⟨ "2", 21403002594‿21780532797⟩
  ⟩
  
  path ⇐ •path
  args ⇐ •args
  all ⇐ ⊑¨ exp
  most ⇐ all
  orig ⇐ ∾⟜"_orig"¨ all
} •Import "../../utils/test.bqn"
