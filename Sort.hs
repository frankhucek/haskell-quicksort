import qualified Data.Vector.Generic.Mutable as M
import qualified Data.Vector.Unboxed as U
import System.Random
import System.CPUTime -- timer

qsort :: U.Vector Int -> U.Vector Int
qsort = U.modify go
  where go xs | M.length xs < 2 = return ()
              | otherwise = do
                  n <- M.read xs (M.length xs `div` 2)         -- get value of number in middle
                  p <- M.unstablePartition (< n) xs            -- split list in place about n, return split index
                  let (l, rWithDups) = M.splitAt p xs          -- conceptually split list
                  dups <- M.unstablePartition (== n) rWithDups -- drop duplicates from right list
                  go l                                         -- recurse
                  go $ M.drop dups rWithDups

main :: IO ()
main = do l <- mapM (const $ getStdRandom(randomR (1,1000000))) [1..1000000 :: Int]
          s <- getCPUTime
          let v = U.fromList l
          print $ qsort v `seq` "done"
          e <- getCPUTime
          putStrLn $ show (fromIntegral (e - s) / 1000000000000) ++ " seconds"
