module Main where

import Lib

main :: IO ()
main = printFile "/home/maex/projects/own/cat/app/Main.hs"

printFile :: FilePath -> IO ()
printFile filePath = do 
    content <- readFile filePath
    putStr content
