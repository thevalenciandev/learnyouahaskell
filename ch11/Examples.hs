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
