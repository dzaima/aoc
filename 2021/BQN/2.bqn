#!/usr/bin/env cbqn
Sq ← •internal.Squeeze
l ← •FLines ≠◶"2.in"‿⊑ •args
t ← Sq ⊑¨l
m ← Sq '0'-˜¯1⊑¨l

f ← 'f'=t
d ← (t='d')-t='u'
a ← +`m×d
p ← +´f×m
•Show p × ¯1⊑a
•Show p × +´m×a×f
