#!/usr/bin/env bqn
{
  exp ⇐ ⟨
    ⟨ "1", 1808101‿27846004⟩
    ⟨ "2", 82‿321⟩
    ⟨ "3", 138539169‿98109282⟩
    ⟨ "4", 1993‿934⟩
    ⟨ "5", 4430‿5706⟩
    ⟨ "6", 5222‿2178⟩
    ⟨ "7", 178081517923419‿816730407299909⟩
    ⟨ "8", 144‿515⟩
    ⟨ "9", 6322758938834‿6346483454541⟩
    ⟨"10", 135‿189⟩
    ⟨"11", 204651‿241963594833562⟩
    ⟨"12", 3126602‿2311062⟩
  ⟩
  
  path ⇐ •path
  args ⇐ •args
  all ⇐ ⊑¨ exp
  most ⇐ all
  orig ⇐ ∾⟜"_orig"¨ all
} •Import "../../utils/test.bqn"
