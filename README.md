![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC
Advanced Youtube Client - AYC is a lightweight youtube downloader written using windows batch commands based on youtube-dl.
You can call it a console front end if you want.

[Project and screenshots on sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc/)

[Website](https://advanced-youtube-client-ayc.sourceforge.io/)

## Features

- Download 8K, 4K, 2K, 1080p, 720p, 480p, 360p videos with audio.
- Supports AV1 with HDR, VP9 for 1440p and above resolutions.
- Playlist Downloader with resume capabilities.
- MP3, M4A Audio Downloader with Cover Art.
- Compatible with Windows Vista/7/8/8.1/10 (32/64-bit).
- Light on CPU Resources as it runs solely on CMD.
- Programmed as a Windows Batch file so you can edit the source code and make your own Youtube Downloader.
- Universal Mode - Download from any websites.
- Batch Download Jobs.
- Updater for youtube-dl.

## Downloads
### Installer.exe/Portable.zip

  - [Download from website](https://advanced-youtube-client-ayc.sourceforge.io)
  - [Download from releases](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases) 
    
Start AYClient.exe after installation, I'll add a full documentation soon.

## Source and Building

### Compiling
AYC is compiled with [Bat-To-Exe-Converter](https://github.com/adithya-s-sekhar/Bat-To-Exe-Converter-Installer-Portable).

1. Download AYClient.bat or AYClient-Portable.bat depending on your need.
2. Open the file with notepad and replace all instances of AYClient.bat to AYClient.exe using the replace tool.
3. Open the file in Bat To Exe Converter, you can add an icon if you want.
4. Compile.
5. You need [ffmpeg.exe](https://github.com/AnimMouse/ffmpeg-stable-autobuild/), [youtube-dl.exe](https://youtube-dl.org) and [AtomicParsley](https://sourceforge.net/projects/atomicparsley/files/) in the same folder as the compiled binary.
6. Start AYClient.exe and it will create the necessary files for further execution.

### Running the batch file itself
Running AYC as a live batch file can help you tweak it to your needs. Or if you don't trust the binaries.

1. Download AYClient-Portable.bat, the regular one needs an AppData folder.
2. Create a folder with any name anywhere, on a USB stick or your hard disk.
3. Rename AYClient-Portable.bat to AYClient.bat and copy to the created folder.
4. Also have [ffmpeg.exe](https://github.com/AnimMouse/ffmpeg-stable-autobuild/), [youtube-dl.exe](https://youtube-dl.org) and [AtomicParsley](https://sourceforge.net/projects/atomicparsley/files/) in the folder.\
   Thank you Zeranoe for building ffmpeg for us windows peeps all these years, AYC switched to AnimMouse builds since Dec 2020.
5. Start AYClient.bat and it'll create the necessary files for further execution.
