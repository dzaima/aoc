#!/usr/bin/env bqn
⟨MemoInit, Ints, Split, Input⟩ ← •Import "../../utils/utils.bqn"
l ← •FLines 2025‿10 Input •args

# follows the algorithm at https://www.reddit.com/r/adventofcode/comments/1pk87hl
Solve ← {
  sep ← ⊑𝕩⊐']'
  groups ← Ints¨ ' 'Split (2+sep)↓𝕩 # all integers parsed at once
  lights ← '#'=1↓sep↑𝕩
  buttons ← ¯1↓groups
  joltages ← ¯1⊑groups
  # parsing done
  
  n ← ≠lights
  bm ← (n↑/⁼)¨ buttons # for each button, a mask of lights it turns on
  
  # we'll work primarily over all possible button press combinations ("combination")
  
  sums ← [0¨lights] {𝕩∾𝕩+⎉1𝕨}´ bm # a matrix with a row for each combination of the amount a given light is increased
  
  Popcounts ← +˝˘ ·32‿1•bit._cast ≍˘ # for each combination, the number of button presses involved (i.e. a plain integer popcount)
  # manual impl of Popcounts:
  #   counts ← (⊢∾1⊸+)⍟(≠bm) ⋈0 ⋄ Popcounts ← ⊏⟜counts
  
  toEven ← (n⥊2) ⥊ (2⋆n) ↑ ⊔ 2⊸×⊸+˜˝ ⌽⍉2|sums # an n-dimensional array, indexed by lamp oddness, returning a list of combinations that achieve such oddness
  
  memo ← MemoInit ⋈¨ ⟨0¨lights, 0⟩ # memoization, plus built-in handling of the final all-zeroes state
  F ← { 𝕊 c:
    i ← (2|c) ⊑ toEven # find the combinations to bring to even counts
    p ← Popcounts i # respective button presses
    ⌊´ p + { # for the possible sums, the minimum of:
      ∧´0≤d←c-𝕩? # if a given combination doesn't bring us over the joltage cap,
        2×F d÷2;   # recurse via halving
      ∞          # else, this is dead-end
    }˘ i ⊏ sums
  }_memo
  
  ⟨
    ⌊´ Popcounts lights⊑toEven # part 1: oddness is exactly what we want
    F joltages # part 2: recursive joltage calculation
  ⟩
}

•Show¨ +´ Solve¨ l
