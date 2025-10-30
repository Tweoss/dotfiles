--see if clipboard is a file
set filePath to ""
try
 set clipPath to the clipboard as «class furl»
 set filePath to clipPath as alias
end try
if filePath is not "" then
 set newFile to getFileName("copied")
 do shell script "cp " & quoted form of POSIX path of filePath & ¬
 space & quoted form of POSIX path of newFile
 return --end
end if
--see if clipboard is image data
set jpegDATA to ""
try
 set jpegDATA to the clipboard as JPEG picture
end try
if jpegDATA is not "" then
 set newFile to "/Users/francischua/clipboard_image.jpeg"
 -- to prompt the user for a location use:
 -- set newFile to getFileName("new")
 set theFile to open for access newFile with write permission
 write jpegDATA to theFile
 close access theFile
 -- copy the file to clipboard
 set the clipboard to (POSIX file newFile)
 return --end
end if
-- beep 1
display dialog ¬
 "No file or image data found on the clipboard." with icon ¬
 note buttons {"Whatever ¯\\_(ツ)_/¯ "} default button 1
on getFileName(type)
 choose file name with prompt ¬
 "Select a name and location for the " & type & ¬
 " jpeg:" default location (path to desktop) default name ¬
 type & ".jpg"
end getFileName
