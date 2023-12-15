# In-Chapter Exercises

## Equivalence

alpha equivalence (λx.x <=> λa.a)

1. λxy.xz = λmn.mz (b)
2. λxy.xxy = λx.(λy.xxy) = λa.(λb.aab) (c)
3. λxyz.zx = λx.(λy.(λz.zx)) (a)

# Chapter Exercises

## Combinators

Are the following combinators (i.e. all variables appearing in body appear in head)?

1. λx.xxx - y
2. λxy.zx - n
3. λxyz.xy(zx) = λx.(λy.(λz.xy)) (zx) - y
4. λxyz.xy(zxy) = λx.(λy(λz.xy)) (zxy) - y
5. λxy.xy(zxy) = λx.(λy.xy) (zxy) - n

## Normal or diverge?

Determine if each of the following can be reduced to a normal form or if they diverge.

1. λx.xxx - normal
2. (λz.zz)(λy.yy) = [z := λy.yy] = (λy.yy)(λy.yy) = (λz.zz)(λy.yy) {alpha equivalence} - diverge
3. (λx.xxx)z = [x := z] = zzz - normal

## Beta reduce

Evaluate (that is, beta reduce) each of the following expressions to normal form.
(λx.x)a = [ x:= a] = a

1. (λabc.cba)zz(λwv.w) = (λa.(λb.(λc.cba)))zz(λw.(λv.w)) = [a:=z] = [b:=z] = (λc.czz)(λw.(λv.w)) = [c := λw.(λv.w)]
   = (λw.(λv.w)) zz = [w := z] = (λv.z) z => z

<!-- 2. (λx.λy.xyy)(λa.a)b = [x := λa.a] = (λy.(λa.ayy))b = [y := b] = λa.abb  WRONG -->

2. (λx.λy.xyy)(λa.a)b = [x := λa.a] = (λy.(λa.a)yy) b = [y := b] = (λa.a) bb => bb

3. (λy.y)(λx.xx)(λz.zq) = [y := λx.xx] = (λx.xx)(λz.zq) = [x := λz.zq] = (λz.zq)(λw.wq) {alpha} = [z := λw.wq]
   = (λw.wq)q = qq

4. (λz.z)(λz.zz)(λz.zy) = (λa.a)(λb.bb)(λc.cy) {alpha} = (λb.bb)(λc.cy) = (λc.cy)(λd.dy) = yy

<!-- 5. (λx.(λy.xyy))(λy.y)y = [x := λy.y] = (λy.(λy.yyy))y = λy.yyy WRONG -->

5. (λx.(λy.xyy))(λy.y)y = [x := λy.y] = (λy.(λy.y)yy)y = (λy.y) yy = yy

6. (λa.aa)(λb.ba)c = (λb.ba)(λx.xa)c = [b := λx.xa] = (λx.xaa) c = caa

<!-- 7. (λx.(λy.(λz.xz(yz)))) (λx.z) (λx.a) = [z := yz] = (λx.(λy.(xyz))) (λx.z) (λx.a) = [x := λx.z] = (λy.(λx.zyz)) (λx.a) -->
<!--                                        = [y := λx.a] = λx.λx.azz -->

7. (λxyz.xz(yz)) (λx.z) (λx.a) = (λx.λy.λz.xz(yz)) (λx.z) (λx.a)
   = [x := λx.z] = (λy.λz.(λx.z')z(yz)) (λx.a)
   = [y := λx.a] = (λz.(λx.z')z((λx.a)z))
   = [x := z] {twice} = (λz.z'a)
