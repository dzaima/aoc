#!/usr/bin/env bqn
{
  exp ⇐ ⟨
    ⟨"1",  1019371‿278064990⟩
    ⟨"2",  439‿584⟩
    ⟨"3",  198‿5140884672⟩
    ⟨"4",  222‿140⟩
    ⟨"5",  842‿617⟩
    ⟨"6",  6735‿3221⟩
    ⟨"7",  161‿30899⟩
    ⟨"8",  1816‿1149⟩
    ⟨"9",  57195069‿7409241⟩
    ⟨"10", 2030‿42313823813632⟩
    ⟨"11", 2243‿2027⟩
    ⟨"12", 796‿39446⟩
    ⟨"13", 2045‿402251700208309⟩
    ⟨"14", 10452688630537‿2881082759597⟩
    ⟨"15", 1280‿651639⟩
    ⟨"16", 23044‿3765150732757⟩
    ⟨"17", 295‿1972⟩
    ⟨"18", 21993583522852‿122438593522757⟩
    ⟨"19", 241‿424⟩
    ⟨"20", 174206308298779‿2409⟩
    ⟨"21", 2595‿"thvm,jmdg,qrsczjv,hlmvqh,zmb,mrfxh,ckqq,zrgzf"⟩
    ⟨"22", 35202‿32317⟩
    ⟨"23", "59374826"‿66878091588⟩
    ⟨"24", 317‿3804⟩
    ⟨"25", ⟨18433997⟩⟩
  ⟩
  
  path ⇐ •path
  args ⇐ •args
  all ⇐ •Repr¨ 1+↕25
  most ⇐ (¬∊⟜"15"‿"23")⊸/all
  orig ⇐ ⟨⟩
} •Import "../../utils/test.bqn"
