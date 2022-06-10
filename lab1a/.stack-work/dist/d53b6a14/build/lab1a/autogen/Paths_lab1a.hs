{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_lab1a (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Surface\\Desktop\\Paradigms\\lab1a\\.stack-work\\install\\97fa129a\\bin"
libdir     = "C:\\Users\\Surface\\Desktop\\Paradigms\\lab1a\\.stack-work\\install\\97fa129a\\lib\\x86_64-windows-ghc-9.0.2\\lab1a-0.1.0.0-9NxR7knU8SXCQK3Q05KIj2-lab1a"
dynlibdir  = "C:\\Users\\Surface\\Desktop\\Paradigms\\lab1a\\.stack-work\\install\\97fa129a\\lib\\x86_64-windows-ghc-9.0.2"
datadir    = "C:\\Users\\Surface\\Desktop\\Paradigms\\lab1a\\.stack-work\\install\\97fa129a\\share\\x86_64-windows-ghc-9.0.2\\lab1a-0.1.0.0"
libexecdir = "C:\\Users\\Surface\\Desktop\\Paradigms\\lab1a\\.stack-work\\install\\97fa129a\\libexec\\x86_64-windows-ghc-9.0.2\\lab1a-0.1.0.0"
sysconfdir = "C:\\Users\\Surface\\Desktop\\Paradigms\\lab1a\\.stack-work\\install\\97fa129a\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lab1a_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lab1a_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "lab1a_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "lab1a_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lab1a_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lab1a_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
