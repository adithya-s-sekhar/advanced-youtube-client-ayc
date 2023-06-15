<div align="center">

![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC

![GitHub release (latest by date)](https://img.shields.io/github/v/release/adithya-s-sekhar/advanced-youtube-client-ayc?style=flat) ![SourceForge Downloads](https://img.shields.io/sourceforge/dt/advanced-youtube-client-ayc?label=Downloads%20%28Sourceforge%29) ![GitHub all releases](https://img.shields.io/github/downloads/adithya-s-sekhar/advanced-youtube-client-ayc/total?label=Downloads%20%28GitHub%29)

Advanced Youtube Client - AYC is a portable lightweight video downloader written using windows batch commands based on youtube-dl/yt-dlp.
You can call it a console front end if you want.

![512](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/screens.png)

</div>

## Table of Contents

- [Features](#features)
- [Installation](#installation)
  - [Basic](#basic)
  - [Complete](#complete)
- [Instructions](#instructions)
- [Supported Sites](#supported-sites)
- [Frequently Asked Questions (FAQ)](#frequently-asked-questions-faq)
- [Developer notes](#developer-notes)
- [Links](#links)

## Features

- Download 8K, 4K, 2K, 1080p, 720p, 480p, 360p, 240p, 144p videos from YouTube.
- Create Batch Download Jobs to organize and download multiple videos from multiple websites.
- Supports a lot of websites.
- Auto detects yt-dlp, yt-dlp_x86 and youtube-dl.
- Supports AV1 with HDR, VP9 for 1440p and above resolutions.
- Download and resume playlists.
- MP3, M4A Audio Downloader with Cover Art.
- Compatible with Windows 7/8/8.1/10/11 (32/64-bit).
- Light on CPU Resources as it runs solely on CMD.
- Written as a Windows Batch file so you can edit the source code and make your own Youtube Downloader.

## Installation 

*Note: Windows Defender will show a one-time warning before you try to start a batch file downloaded from the internet. You need to click **More info** and click **Run Anyway** for it to go away.*

### Basic
1. Download the latest AYC release from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases/latest) or [here](https://advanced-youtube-client-ayc.sourceforge.io/).
2. Extract the **ayc** folder inside to anywhere on your computer (eg: **C:\ayc**). **Do not extract inside Program Files.**
3. Open **AYClient.bat** and follow the on screen [instructions](#instructions). 

**That's all you need to start using AYC. If you want to Pin AYC to taskbar or have an icon, follow Complete install below**

### Complete
1. Inside the **ayc** folder, right click **AYClient.bat** and select create a shortcut.
2. Right click the created shortcut, choose **Properties** >**Shortcut** Tab.
3. The **Target** box will have your path auto filled. Add `cmd.exe /c ` before the start of the path.
4. Example: If target is `"C:\ayc\AYClient.bat"`, change it to `cmd.exe /c "C:\ayc\AYClient.bat"`.
5. Click **Change icon** button and select the included **ayc.ico** file and click **Apply**.
6. Now you can right click the created shortcut and select **Pin to taskbar**.

[Why is this complicated?](#2-why-is-the-installation-so-complicated)

## Instructions

When you open AYC for the first time, it'll ask you to do these in order for it to work properly. **Please don't skip this.**([?](#3-why-do-i-have-to-do-magic-phrases-and-others))

### Windows 10/11 users

1. Change where batch scripts open by default.
    1. Open **Windows Terminal** App. (Either right click **Start** and select **Terminal** or search for **Terminal** in the start menu).
    2. If you don't have **Windows Terminal** you can skip to Step 2.
    3. Press `Ctrl + ,` (comma) to open **Settings**.
    4. Change your **Default terminal application** to `Windows Console Host` and click **Save**. 
    5. You can now close this terminal.
2. Copy the magic phrase from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/main/magic.txt#L10), go back to AYC, and paste it into the field. This is to ensure that you actually read the instructions.

### Windows 7/8/8.1 users

1. Copy the magic phrase from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/main/magic.txt#L10), go back to AYC, and paste it into the field. This is to ensure that you actually read the instructions.

- [How to pin AYC to taskbar for easy access?](#complete)

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

### 3. Why do I have to do magic phrases and others?

AYC uses a command `mode` to dynamically resize window size to fit and disaply all it's content. This works on **Windows Console Host**, the application which ran .bat batch scripts for 30 years since Windows NT was first released and works on everything upto Windows 11.

Recently Microsoft's been trying to push the newer **Windows Terminal** to it's users on Windows 10 and 11. But this is not feature complete. One of the feature it's missing is `mode`. 

So on these computers users have to manually change their setttings to allow batch scripts to open in Windows Console Host. But people downloading this from other websites and even from here skipped over the instructions to do that and thought the script was broken. 

So AYC now makes all first time users go through this once before continuing.
  
## Developer notes

- The script is lacking documentation. Unfortunately, I am too busy looking for a job to have time to write it. Hope it's readable. Any PR adding documentation is also welcome.    

## Links

[Website](https://advanced-youtube-client-ayc.sourceforge.io)

[Project on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc)

[AYC on VideoHelp](https://www.videohelp.com/software/Advanced-Youtube-Client-AYC)

[AYC on Softpedia](https://www.softpedia.com/get/Internet/Download-Managers/AYC.shtml)

[AYC on Softaro](https://softaro.net/advanced-youtube-client-ayc/)

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[yt-dlp/ffmpeg](https://github.com/yt-dlp/FFmpeg-Builds)

[AtomicParsley](https://github.com/wez/atomicparsley)

[aria2](https://github.com/aria2/aria2)
