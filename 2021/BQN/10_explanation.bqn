# start:
57‿3‿25137‿1197‿0⊑˜ 2÷˜¯1+ (i∾9)⊑˜ ⌊´(⊔d) {(1+2× 0⊑∘⊐˜ =´˘∘‿2⥊ 𝕩∾9⥊˜2|≠𝕩) ⊑ 𝕨∾oob}¨ d⊔⌊i÷2
                                     (⊔d)                                                  # position per depth: each item is a list of positions of characters at the given depth
                                                                                    d⊔⌊i÷2 # bracket type per depth: each item is a list of bracket types at the current depth
                                     (⊔d) {(1+2× 0⊑∘⊐˜ =´˘∘‿2⥊ 𝕩∾9⥊˜2|≠𝕩) ⊑ 𝕨∾oob}¨ d⊔⌊i÷2 # execute the block with 𝕨 as the positions, and 𝕩 as the types, per depth
  # example:
  # str:   <()([])[}<
  # index: 0123456789
  # depth: 0111221111
  # i:     4232013074
  # type:  2111001032
  
  # consider depth 1:
  #         ()(  )[}<
  #   𝕨:    123  6789 → 1‿2‿3‿6‿7‿8‿9 (subset of the "index" above)
  #   𝕩:    111  1032 → 1‿1‿1‿1‿0‿3‿2 (subset of "type" above)
  # string: ()()[}< - for reference; we don't use it anywhere; the nature of depth guarantees that even indices are opening brackets and odd ones are closing ones
# inner dfn:
  {(1+2× 0⊑∘⊐˜ =´˘∘‿2⥊ 𝕩∾9⥊˜2|≠𝕩) ⊑ 𝕨∾oob} # whole thing for reference
                       𝕩∾9⥊˜2|≠𝕩           # append a 9 to 𝕩 if the length is odd: 1‿1‿1‿1‿0‿3‿2‿9
                  ∘‿2⥊                     # reshape into two columns: >⟨1‿1,1‿1,0‿3,2‿9⟩
               =´˘                         # check if columns are equal: 1‿1‿0‿0
         0⊑∘⊐˜                             # find index of first mismatch: 2; This gives us the first mismatched character at the current depth
                                           # in the string "()()[}<", that's pointing at the 3rd bracket pair
     1+2×                                  # to convert to the actual index of "}", we need to double the index, and add one to point at the erroring closing brace and not the opening one
   ( 1+2×                       ) ⊑ 𝕨∾oob  # pick that'th element of the indexes
                                           # or return OOB if there were no mismatches and thus ⊐ returned one-past-last
# post-processing:
                                ⌊´  # smallest erroring index from all of the ones we've seen
                         (i∾9)⊑˜    # pick that from the indexes, returning the bracket character index
                   2÷˜¯1+           # convert the bracket character index to a type index
57‿3‿25137‿1197‿0⊑˜                 # and get that-th element of the lookup table