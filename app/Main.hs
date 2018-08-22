{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Web.Scotty


routes :: ScottyM ()
routes = do
    get "/hello" $ do
        text "Hello World!"

main = do
    putStrLn "Starting webserver........"
    scotty 3000 routes
