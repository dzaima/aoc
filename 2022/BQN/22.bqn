#!/usr/bin/env bqn
⟨SplitF, Ints, MDSlash⟩ ← •Import "../../utils/utils.bqn"
b0‿m ← ⟨⟩SplitF •FLines ≠◶"22.in"‿⊑ •args
b0 {>𝕩↑˜¨⌈´≠¨𝕩}↩
b ← ¯1‿¯1⌽(2+≢b0)↑b0
# b2 ← ' '¨b

l ← Ints ⊑m
dc ← 'R'∾∊⟜"RL"⊸/ ⊑m
da ← 4|¯1+`(dc='R')-dc='L' # right/down/left/up
dx ← (da=0)-da=2
dy ← (da=1)-da=3

p0 ← 1⋈⊑/'.'=1⊏b
Password ← {+´1000‿4‿1×𝕩}

•Show Password {
  p ← p0
  l { l𝕊delta:
    { 𝕊:
      # pv←⊑⟜">∨<∧"⊑delta⊐˜[0‿1,1‿0,0‿¯1,¯1‿0] ⋄ b2 pv⌾((+´p×1«≢b2)⊑⥊)↩
      p2 ← delta+p
      v ← p2⊑b
      { 𝕊:
        p2 ↩ -⟜delta•_while_{𝕊: ' '≢(𝕩-delta)⊑b} p
        v ↩ p2⊑b
      }⍟⊢ v≡' '
      {𝕊: p↩p2}⍟⊢ v≢'#'
    }¨ ↕l
    𝕩
  }¨ <˘⍉[dy, dx]
  p ∾ ¯1⊑da
}

w ← {50≤≠b0? 50; 4}

ds ← ⟨0‿1, 1‿0, 0‿¯1, ¯1‿0⟩

bs ← (w/¨↕¨ w÷˜≢b0)⊔b0
bh ← ' '≠⊑¨bs
be ← @¨ bh
Fold ← { vs‿p:
  be vs⌾(p⊸⊑)↩
  p2 ← p<⊸+ ds # right down left up
  h2 ← p2 {𝕩≡0? 0; (@≡𝕨⊑be)∧𝕨⊑bh}¨ ∧´¨ (p2≥0) ∧ p2<<≢bs
  (h2/↕4) {
    ds ← 𝕨⊑⟨1‿0,2‿0,0‿1,0‿2⟩ # move all vertices by the delta between the selected of these
    vs2 ← vs+<-´ds⊏vs
    vs2 {¯1⌈1⌊𝕩×<¯1⋆(∧´1=|𝕩)∧=´𝕩}⌾(({⊑3∊|𝕩}¨vs2)⊸/)↩ # actual fold crappy magic
    Fold ⟨vs2, p+𝕩⟩
  }¨ h2/ds
}
Fold ⟨¯1+2×⟨0‿0‿0, 1‿0‿0, 0‿1‿0, 1‿1‿0⟩, ⊑MDSlash bh⟩

# •Show >¨ be
# •Show {@:@;∾˘´<˘2‿1‿0⍉('0'+↕4)⌾((𝕩⊐˜⌽⥊¯1⋆↕2‿2‿2)⊏⥊) 2‿2‿2⥊' '}¨ be
Translate ← { d0 𝕊 p0:
  e0 ← d0⊑⟨1‿3, 3‿2, 2‿0, 0‿1⟩
  e0v ← e0 ⊏ p0⊑be
  p1 ← ⋈⁼ (MDSlash{@:0; ∧´e0v∊𝕩}¨ be) (¬∘∊/⊣) ⋈p0
  e1 ← e0v⊐˜p1⊑be
  d1 ← ⊑⟨0‿2,1‿0,3‿1,2‿3⟩⊐< e1
  # •Show ⟨d1, p1, '0'+e1⟩
  d1‿p1
}
# •Show ⍷⥊2⊑¨(↕4) Translate⌜ MDSlash bh

wp ← w-1

•Show Password {
  p ← p0
  d ← 3
  l { l𝕊dd:
    d ↩ 4|d+dd
    { 𝕊:
      # •Show p∾d
      # pv←⊑⟜">∨<∧"⊑d ⋄ b2 pv⌾((+´p×1«≢b2)⊑⥊)↩
      
      p1 ← (d⊑ds)+p
      d1 ← d
      { 𝕊:
        pb0 ← ⌊w÷˜p-1
        pwy‿pwx ← w|p-1
        off ← d ⊑ ⟨pwy,wp-pwx,wp-pwy,pwx⟩
        # •Show "rot from "∾•Repr ⟨d, p, pb0, off⟩
        
        d2‿pb2 ← d Translate pb0
        off ↩ wp-off
        
        d1 ↩ d2
        p1 ↩ 1 + (w×pb2) + d2⊑⟨⟨wp-off,0⟩, ⟨0,off⟩, ⟨off,wp⟩, ⟨wp,wp-off⟩⟩
        # •Show "rot to "∾•Repr ⟨d2, p1, pb2, off⟩
      }⍟⊢ ' '≡p1⊑b
      {𝕊: p↩p1 ⋄ d↩d1}⍟⊢ '#'≢p1⊑b
    }¨ ↕l
    𝕩
  }¨ ¯1⋆dc='L'
  p ∾ d
}
# •Show b{𝕩≡' '?𝕨;𝕩}¨b2