<div align="center">

![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC

![GitHub release (latest by date)](https://img.shields.io/github/v/release/adithya-s-sekhar/advanced-youtube-client-ayc?style=flat) ![SourceForge Downloads](https://img.shields.io/sourceforge/dt/advanced-youtube-client-ayc?label=Downloads%20%28Sourceforge%29) ![GitHub all releases](https://img.shields.io/github/downloads/adithya-s-sekhar/advanced-youtube-client-ayc/total?label=Downloads%20%28GitHub%29)

Advanced Youtube Client - AYC is a portable lightweight youtube downloader written using windows batch commands based on youtube-dl.
You can call it a console front end if you want.

![512](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/screens.png)

</div>

## Table of Contents

- [Instructions](#instructions)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [Basic](#basic)
    - [Complete](#complete)
- [Features](#features)
- [Alternative: Build an .exe](#build-an-exe-old-way)
- [Supported Sites](#supported-sites)
- [Frequently Asked Questions (FAQ)](#frequently-asked-questions-faq)
- [Developer notes](#developer-notes)
- [Links](#links)

## Instructions

### Prerequisites
Before running AYC you need to make sure of the following.
1. **Windows Console Host MUST be the default terminal application for batch scripts**. This is because of a 30 year old cmd feature set Microsoft still hasn't added to the new Windows Terminal (See [#5094](https://github.com/microsoft/terminal/issues/5094)).
   1. Open **Windows Terminal** App. (Either right click **Start** and select **Terminal** or search for **Terminal** in the start menu).
   2. Press **Ctrl + ,** (comma) to open **Settings**.
   3. Change your **Default terminal application** to **Windows Console Host** and click **Save**.
2. Windows Defender will show a one-time warning before you try to start a batch file downloaded from the internet. You need to click **More info** and click **Run Anyway** for it to go away.

### Installation 
[Why is this complicated?](#2-why-is-the-installation-so-complicated)
#### Basic
1. Download the latest AYC release from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases/latest) or [here](https://advanced-youtube-client-ayc.sourceforge.io/).
2. Extract the **ayc** folder inside to anywhere on your computer (eg: **C:\ayc**). **Do not extract inside Program Files.**
3. Open **AYClient.bat** and follow the on screen instructions. 

**That's all you need to start using AYC. If you want to Pin AYC to taskbar or have an icon, follow instructions below**

#### Complete
1. Inside the **ayc** folder, right click **AYClient.bat** and select create a shortcut.
2. Right click the created shortcut, choose **Properties** >**Shortcut** Tab.
3. The **Target** box will have your path auto filled. Add `cmd.exe /c ` before the start of the path.
4. Example: If target is `"C:\Users\Joe\AYClient.bat"`, change it to `cmd.exe /c "C:\Users\Joe\AYClient.bat"`.
5. Click **Change icon** button and select the included **ayc.ico** file and click **Apply**.
6. Now you can right click the created shortcut and select "Pin to taskbar".

## Features

- Download 8K, 4K, 2K, 1080p, 720p, 480p, 360p, 240p, 144p videos from YouTube.
- Create Batch Download Jobs to organize and download multiple videos from multiple websites.
- Supports more than 1000 websites.
- Supports AV1 with HDR, VP9 for 1440p and above resolutions.
- Download and resume playlists.
- MP3, M4A Audio Downloader with Cover Art.
- Compatible with Windows Vista SP2/7/8/8.1/10/11 (32/64-bit).
- Light on CPU Resources as it runs solely on CMD.
- Written as a Windows Batch file so you can edit the source code and make your own Youtube Downloader.
- Universal Mode - Download from any website.

## Build an .exe (Old way)

AYC used to be compiled with [Bat-To-Exe-Converter](https://www.majorgeeks.com/files/details/bat_to_exe_converter.html) by Faith Kodak ([GitHub](https://github.com/99fk)/[f2ko.de](https://f2ko.de/programme/bat-to-exe-converter/)). ([IPFS Mirror](http://ipfs.io/ipfs/QmPBp7wBSC9GukPUcp7LXFCGXBvc2e45PUfWUbCJzuLG65))

1. Download AYClient.bat.
2. Open the file with notepad and replace all instances of AYClient.bat to AYClient.exe using the replace tool.
3. Open the file in Bat To Exe Converter, you can [add an icon](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/main/ayc.ico?raw=true) if you want.
4. Compile.
5. You need [ffmpeg.exe](https://github.com/yt-dlp/FFmpeg-Builds/releases), [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases), [atomicparsley.exe](https://github.com/wez/atomicparsley/releases) and [aria2c.exe](https://github.com/aria2/aria2/releases) in the same folder as the compiled binary.
6. Start AYClient.exe and it will create the necessary files for further execution.

## Supported sites
Anything yt-dlp [supports](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md), AYC supports.

## Frequently asked questions (FAQ)

### 1. Where are the old releases?
AYC started it's life on Sourceforge in 2016, it's only been on Github since 2021. Part of old releases are available on the [Sourceforge page](https://sourceforge.net/projects/advanced-youtube-client-ayc/) and the complete archive is on [MEGA](https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ) and always updated each release. The archive is still missing some early files from v2 era. I couldn't recover them.

### 2. Why is the installation so complicated?
AYC used to be compiled to exe files. These exe files extracted the batch script and then ran it which was easier for the user. But it was a common tactic used by malware in the olden days. So antiviruses everywhere started flagging them. 

Now AYC is released as straight batch files you can open with notepad and read. Some old v2 releases were lost due to this before I could archive them for future reference. The remaining recovered releases along with their source codes along with all the new releases are kept in an updated archive file on MEGA. If you want you can download them below. 

Be advised since then antivirus softwares have improved to detect that these are indeed harmless but some still falsely flag them. Windows defender sometimes does. It's not consistent. 

MEGA Archive Link: [https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ](https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ)

## Developer notes

- Some parts of the code might look weird but those were added, refactored and cleaned to fix some edge cases found over the years. Trust me, those are there for a reason. Still you're welcome to improving these and if it works, submit a PR, any help is appreciated. :) 
- The script is lacking documentation. Unfortunately, I am too busy looking for a job to have time to write it. Hope it's readable. Any PR adding documentation is also welcome.    

## Links

[Website](https://advanced-youtube-client-ayc.sourceforge.io)

[Project on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc)

[VideoHelp](https://www.videohelp.com/software/Advanced-Youtube-Client-AYC)

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[yt-dlp/ffmpeg](https://github.com/yt-dlp/FFmpeg-Builds)

[AtomicParsley](https://github.com/wez/atomicparsley)

[aria2](https://github.com/aria2/aria2)
