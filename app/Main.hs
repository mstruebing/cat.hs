module Main where

import Lib (printFile, printFileWithLineNumbers, printHelp)
import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    if shouldPrintHelp args then printHelp else do
        let files = filter (/= "-n") args
        if lineNumbers args then
            mapM_ printFileWithLineNumbers files
        else
            mapM_ (\file -> printFile file) files
        where
            lineNumbers args = length (filter (== "-n") args) > 0
            shouldPrintHelp args = length args == 0 || length args > 0 && (elem "-h" args || elem "--help" args)
