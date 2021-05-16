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
