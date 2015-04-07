import System.Random 
import Data.List  

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort smallerequal ++ [x] ++ quicksort greater
    where smallerequal = [e | e <- xs, e <= x]
          greater = [e | e <- xs, e > x]

dpquicksort :: (Ord a) => [a] -> [a]
dpquicksort [] = []
dpquicksort (x:y:xs) = 
    dpquicksort smaller ++ [a] ++ dpquicksort xgteqylteq ++ [b] ++ dpquicksort greater
    where a = min x y
          b = max x y
          smaller = [e | e <- xs, e < a]
          xgteqylteq = [e | e <- xs, e >= a, e <= b]
          greater = [e | e <- xs, e > b]
dpquicksort (x:y) = quicksort (x:y)

randomlist :: Int -> StdGen -> [Int]
randomlist n = take n . unfoldr (Just . random) 

main = do
    seed <- newStdGen 
    let list = randomlist 1000000 seed
    let something = map (`mod` 1000000) list
    let sorted = quicksort something
    print(sorted)
    
    

