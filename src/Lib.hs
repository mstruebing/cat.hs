module Lib
    ( printFile
    , printFileWithLineNumbers
    , printHelp
    ) where

printFile :: FilePath -> IO ()
printFile filePath = readFile filePath >>= putStr

printFileWithLineNumbers :: FilePath -> IO ()
printFileWithLineNumbers filePath = readFile filePath >>= mapM_ (\x -> putStrLn $ (show $ fst x) ++ "\t" ++ snd x) . generateNumberedList

generateNumberedList :: String -> [(Int, String)]
generateNumberedList = zip [1 ..] . lines

printHelp :: IO ()
printHelp = do
    putStrLn "USAGE: cat [OPTION] [FILE]"
    putStrLn "    -n         show line numbers"
    putStrLn "    -h, --help show this help text"
