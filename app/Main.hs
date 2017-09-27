module Main where

import Lib (printFile, printFileWithLineNumbers)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    let lineNumbers = length (filter (== "-n") args) > 0
    let files = filter (/= "-n") args
    if lineNumbers then
        mapM_ printFileWithLineNumbers files
    else
        mapM_ (\file -> printFile file) files
