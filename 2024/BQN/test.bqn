#!/usr/bin/env bqn
{
  exp ⇐ ⟨
    ⟨"1", 1189304‿24349736⟩
  ⟩
  
  path ⇐ •path
  args ⇐ •args
  all ⇐ ⟨"1"⟩
  most ⇐ all
  orig ⇐ ∾⟜"_orig"¨ all
} •Import "../../utils/test.bqn"
