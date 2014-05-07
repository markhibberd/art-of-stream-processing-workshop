{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedStrings #-}
module Art.Pipes where

import           Control.Applicative
import           Control.Monad
import           Control.Lens
import           Control.Monad.Trans.State
import qualified Control.Foldl as L

import           Data.Char
import qualified Data.Text as DT
import           Data.Monoid


import           Pipes
import qualified Pipes.Prelude as P
import qualified Pipes.ByteString as BS
import           Pipes.Text (FreeT (..), Text)
import qualified Pipes.Text as T
import qualified Pipes.Text.IO as T
import           Pipes.Group

import           System.Environment
import           System.Exit

main :: IO ()
main = getArgs >>= \args -> case args of
  ["cat"]   -> undefined
  ["wc"]    -> undefined
  _         -> putStrLn "usage: art-pipes COMMAND" >> exitFailure
