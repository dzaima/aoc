#!/usr/bin/env bqn
⟨RB, B10, Num, Repr, LCM, GCD, Ints, SInts, Split, SplitF, Indices, ReIndex, MDSlash, MDSlashI, Unjoin, Count, _fx_, _fi_, _underSelect_, Tr, TW, Input⟩ ← •Import "../../utils/utils.bqn"
l ← {<˘2‿2⥊𝕩}¨ SInts¨ •FLines 2024‿14 Input •args

sz ← {(≠l)<15? 11‿7; 101‿103}
ps←{p‿v: sz|p + v×100}¨ l
# •Show ⍉1¨⌾(ps⊸⊑) sz⥊0
z←⟨⟩
z∾↩+´∧´¨ m1←ps > <⌊sz÷2
z∾↩+´∧´¨ m2←ps < <⌊sz÷2
z∾↩+´∧´¨ m1 {⟨⊑𝕨,1⊑𝕩⟩}¨m2
z∾↩+´∧´¨ m1 {⟨1⊑𝕨,⊑𝕩⟩}¨m2
•Show×´z

q←l
{ 𝕊:
    q↩{p‿v: ⟨sz|p + v,v⟩}¨q
    m ← 1¨⌾((⊑¨q)⊸⊑) sz⥊0
    zz←𝕩
    {𝕊:
        •Show zz
        !0 # throw & catch added afterwards to make solution terminate automatically
        # •Show m⊏"·#"
    }⍟⊢ {𝕩∧»𝕩}⍟10 m
    𝕩+1
}•_While_ 1⎊'e' 1
# (↕100) {•Show 𝕨⋄•Show ⊏⟜"·#" 1¨⌾(𝕩⊸⊑)sz⥊0}¨ ⊑¨¨ {p‿v: ⟨sz|p + v,v⟩}¨⍟(↕100) l