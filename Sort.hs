import qualified Data.Vector.Generic.Mutable as M
import qualified Data.Vector.Unboxed as U
import System.Random
import System.CPUTime -- timer

qsort :: (U.Unbox a, Ord a) => U.Vector a -> U.Vector a
qsort = U.modify go
  where go xs | M.length xs < 2 = return ()
              | otherwise = do
                  n <- M.read xs (M.length xs `div` 2)
                       -- arbitrarily pick partition as middle element
                  p <- M.unstablePartition (< n) xs
                       -- split list in place about n, return split index
                       -- uses same algorithm as qsort_miles.c
                  let (l, rWithDups) = M.splitAt p xs
                       -- conceptually split list
                  ns <- M.unstablePartition (== n) rWithDups
                       -- drop copies of n from right list
                  go l -- recurse
                  go $ M.drop ns rWithDups

main :: IO ()
main = do v  <- U.replicateM 1000000 (getStdRandom(randomR (1,1000000 :: Int)))
          s <- getCPUTime
          print $ qsort v  `seq` "done"
          e <- getCPUTime
          putStrLn $ show (fromIntegral (e - s) / 1000000000000) ++ " seconds"
