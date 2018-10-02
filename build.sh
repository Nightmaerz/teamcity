#! /bin/sh


echo "Attempting to build asdf1234 for Windows"
/home/jordie/Unity-2018.2.5f1/Editor/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/build/unitywindows.log \
  -projectPath="$(pwd)/Unityproject" \
  -buildWindowsPlayer "$(pwd)/build/windows/windows.exe"  \
  -quit

#echo "Attempting to build $project for OS X"
#/Applications/Unity/Unity.app/Contents/MacOS/Unity \
#  -batchmode \
#  -nographics \
#  -silent-crashes \
#  -logFile $(pwd)/unity.log \
#  -projectPath=$(pwd)/asdf \
#  -buildOSXUniversalPlayer "$(pwd)/asdf/Build/osx/$project.app" \
#  -quit

echo "Attempting to build asdf1234 for Linux"
/home/jordie/Unity-2018.2.5f1/Editor/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/build/unitylinux.log \
  -projectPath="$(pwd)/build/Unityproject" \
  -buildLinuxUniversalPlayer "$(pwd)/build/linux/linux" \
  -quit

echo 'Logs from build'
cat $(pwd)/build/unitylinux.log
cat $(pwd)/build/unitywindows.log


echo 'Attempting to zip builds'
echo $(pwd)
zip -r $(pwd)/build/linux.zip $(pwd)/build/linux
#zip -r $(pwd)/asdf/Build/mac.zip $(pwd)/asdf/Build/osx/
zip -r $(pwd)/build/windows.zip $(pwd)/build/windows
