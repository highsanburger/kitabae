0 := λsz.z
succ := λwxy.x(wxy)

succ(0) = (λwxy.x(wxy)) (λsz.z)
        = (λw.λx.λy.x(wxy)) (λs.λz.z)  [w := λsz.z]
        = (λx.λy.x((λs.λz.z)xy))       [s := x]
        = (λx.λy.x(λz.z)y)             [z := y]
        = (λx.(λy.x(y)))               
        = λsz.s(z) := 1 

succ(1) = (λwxy.x(wxy)) (λsz.s(z)) 
        = (λw.(λx.(λy.(x(wxy))))) (λs.(λz.s(z))) [w := λsz.s(z)]
        = (λx.(λy.(x((λs.(λz.s(z)))xy))))        [s := x]
        = (λx.(λy.(x((λz.x(z))y))))              [z := y]
        = (λx.(λy.(x(x(y)))))
        = λsz.s(s(z)) := 2

1 + 2 = (λsz.s(z)) (λwxy.x(wxy)) (λab.a(a(b)))  --> (1)
(λsz.s(z)) (λwxy.x(wxy)) = (λz.(λwxy.x(wxy))(z))
                         = (λz.(λxy.x(zxy)))
                         = λzxy.x(zxy) = succ()
Hence, (1) : 1 + 2 = succ(2) = 3

multiplication := (λxyz.x(yz))

2 x 2 = (λxyz.x(yz))2 2 = (λz.2(2z))
      = (λz.(λx.λy.x(x(y))) (λa.(λb.a(a(b)))z) )
      = (λz.(λx.(λy.x(x(y)))) (λb.z(z(b))) ) 
      = (λz.(λy.(λb.z(z(b))) ((λb.z(z(b)))(y)))  ) 
      = (λz.(λy.(λb.z(z(b))) (z(z(y))))  ) 
      = (λz.(λy.(z(z(z(z(y))))))) := 4

true  = λxy.x ,picks 1st arg
false = λxy.y ,picks 2nd arg

NOT ≡ λx.x(λuv.v)(λab.a) ≡ λx.xFT
AND ≡ λxy.xy(λuv.v) ≡ λxy.xyF
OR ≡ λxy.x(λuv.u)y ≡ λxy.xTy

NOT false = (λx.xFT) (F) = (FFT)
         = (λab.b) (λcd.d) (λef.e)
         = (λb.b) (λef.e)
         = (λef.e) := true
          
NOT true = (λx.xFT) (T) = (TFT) = F

true and true   = (AND) (T)(T) = (λxy.xyF) (T)(T) = TTF = T
true and false  = (AND) (T)(F) = (λxy.xyF) (T)(F) = TFF = F
false and true  = (AND) (F)(T) = (λxy.xyF) (F)(T) = FTF = F
false and false = (AND) (F)(F) = (λxy.xyF) (F)(F) = FFF = F
                
true or true   = (OR) (T)(T) = (λxy.xTy) (T)(T) = TTT = T
true or false  = (OR) (T)(F) = (λxy.xTy) (T)(F) = TTF = T
false or true  = (OR) (F)(T) = (λxy.xTy) (F)(T) = FTT = T
false or false = (OR) (F)(F) = (λxy.xTy) (F)(F) = FTF = F

<!-- Z := λx.xF NOT F -->
<!---->
<!-- 0F = (λfa.a) (λxy.y) = λa.a = I -->
<!-- N =/= 0 -->
<!-- 1F = (λfa.f(a)) (λxy.y) = λa.λxy.y(a) = λay.y = F -->
<!-- therefore NF = F -->
<!---->
<!-- Z0 = (λx.xF NOT F) 0 = 0F NOT F = I NOT F = NOT F = T -->
<!-- ZN = (λx.xF NOT F) N = NF NOT F = F NOT F = I F = F -->
<!---->
<!-- phi ≡ (λpz.z(S(pT))(pT)) -->
<!-- pair (a,b) = λz.zab -->
<!-- pair true = (λz.zab) (T) = (T)ab = a -->
<!-- pair false = (λz.zab) (F) = (F)ab = b -->
<!---->
<!-- phi pair = (λpz.z(S(pT))(pF)) (λz.zab) -->
<!--          = (λz.z(S(a))(b))  -->
<!--          = (a+1,b) -->
<!---->
<!-- P ≡ (λn.n phi(λz.z00)F) -->

recursive Y combinator
Y   ≡ (λy.(λx.y(xx))(λx.y(xx)))
Y R = (λy.(λx.y(xx))(λx.y(xx))) (R)
    = (λx.R(xx))(λa.R(aa))
    = (R(λa.R(aa)(λa.R(aa))))
    = R (YR)



    








