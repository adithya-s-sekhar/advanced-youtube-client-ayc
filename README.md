![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC
## This repo is stil WIP

Advanced Youtube Client - AYC is a lightweight youtube downloader written using windows batch commands based on youtube-dl.

You can call it a console front end if you want.

Project on sourceforge since 2016: https://sourceforge.net/projects/advanced-youtube-client-ayc/

Website: https://advanced-youtube-client-ayc.sourceforge.io/

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

## How to use

### A. Binary

Binaries are compiled with https://github.com/99fk/Bat-To-Exe-Converter-Downloader

#### 1. From releases
https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases

#### 2. From Sourceforge
Older versions are also available: https://advanced-youtube-client-ayc.sourceforge.io

### B. Run source directly.

1. Download AYClient-Portable.bat, the regular one needs an AppData folder which I'll update later.
2. Create a folder with any name anywhere, on a USB stick or your hard disk.
3. Rename AYClient-Portable.bat to AYClient.bat and copy to the creater folder.
4. Also have ffmpeg.exe([32-bit](https://www.notion.so/34dc4ddf501a4b98b46ea9fb4f3470af?v=878345c5d88f4d21a6520db752b5c29f)/[64-bit](https://github.com/BtbN/FFmpeg-Builds/releases)) and [youtube-dl.exe](https://youtube-dl.org) in the folder.
5. Start AYClient.bat and it'll create the necessary files for further execution.
