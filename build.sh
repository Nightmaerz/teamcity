#! /bin/sh


echo "Attempting to build asdf1234 for Windows"
/home/jordie/Unity-2018.2.5f1/Editor/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile $(pwd)/unitywindows.log \
  -projectPath="$(pwd)/asdf1234" \
  -buildWindowsPlayer "$(pwd)/windows/windows.exe"  \
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
  -logFile $(pwd)/unitylinux.log \
  -projectPath="$(pwd)/asdf1234" \
  -buildLinuxUniversalPlayer "$(pwd)/linux/linux" \
  -quit

echo 'Logs from build'
cat $(pwd)/unitylinux.log
cat $(pwd)/unitywindows.log


echo 'Attempting to zip builds'
echo $(pwd)
zip -r $(pwd)/linux.zip $(pwd)/linux
#zip -r $(pwd)/asdf/Build/mac.zip $(pwd)/asdf/Build/osx/
zip -r $(pwd)/windows.zip $(pwd)/windows
