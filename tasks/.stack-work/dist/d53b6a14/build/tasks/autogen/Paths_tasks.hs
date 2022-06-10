{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_tasks (
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

bindir     = "C:\\Users\\Surface\\Desktop\\Paradigms\\tasks\\.stack-work\\install\\b52c8f66\\bin"
libdir     = "C:\\Users\\Surface\\Desktop\\Paradigms\\tasks\\.stack-work\\install\\b52c8f66\\lib\\x86_64-windows-ghc-9.0.2\\tasks-0.1.0.0-4gsdZQODwA3AgeBioneaX-tasks"
dynlibdir  = "C:\\Users\\Surface\\Desktop\\Paradigms\\tasks\\.stack-work\\install\\b52c8f66\\lib\\x86_64-windows-ghc-9.0.2"
datadir    = "C:\\Users\\Surface\\Desktop\\Paradigms\\tasks\\.stack-work\\install\\b52c8f66\\share\\x86_64-windows-ghc-9.0.2\\tasks-0.1.0.0"
libexecdir = "C:\\Users\\Surface\\Desktop\\Paradigms\\tasks\\.stack-work\\install\\b52c8f66\\libexec\\x86_64-windows-ghc-9.0.2\\tasks-0.1.0.0"
sysconfdir = "C:\\Users\\Surface\\Desktop\\Paradigms\\tasks\\.stack-work\\install\\b52c8f66\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "tasks_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tasks_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "tasks_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "tasks_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tasks_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tasks_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
