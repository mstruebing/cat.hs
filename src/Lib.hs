module Lib
    ( printFile
    , printFileWithLineNumbers
    ) where

printFile :: FilePath -> IO ()
printFile filePath = readFile filePath >>= putStr

printFileWithLineNumbers :: FilePath -> IO ()
printFileWithLineNumbers filePath = readFile filePath >>= mapM_ (\x -> putStrLn $ (show $ fst x) ++ "\t" ++ snd x) . generateNumberedList

generateNumberedList :: String -> [(Int, String)]
generateNumberedList = zip [1 ..] . lines
