import Control.Monad

data Shape = Circle Float Float Float | Rectangle Float Float Float



main = do
  colors <- forM[1..4](\a -> do
    putStrLn $ "which color do hyou assosiciate with the number" ++ show a ++" ?"
    color <- getLine
    return color)
  putStrLn "the colors that are assosicated with 1,2,3,4 are: "
  mapM putStrLn colors