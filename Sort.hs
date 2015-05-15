import qualified Data.Vector.Generic.Mutable as M
import qualified Data.Vector.Unboxed as U
import System.Random
import System.CPUTime -- timer

qsort :: U.Vector Int -> U.Vector Int
qsort = U.modify go
  where go xs | M.length xs < 2 = return ()
              | otherwise = do
                  p <- M.read xs (M.length xs `div` 2)   -- get value of number in middle
                  j <- M.unstablePartition (< p) xs      -- split list in place about p, return split index
                  let (l, pr) = M.splitAt j xs           -- conceptually split list
                  k <- M.unstablePartition (== p) pr     -- drop duplicates from right list
                  go l                                   -- recurse
                  go $ M.drop k pr

main :: IO ()
main = do l <- sequence $ map (const $ getStdRandom(randomR (1,1000000))) [1..1000000 :: Int] :: IO [Int]
          s <- getCPUTime
          let v = U.fromList l
          print $ (qsort v) `seq` "done"
          e <- getCPUTime
          putStrLn $ show (fromIntegral (e - s) / 1000000000000) ++ " seconds"
