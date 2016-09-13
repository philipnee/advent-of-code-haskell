module Paths_day4 (
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
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/pnee/scratch/haskell/day_4/day4/.stack-work/install/x86_64-osx/lts-6.17/7.10.3/bin"
libdir     = "/Users/pnee/scratch/haskell/day_4/day4/.stack-work/install/x86_64-osx/lts-6.17/7.10.3/lib/x86_64-osx-ghc-7.10.3/day4-0.1.0.0-0EmwxBTq5tJKsmWWKb3xe2"
datadir    = "/Users/pnee/scratch/haskell/day_4/day4/.stack-work/install/x86_64-osx/lts-6.17/7.10.3/share/x86_64-osx-ghc-7.10.3/day4-0.1.0.0"
libexecdir = "/Users/pnee/scratch/haskell/day_4/day4/.stack-work/install/x86_64-osx/lts-6.17/7.10.3/libexec"
sysconfdir = "/Users/pnee/scratch/haskell/day_4/day4/.stack-work/install/x86_64-osx/lts-6.17/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "day4_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "day4_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "day4_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "day4_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "day4_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
