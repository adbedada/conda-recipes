mkdir build
cd build

cmake -G "%CMAKE_GENERATOR%" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_INCLUDE_PATH=%LIBRARY_INC% ^
      -D CMAKE_LIBRARY_PATH=%LIBRARY_LIB% ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      ..
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

cmake --build . --config Release --target install 
if errorlevel 1 exit 1

mkdir %LIBRARY_PREFIX%\share\tessdata
cd %LIBRARY_PREFIX%\share\tessdata
curl -L -O "https://github.com/tesseract-ocr/tessdata/raw/3.04.00/eng.traineddata"
curl -L -O "https://github.com/tesseract-ocr/tessdata/raw/3.04.00/osd.traineddata"
