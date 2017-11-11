--畢氏三組數
module Pytha
( checkP, pytha,
    next) where


checkP (a,b,c) = a^2 + b^2 == c^2
pytha (a,b) = (a^2 - b^2, 2*a*b, a^2 + b^2)

next (a,b) | b >= a      = error "b is not smaller than a"
           | b == a-1   = (a+1, 1)
           | otherwise  = (a, b+1)