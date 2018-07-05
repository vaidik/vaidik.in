{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.HTTP.Types.Status (status301)
import Data.Text.Lazy (Text)

permanentlyMove :: RoutePattern -> Text -> ScottyM ()
permanentlyMove src dest = get src $ do
    status status301
    setHeader "Location" dest

routes :: ScottyM ()
routes = do
    permanentlyMove "/" "https://medium.com/@vaidikkapoor"
    permanentlyMove "/blog/vagrant-for-development-in-a-service-oriented-architecture.html" ""

main = do
    putStrLn "Starting serveri on localhost:3000..."
    scotty 3000 routes
