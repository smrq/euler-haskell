module P48 where
result = (sum [n^n | n <- [1..1000]]) `mod` 10^10