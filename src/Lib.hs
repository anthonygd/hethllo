{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc ) where

-- import qualified Data.Text

import           Network.Ethereum.Web3
import           Network.Ethereum.Web3.Types
import qualified Network.Ethereum.Web3.Eth as Eth
import           Network.Ethereum.Web3.Provider

import           Network.HTTP.Client (newManager, defaultManagerSettings)
import           Network.HTTP.Client.TLS (tlsManagerSettings)

infura = "https://mainnet.infura.io/v3/4ed4cb43721d412e80a6cea40e978dd2"
localhost = "http://localhost:33444"

someFunc :: IO ()
someFunc = do

    let settings = tlsManagerSettings
        a = "0x5AFEB55f7De7eB2B3E4a09e0703D2289533FA008"

    manager <- newManager tlsManagerSettings

    ret <- runWeb3With manager (HttpProvider localhost) $ do
        acct <- head <$> Eth.accounts
        bal <- Eth.getBalance acct Latest

        return bal

    case ret of
        Left e -> error $ show e
        Right m -> putStrLn $ show m
