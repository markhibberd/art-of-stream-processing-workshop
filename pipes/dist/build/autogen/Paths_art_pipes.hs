module Paths_art_pipes (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/mth/home/art-of-stream-processing-talk/pipes/.cabal-sandbox/bin"
libdir     = "/Users/mth/home/art-of-stream-processing-talk/pipes/.cabal-sandbox/lib/x86_64-osx-ghc-7.6.1/art-pipes-0.0.1"
datadir    = "/Users/mth/home/art-of-stream-processing-talk/pipes/.cabal-sandbox/share/x86_64-osx-ghc-7.6.1/art-pipes-0.0.1"
libexecdir = "/Users/mth/home/art-of-stream-processing-talk/pipes/.cabal-sandbox/libexec"
sysconfdir = "/Users/mth/home/art-of-stream-processing-talk/pipes/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "art_pipes_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "art_pipes_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "art_pipes_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "art_pipes_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "art_pipes_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
