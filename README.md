<div align="center">

![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC

![GitHub last commit](https://img.shields.io/github/last-commit/adithya-s-sekhar/advanced-youtube-client-ayc?style=paper)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/adithya-s-sekhar/advanced-youtube-client-ayc?style=paper)
![GitHub all releases](https://img.shields.io/github/downloads/adithya-s-sekhar/advanced-youtube-client-ayc/total?style=paper)

Advanced Youtube Client - AYC is a portable lightweight youtube downloader written using windows batch commands based on youtube-dl.
You can call it a console front end if you want.

![512](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/screens.png)

</div>

## Notes

- AYC started it's life on Sourceforge in 2016, it's only been on Github since 2021. Part of old releases are available on the [Sourceforge page](https://sourceforge.net/projects/advanced-youtube-client-ayc/) and the complete archive is on [MEGA](https://mega.nz/file/C1twUaTL#driG0QyWgUpxnR_okhrZxns2CA5ym8GGirLRCx4uzjk) and [Telegram](https://t.me/advancedyoutubeclientayc). Be adviced most AVs will trigger due to early releases being batch scripts compiled to exe's.
-  AYC **is compatible with the Windows Terminal but** it does not support custom window sizes. So it will not look good. Don't change `Windows Console Host` as [default terminal application](https://www.howtogeek.com/738631/how-to-make-windows-terminal-your-default-terminal-app/) if you want it to look good.
-  Some people noticed it won't start as admin? AYC doesn't need admin permissions please open it in a regular folder instead of some where which needs admin permissions. Even a folder on your desktop is fine.

## Table of Contents

- [Planned Items](#planned)
- [Features](#features)
- [Downloads](#downloads)
- [Source and Building](#source-and-building)
- [Tips](#tips)
  - [Shortcut Trick](#1-shortcut-trick)
- [Links](#links)

## Planned Items

- Teenage code. Rewrite this properly with proper error handling.

## Features

- Download 8K, 4K, 2K, 1080p, 720p, 480p, 360p videos with audio.
- Supports AV1 with HDR, VP9 for 1440p and above resolutions.
- Playlist Downloader with resume capabilities.
- MP3, M4A Audio Downloader with Cover Art.
- Compatible with Windows Vista/7/8/8.1/10/11 (32/64-bit).
- Light on CPU Resources as it runs solely on CMD.
- Written as a Windows Batch file so you can edit the source code and make your own Youtube Downloader.
- Universal Mode - Download from any websites.
- Batch Download Jobs.
- Updater for yt-dlp (fork of [youtube-dl](https://youtube-dl.org)).

## Downloads

**See Source and Building below to make your own binary if you are not comfortable with a batch file.**

**Or use [this trick](#1-shortcut-trick) to make windows treat AYC as an exe.**

  - [Download from website](https://advanced-youtube-client-ayc.sourceforge.io)
  - [Download from releases](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases) 
  
Microsoft Defender will show a one-time warning before you try to start a batch file downloaded from the internet. You need to press **More info** and click **Run Anyway** for it to go away.

## Source and Building

AYC used to be compiled with [Bat-To-Exe-Converter](https://www.majorgeeks.com/files/details/bat_to_exe_converter.html) by Faith Kodak ([GitHub](https://github.com/99fk)/[f2ko.de](https://f2ko.de/programme/bat-to-exe-converter/)). ([IPFS Mirror](http://ipfs.io/ipfs/QmPBp7wBSC9GukPUcp7LXFCGXBvc2e45PUfWUbCJzuLG65))

1. Download AYClient.bat.
2. Open the file with notepad and replace all instances of AYClient.bat to AYClient.exe using the replace tool.
3. Open the file in Bat To Exe Converter, you can [add an icon](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/main/ayc.ico?raw=true) if you want.
4. Compile.
5. You need [ffmpeg.exe](https://github.com/yt-dlp/FFmpeg-Builds/releases), [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases), atomicparsley.exe ([32-bit](https://sourceforge.net/projects/atomicparsley)/[64-bit](https://github.com/wez/atomicparsley/releases)) and [aria2c.exe](https://github.com/aria2/aria2/releases/latest) in the same folder as the compiled binary.
6. Start AYClient.exe and it will create the necessary files for further execution.

## Tips

### 1. Shortcut Trick

You can make Windows treat AYClient.bat as an .exe file and have all the goodies (able to pin to taskbar, have an icon..)
1. Create a shortcut for AYClient.bat
2. Right click, choose **Properties** >**Shortcut** Tab.
3. The **Target** box will have your path auto filled. Add `cmd.exe /c ` before the start of the path.
4. Example: If target is `"C:\Users\Joe\AYClient.bat"`, change it to `cmd.exe /c "C:\Users\Joe\AYClient.bat"`.
5. You can also [pick an icon](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/main/ayc.ico?raw=true) using the **Change Icon** button.

## Links

[Website](https://advanced-youtube-client-ayc.sourceforge.io)

[Updates and Discuss on Telegram](https://t.me/advancedyoutubeclientayc)

[Project on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc)

[Seen on VideoHelp](https://www.videohelp.com/software/Advanced-Youtube-Client-AYC)

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[yt-dlp/ffmpeg](https://github.com/yt-dlp/FFmpeg-Builds)

[AtomicParsley](https://github.com/wez/atomicparsley)

[AtomicParsley 32-bit](https://sourceforge.net/projects/atomicparsley)

[aria2](https://github.com/aria2/aria2)
