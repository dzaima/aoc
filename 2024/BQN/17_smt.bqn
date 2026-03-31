#!/usr/bin/env bqn
⟨SMT, Ints, Input⟩ ← •Import "../../utils/utils.bqn"
p ← Ints 4⊑•FLines 2024‿17 Input •args
⟨newrepl⟩ ← SMT "z3"‿"cvc5"

r ← Newrepl @

solve ← r.REPLExec "{
  Run ← {p𝕊r:
    outs ← ⟨⟩
    jleft ← ≠p
    req ← true
    Step ← {
      opcode‿lit ← 2↑𝕩↓p
      combo ← {𝕩≤3? 𝕩; 7: '!'; (𝕩-4)⊑r} lit
      ip←opcode◶⟨
        {r((⊑r) »_u combo)⌾(  ⊑)↩ ⋄ 𝕩} # adv
        {r (lit Xor ⊢)⌾(1⊸⊑)↩ ⋄ 𝕩}     # bxl
        {r (7 ∧ combo)⌾(1⊸⊑)↩ ⋄ 𝕩}     # bst
        { # jnz
          jleft-↩ 1
          stay ← jleft≤0
          req∧↩ stay = 0=⊑r
          stay? 𝕩; lit
        }
        {r ((2⊑r) Xor ⊢)⌾(1⊸⊑)↩ ⋄ 𝕩}   # bxc
        {outs∾↩7∧ combo⋄𝕩}             # out
        {r((⊑r) »_u combo)⌾(1⊸⊑)↩ ⋄ 𝕩} # bdv
        {r((⊑r) »_u combo)⌾(2⊸⊑)↩ ⋄ 𝕩} # cdv
      ⟩ 𝕩+2
      ip
    }
    Step•_while_{𝕩≠≠p} 0
    req‿outs
  }
  
  { 𝕊 p:
    _do ← { 𝔽_𝕣𝕩:
      a ← $i64
      req‿outs ← p Run ⟨a, 0i64, 0i64⟩
      Sat req ∧ (𝔽 a) ∧´ p = outs?
        FindToBQN a
      ;
        @
    }
    
    1⊑{@≢r←<_u⟜𝕩 _do @? 1‿r; 0⋈𝕩}∘(1⊸⊑)•_while_⊑ 1⋈10+1 _do @
  }
}"

•Show Solve p