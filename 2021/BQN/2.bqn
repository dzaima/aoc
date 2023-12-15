#!/usr/bin/env bqn
l ← •FLines ≠◶"2.in"‿⊑ •args
t ← ⊑¨l
m ← '0'-˜¯1⊑¨l

f ← 'f'=t
d ← (t='d')-t='u'
a ← +`m×d
p ← +´f×m
•Show p × ¯1⊑a
•Show p × +´m×a×f
