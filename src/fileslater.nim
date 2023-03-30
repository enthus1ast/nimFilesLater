import os, times

iterator getPathOlderThan*(path: string, olderThan = 60.weeks, yieldFilter = {pcFile, pcDir}): string =
  var curTime = getTime()
  var maxAgeTime = curTime - olderThan
  for path in walkDirRec(path, followFilter = {}, yieldFilter = yieldFilter):
    # echo path, " ", getLastAccessTime(path)
    if getLastAccessTime(path) < maxAgeTime:
      yield path


when isMainModule:
  for path in getPathOlderThan("C:/Users/david/Downloads"):
    echo path