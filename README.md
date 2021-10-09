![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC
Advanced Youtube Client - AYC is a portable lightweight youtube downloader written using windows batch commands based on youtube-dl.
You can call it a console front end if you want.

[Project and screenshots on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc/)

[Website](https://advanced-youtube-client-ayc.sourceforge.io/)

![GitHub last commit](https://img.shields.io/github/last-commit/adithya-s-sekhar/advanced-youtube-client-ayc?style=flat)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/adithya-s-sekhar/advanced-youtube-client-ayc?style=flat)
![GitHub all releases](https://img.shields.io/github/downloads/adithya-s-sekhar/advanced-youtube-client-ayc/total?style=flat)

## Table of Contents

- [Planned Items](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#planned)
- [Features](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#features)
- [Downloads](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#downloads)
- [Source and Building](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#source-and-building)
- [Tips](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#tips)
  - [Shortcut Trick](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#1-shortcut-trick)

## Planned Items

- Teenage code. Rewrite this properly with proper error handling.

## Features

- Download 8K, 4K, 2K, 1080p, 720p, 480p, 360p videos with audio.
- Supports AV1 with HDR, VP9 for 1440p and above resolutions.
- Playlist Downloader with resume capabilities.
- MP3, M4A Audio Downloader with Cover Art.
- Compatible with Windows Vista/7/8/8.1/10 (32/64-bit).
- Light on CPU Resources as it runs solely on CMD.
- Written as a Windows Batch file so you can edit the source code and make your own Youtube Downloader.
- Universal Mode - Download from any websites.
- Batch Download Jobs.
- Updater for yt-dlp (fork of [youtube-dl](https://youtube-dl.org)).

## Downloads

**See Source and Building below to make your own binary if you are not comfortable with a batch file.**

**Or use [this trick](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc#1-shortcut-trick) to make windows treat AYC as an exe.**

  - [Download from website](https://advanced-youtube-client-ayc.sourceforge.io)
  - [Download from releases](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases) 
  
Microsoft Defender will show a one-time warning before you try to start a batch file downloaded from the internet. You need to press **More info** and click **Run Anyway** for it to go away.

## Source and Building

AYC used to be compiled with [Bat-To-Exe-Converter](https://www.majorgeeks.com/files/details/bat_to_exe_converter.html) by Faith Kodak ([GitHub](https://github.com/99fk)/[f2ko.de](https://f2ko.de/programme/bat-to-exe-converter/)). ([IPFS Mirror](http://ipfs.io/ipfs/QmPBp7wBSC9GukPUcp7LXFCGXBvc2e45PUfWUbCJzuLG65))

1. Download AYClient.bat.
2. Open the file with notepad and replace all instances of AYClient.bat to AYClient.exe using the replace tool.
3. Open the file in Bat To Exe Converter, you can [add an icon](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/main/ayc.ico?raw=true) if you want.
4. Compile.
5. You need [ffmpeg.exe](https://github.com/AnimMouse/ffmpeg-stable-autobuild/releases), [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases) and [atomicparsley.exe](https://github.com/wez/atomicparsley/releases) in the same folder as the compiled binary.
6. Start AYClient.exe and it will create the necessary files for further execution.

## Tips

### 1. Shortcut Trick

You can make Windows treat AYClient.bat as an .exe file and have all the goodies (able to pin to taskbar, have an icon..)
1. Create a shortcut for AYClient.bat
2. Right click, choose **Properties** >**Shortcut** Tab.
3. The **Target** box will have your path auto filled. Add `cmd.exe /c ` before the start of the path.
4. Example: If target is `"C:\Users\Joe\AYClient.bat"`, change it to `cmd.exe /c "C:\Users\Joe\AYClient.bat"`.
5. You can also [pick an icon](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/main/ayc.ico?raw=true) using the **Change Icon** button.

## Credits

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[FFmpeg Stable Autobuilds for Windows](https://github.com/AnimMouse/ffmpeg-stable-autobuild/)

[AtomicParsley](https://github.com/wez/atomicparsley)
