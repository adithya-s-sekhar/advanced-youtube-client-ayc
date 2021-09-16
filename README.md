![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC
Advanced Youtube Client - AYC is a portable lightweight youtube downloader written using windows batch commands based on youtube-dl.
You can call it a console front end if you want.

## Planned

- Teenage code. Rewrite this properly with proper error handling.
- ~~Use any other compiler to fix Virus Warnings.~~
  AYC is no longer released as EXE's (blame microsoft) so you don't need to compile it anymore.

[Project and screenshots on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc/)

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

#### See Source and Building below to make your own binary if you are not comfortable with a batch file.
  - [Download from website](https://advanced-youtube-client-ayc.sourceforge.io)
  - [Download from releases](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases) 
  
Microsoft Defender will show a one-time warning before you try to start a batch file downloaded from the internet. You need to press **More info** and click **Run Anyway** for it to go away.

## Source and Building

### Compiling
AYC used to be compiled with [Bat-To-Exe-Converter](https://www.majorgeeks.com/files/details/bat_to_exe_converter.html) by Faith Kodak ([GitHub](https://github.com/99fk)/[f2ko.de](https://f2ko.de/programme/bat-to-exe-converter/)). ([IPFS Mirror](http://ipfs.io/ipfs/QmPBp7wBSC9GukPUcp7LXFCGXBvc2e45PUfWUbCJzuLG65))

1. Download AYClient.bat.
2. Open the file with notepad and replace all instances of AYClient.bat to AYClient.exe using the replace tool.
3. Open the file in Bat To Exe Converter, you can add an icon if you want.
4. Compile.
5. You need [ffmpeg.exe](https://github.com/AnimMouse/ffmpeg-stable-autobuild/releases), [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases) and [atomicparsley.exe](https://github.com/wez/atomicparsley/releases) in the same folder as the compiled binary.
6. Start AYClient.exe and it will create the necessary files for further execution.

## Credits

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[FFmpeg Stable Autobuilds for Windows](https://github.com/AnimMouse/ffmpeg-stable-autobuild/)

[AtomicParsley](https://github.com/wez/atomicparsley)
