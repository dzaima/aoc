#!/usr/bin/env bqn
⟨SplitF,Split⟩ ← •Import "../../utils/utils.bqn"
a‿b ← ⟨⟩SplitF •FLines ≠◶"19.in"‿⊑ •args

rules ← {
  n‿r←'{' Split 𝕩
  n ⋈ {
    c‿t←':'Split𝕩
    m ← ⋈⁼"<>"(∊/⊣)c
    l‿r ← m Split c
    ⟨(⊑l⊐˜"xmas")⊸⊑ ((⊑m⊐˜"<>")⊑<‿>){𝔽} (•ParseFloat r){𝔽}, t⟩
  }¨⌾(¯1↓⊢) {1‿𝕩}⌾(¯1⊸⊑) ','Split ¯1↓r
}¨ a

rm ← •HashMap˝ ⍉>rules
r0 ← rm.Get "in"
Get ← {c‿r←⊑l←𝕨 ⋄ a←𝕩 ⋄ {C a? {1=≠r? r≡"A"; (rm.Get r) Get a}; (1↓l) Get a}}
•Show +´+´¨{{r0 Get 𝕩}⊸× •ParseFloat¨ 2↓¨','Split ¯1↓1↓𝕩}¨ b


rules2 ← {
  n‿r←'{' Split 𝕩
  n ⋈ {
    c‿t←':'Split𝕩
    m ← ⋈⁼"<>"(∊/⊣)c
    l‿r ← m Split c
    ⟨⊑l⊐˜"xmas", (⊑m⊐˜"<>")⊑"<>", •ParseFloat r, t⟩
  }¨⌾(¯1↓⊢) {0‿'<'‿4001‿𝕩}⌾(¯1⊸⊑) ','Split ¯1↓r
}¨ a

rm ↩ •HashMap˝ ⍉>rules2

done ← •HashMap˜⟨⟩

all ← ⟨1‿1‿1‿1, 4001‿4001‿4001‿4001⟩
Do ← {
  done.Has 𝕩? done.Get 𝕩;
  𝕩 done.Set @
  And ← {
    i‿o‿c‿· ← 𝕨
    {o≡'>'? (1+c)⌈𝕩; c⌊𝕩}⌾(i⊑{o≡'>'?0;1}⊑⊢) 𝕩
  }
  AndN ← {
    i‿o‿c‿· ← 𝕩
    {o≡'<'? c⌈𝕩; (c+1)⌊𝕩}⌾(i⊑{o≡'>'?1;0}⊑⊢) 𝕨
  }
  res ← ∾{¯1↓↑𝕩}⊸({"R"≡3⊑𝕩? ⟨⟩; "A"≡3⊑𝕩? ⟨(𝕩 And all) AndN˜´⌽ 𝕨⟩; (⊢ AndN˜´⟜⌽ 𝕨˙)¨ 𝕩⊸And¨ Do 3⊑𝕩}¨) rm.Get 𝕩
  𝕩 done.Set res
  res
}

•Show +´{×´-´⌽𝕩}¨ Do "in"