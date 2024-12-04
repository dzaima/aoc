#!/usr/bin/env bqn
{
  exp ⇐ ⟨
    ⟨ "1", 1189304‿24349736⟩
    ⟨ "2", 432‿488⟩
    ⟨ "3", 167090022‿89823704⟩
    ⟨ "4", 2390‿1809⟩
  ⟩
  
  path ⇐ •path
  args ⇐ •args
  all ⇐ ⟨"1", "2", "3", "4"⟩
  most ⇐ all
  orig ⇐ ∾⟜"_orig"¨ all
} •Import "../../utils/test.bqn"
