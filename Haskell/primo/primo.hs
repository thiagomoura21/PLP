-- PLP 2018.2
-- Aluno: Thiago Santos de Moura - 116210967

isPrime :: Int -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n 
  | (length [x | x <- [2 .. n-1], mod n x == 0]) > 0 = False
	| otherwise = True

allPrimosMod :: Int -> Int -> Int
allPrimosMod x y
  | x == 0 = 0
  | (mod x (10 ^ y)) == (mod x (10 ^ (y+1))) = allPrimosDiv x y
  | isPrime (mod x (10 ^ y)) = 1 + allPrimosMod x (y+1)
  | otherwise = allPrimosMod x (y+1)

allPrimosDiv :: Int -> Int -> Int
allPrimosDiv x y
  | x == 0 || y < 0 = 0
  | isPrime (div x (10 ^ y)) = 1 + allPrimosDiv x (y-1)
  | otherwise = allPrimosDiv x (y-1)

main = do

  input <- getLine
  let num = read input
  let primos = allPrimosMod num 1
  print primos

