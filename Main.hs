module Main where

import qualified Lib.Quicksort
import qualified Lib.Remove_Duplicates
import qualified SDR.SDR
import qualified Layer.Layer
import qualified Collumn.Collumn

import System.IO
import System.Exit

print_welcome = do
    putStrLn "HTM-Modular  Copyright (C) 2018  Joris Gutjahr "
    putStrLn "This program comes with ABSOLUTELY NO WARRANTY "
    putStrLn "This is free software, and you are welcome to redistribute it"
    putStrLn "under certain conditions; type `:license` for details."

print_license = do
    handle <- openFile "LICENSE" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle

apply_command ":license" = print_license
apply_command ":q" = apply_command ":quit"
apply_command ":quit" = exitSuccess

apply_command failure = do
    putStrLn "I didn't implement your feature."
    putStrLn "If you want me to implement your feature"
    putStrLn "Do it yourself!"

command_repl = do
    command <- getLine
    apply_command command 
    command_repl

main = do 
     print_welcome
     command_repl
