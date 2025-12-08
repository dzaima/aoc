#!/usr/bin/env bqn
⟨Ints, Input⟩ ← •Import "../../utils/utils.bqn"
l ← Ints¨ •FLines 2025‿8 Input •args
n ← ≠l

t ← <˘⍉> l # transposed form (⟨all xs, all ys, all zs⟩) for more array-y processing
pi ← ⍋ ∾ (↕n) {+´×˜𝕩-𝕨↑¨t}¨ l # get distance between all combinations of pairs (without duplicates)
tri ← +` ↕n # as the above is indices in a deshaped triangle, compute the start index of each triangle row
j0 ← tri ⍋ pi # get row for each index (i.e. one junction of the connection)
j1 ← pi - j0⊏»tri # and the respective columns (i.e. other junction)

c ← ↕n # "map" of junction → circuit ID, shared between both parts

p1n ← {n=20? 10; 1000}
p1j ← p1n↑¨j0‿j1 # the asked-for connections
{
  a‿b ← 𝕨‿𝕩⊏c # circuit IDs of the boxes
  a≠b?        # if they're not equal,
    c a¨⌾((b=c)⊸/)↩ ⋄ @; # change ones ID to the others
  @
}¨´ p1j

•Show ×´ 3↑ ∨ /⁼c

# part 2; continues using the same circuit map started before
{𝕊: # while not done:
  j ← 𝕩⊑¨j0‿j1 # next pair of junctions
  a‿b ← j⊏c    # the circuit IDs of those
  a≠b?
    c a¨⌾((b=c)⊸/)↩ # merge them if needed
    {𝕊:
      •Show ×´ j ⊏ ⊑t # print the part 2 result
      @               # and stop the loop,
    }⍟(∧´c=⊑c) 𝕩+1 # if all circuit IDs are the same
  ;𝕩+1
}•_while_(@⊸≢) p1n
