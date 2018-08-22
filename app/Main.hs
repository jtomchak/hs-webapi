{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Web.Scotty
import Data.Monoid ((<>))
import Data.Text.Lazy as T



routes :: ScottyM ()
routes = do
    get "/hello/:name" $ do
        name <- param "name"
        text (greeting name)


greeting :: Text -> Text
greeting n = 
    "Hello " <> n <> "!"

main = do
    putStrLn "Starting webserver........"
    scotty 3000 routes
