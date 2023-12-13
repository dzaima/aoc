#!/usr/bin/env cbqn
⟨Ints⟩ ← •Import "../../utils/utils.bqn"
l ← •FChars ≠◶"12.in"‿⊑ •args

cN‿cS‿cE‿cW‿cL‿cR‿cF ← ↕7
cmd ← {(≠𝕩)⊸≠⊸/ 𝕩⊐l} "NSEWLRF"
am ← Ints l

go ← (cmd=cF) ∨ cmd≤cW
constRot ← cN‿cE‿cS‿cW⊐cmd
varRot ← 4|+`90÷˜(am×cmd=cR)-am×cmd=cL

isFwd   ← cmd=cF
isConst ← cmd≤cW

rd ← ⟨0‿¯1, 1‿0, 0‿1, ¯1‿0⟩

#    -y
#     N
# -x W E +x
#     S
#    +y

{
  rot ← (isFwd×4|1+varRot) + constRot×isConst
  •Show +´| +´ rd×+´¨ 4↑rot⊔am×go
}

{
  rdx ← 0⊑¨rd
  rdy ← 1⊑¨rd
  
  wpRot ← 4|constRot-varRot # direction of north
  
  mvWp ← am×isConst
  wpVX ← 10+`mvWp × wpRot⊏rdx # virtual waypoint position, as if there were no rotations
  wpVY ← ¯1+`mvWp × wpRot⊏rdy
  
  mvShop ← am×isFwd
  dVX ← mvShop×wpVX # delta position pre-unrotation
  dVY ← mvShop×wpVY
  
  unrotN ← 4|2-varRot
  unrotE ← 4|1-varRot
  fx ← +´+´⟨unrotN⊏rdx, unrotN⊏rdy⟩×dVX‿dVY
  fy ← +´+´⟨unrotE⊏rdx, unrotE⊏rdy⟩×dVX‿dVY
  •Show fx+○|fy
}