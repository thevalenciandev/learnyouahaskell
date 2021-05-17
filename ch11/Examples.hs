import Data.Char
import Data.List

main :: IO ()
main = do line <- getLine
          let line' = reverse line
          displayMsg line'

displayMsg :: String -> IO ()
displayMsg m = do putStrLn $ "You said " ++ m ++ " backwards!"
                  putStrLn $ "Yes, you really said " ++ m ++ " backwards!"

main' :: IO ()
main' = do line <- fmap reverse getLine
           displayMsg line

morefmap = do line <- fmap (intersperse '-'. reverse . map toUpper) getLine
              putStrLn line

-- Applicative examples
-- Different ways of using the <*> Applicative function
-- which "extracts" the fn from a Functor (in this case Monad)
-- and applies it to the value of the next Functor
ex1 :: Maybe Integer
ex1 = Just (*3) <*> Just 3
ex2 :: Maybe Integer
ex2 = pure (*3) <*> Just 3
ex3 :: Maybe String
ex3 = pure (++"YOLO") <*> Just "YO, "
ex4 = Nothing <*> Just "Beurk"
-- Note that all those could have been implemented simply with fmap
ex5 = fmap (*3) (Just 3)
-- But applicatives get useful when applying a fn over multiple Functors
-- They're left-associative
ex6 = pure (+) <*> Just 2 <*> Just 40
ex7 = pure (++) <*> Just "Ha" <*> Just "Ha"
ex8 = (++) <$> Just "johntra" <*> Just "volta"
-- The above is the equivalent to the following non-applicative example
ex9 = (++) "johntra" "volta"
-- Playing with lists now. ex10 is = as ex11
ex10 = [(*1),(*2),(*3)] <*> [1,2,3]
ex11 = [f x | f <-[(*1),(*2),(*3)], x <- [1,2,3]]
-- Multiple args in functions with lists
ex12 = [(+), (*)] <*> [1,2] <*> [3,4]
ex13 = (++) <$> ["ha", "heh", "hmm"] <*> ["?", "!", "."]
-- Now, in applicative style, we get all possible products that are more than 50
ex14 = filter (>50) $ (*) <$> [1,2,3] <*> [50]
