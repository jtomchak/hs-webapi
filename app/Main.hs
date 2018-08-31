{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Main where

import Lib
import GHC.Generics
import Web.Scotty
import Data.Monoid ((<>))
import Data.Text.Lazy as T
import Data.Aeson (FromJSON, ToJSON)

data User = User { userId :: Int, userName :: String} deriving (Show, Generic)
instance ToJSON User
instance FromJSON User

-- Hardcoded user data
bob :: User
bob = User { userId = 1, userName = "Bobby Boy" }

jenny :: User
jenny = User { userId = 2, userName = "Jenny" }

allUsers :: [User]
allUsers = [bob, jenny]

routes :: ScottyM ()
routes = do
    get "/" $ do
        text "hs-webapi"
        
    get "/hello/:name" $ do
        name <- param "name"
        text (greeting name)

    get "/users" $ do
        json allUsers


greeting :: Text -> Text
greeting n = 
    "Hello " <> n <> "!"

main = do
    putStrLn "Starting webserver........"
    scotty 3000 routes
