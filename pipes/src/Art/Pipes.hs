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
  ["yes"]   -> undefined
  ["head"]   -> undefined
  ["tail"]   -> undefined
  ["grep"]    -> undefined
  ["wcl"]    -> undefined
  ["wc"]    -> undefined
  _         -> putStrLn "usage: art-pipes COMMAND" >> exitFailure


data WordCount = WordCount {
    line :: Int
  , word :: Int
  , char :: Int
  } deriving Show


cat' :: Monad m => Pipe a a m r
cat' =
  error "A direct cat implementation"

fastcat' :: Effect IO ()
fastcat' =
  error "A direct cat implementation"

yes' :: Monad m => Producer Text m r
yes' =
  error "A yes implementation"
