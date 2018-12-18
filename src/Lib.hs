{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc ) where

import           Network.Ethereum.Web3
import           Network.Ethereum.Web3.Types
import qualified Network.Ethereum.Web3.Eth as Eth

someFunc :: IO ()
someFunc = do
    putStrLn "just a string"
