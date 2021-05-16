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
