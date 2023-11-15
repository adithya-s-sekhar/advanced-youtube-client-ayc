<div align="center">

![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC

![GitHub release (latest by date)](https://img.shields.io/github/v/release/adithya-s-sekhar/advanced-youtube-client-ayc?style=flat) ![SourceForge Downloads](https://img.shields.io/sourceforge/dt/advanced-youtube-client-ayc?label=Downloads%20%28Sourceforge%29) ![GitHub all releases](https://img.shields.io/github/downloads/adithya-s-sekhar/advanced-youtube-client-ayc/total?label=Downloads%20%28GitHub%29)

**!** Test builds are now available on [Telegram](https://t.me/s/ayc_news). Try latest features and fixes before everyone else.

![Screenshots](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/screens2.png)

Now available in various colors!!

![Search](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/ytsearch.png)

![Search](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/ytsearch2.png)

Download from youtube without visiting the website

![Search](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/youtube.png)

![Search](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/twitch.png)

![Search](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/bilibili.png)

Or just paste URLs as normal

![Search](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/u.png)

Quickkeys to take you to specific sections of AYC. 'u' takes you to yt-dlp update settings. There are more spread throughout AYC. Find them all!

</div>

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Instructions](#instructions)
- [Frequently Asked Questions (FAQ)](#frequently-asked-questions-faq)
- [Links](#links)

## Features

- Supports Youtube, Reddit, Twitter, Facebook, Instagram, Twitch, Dailymotion, Vimeo and [100s of other websites](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md) that yt-dlp supports.
- Automatically saves video chapters, thumbnails, subtitles (User configurable).
- Supports downloading playlists, channels, keyword topics on multiple websites.
- Multithreaded downloads using aria2c to fully utilize the available bandwidth (User configurable).
- Batch mode can create jobs, save urls to them and download, resume, edit, delete.
- Extremely light and instantly responding text based ui.
- Easily editable batch script.
- Compatible with Windows 7 SP1/8/8.1/10/11 (32/64-bit).
- Downloads only. Does not convert to other formats. All formats are given by the website.
- Except for audio. Along with untouched M4A and OPUS audio straight from youtube, there is also a 128k CBR MP3 option.
- Everything is designed to help create muscle memory.

## Installation 

*Note: Windows Defender will show a one-time warning before you try to start a batch file downloaded from the internet. You need to click **More info** and click **Run Anyway** for it to go away.*

1. Download the latest AYC release from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases/latest) or [here](https://sourceforge.net/projects/advanced-youtube-client-ayc/).
2. Extract the **ayc** folder inside to anywhere on your computer (eg: **C:\ayc**). **Do not extract inside Program Files.**
3. Open **AYClient.bat** and follow the on screen instructions. 
4. When you're done there'll be a shortcut created in ayc folder, on the desktop and in start menu. Open it to start using AYC.

## Instructions

### These instructions only applies for v4.13 and older releases!

**If you're on v4.14 or newer, you don't need to do it, everything is set up automatically! :)**

**If a newer AYC redirected you here, that means it failed to do the setup automatically. Follow the instructions to setup manually.**

**Warning: Windows 11 may undo these changes randomly without even asking you. If AYC ever appears broken, redo the instructions from this guide.**

### Windows 10/11 users

1. Change where batch scripts open by default.
    - Open **Windows Terminal** App. (Either right click **Start** and select **Terminal** or search for **Terminal** in the start menu).
    - If you're on **Windows 10 and don't have Windows Terminal** you can skip to Step 2.
    - Press `Ctrl + ,` (comma) to open **Settings**.
    - Change your **Default terminal application** to `Windows Console Host` and click **Save**. 
    - You can now close this terminal.
2. Copy the below magic phrase and paste into AYC. This is to ensure you actually read these instructions. [Why?](#4-why-do-i-have-to-do-magic-phrases-only-applies-to-ayc-v413)

``Mauris egestas imperdiet sem in imperdiet``

### Windows 7/8/8.1 users

1. Copy the below magic phrase and paste into AYC. This is to ensure you actually read these instructions. [Why?](#4-why-do-i-have-to-do-magic-phrases-only-applies-to-ayc-v413)

``Mauris egestas imperdiet sem in imperdiet``

## Frequently asked questions (FAQ)

### 1. How to resume a download that got cancelled?

Simply paste the url again and pick the same quality again. 
AYC is not a download manager, it does not track your downloads. But it keeps all partial downloads in it's temporary folder and you can resume them anytime you want.

### 2. How to load cookies.txt?

AYC like yt-dlp supports loading cookies from a cookies.txt file. All you have to do is place the cookies.txt file inside the ayc folder and start AYC. It'll auto detect it and ask you whether you want to load it or not.

Cookies.txt is loaded globally for all downloads. If you want to set cookies per site, you can add the cookie option in custom.bat in **scripts** folder. Currently custom.bat supports setting cookies for youtube links, for bilibili links and every other links.

### 3. Why is the installation so complicated?

AYC used to be compiled to exe files. These exe files extracted the batch script and then ran it which was easier for the user. But one day antiviruses everywhere started flagging this behaviour.

So AYC since [v3.6](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases/tag/v3.6) is released as straight batch files everyone can open with notepad and read. This requires some additional setup.

Some old v2 releases were lost due to this issue from Sourceforge before I could archive them for future reference. Their source codes were fine. The remaining recovered releases (thanks to [videohelp](https://www.videohelp.com/software/Advanced-Youtube-Client-AYC/old-versions)) along with their source codes along with all the new releases are kept in an updated folder on MEGA. If you want you can download them below. 

Be advised since then antivirus softwares have improved to detect that these are indeed harmless but some still falsely flag them. Windows defender sometimes does. It's not consistent. 

MEGA Archive Link: [https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ](https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ)

### 4. Why do I have to do magic phrases? (Only applies to AYC <v4.13)

AYC uses a command `mode` to dynamically change window size to fit and display all it's content. This works on **Windows Console Host**, the application which ran .bat batch scripts for 30 years since Windows NT was first released and works on everything upto Windows 11.

Recently Microsoft's been trying to push the newer **Windows Terminal** to it's users on Windows 10 and 11. But this is not feature complete. One of the features it's missing is `mode`.

So on these computers users have to manually change their setttings to allow batch scripts to open in Windows Console Host. But people downloading this from other websites and even from here skipped over the instructions to do that and thought the script was broken. 

So AYC now makes all users go through this once when they open it for the first time.

### 5. Where are the old releases?

AYC started out on Sourceforge in 2016, it's only been on Github since 2021. Part of the old releases are available on the [Sourceforge page](https://sourceforge.net/projects/advanced-youtube-client-ayc/files/) and the complete archive is on [MEGA](https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ) and always updated each release. The archive is still missing some early files from v2 era. I couldn't recover them.

### 6. How to remove AYC properly?

AYC can be removed by simply deleting the ayc folder. But do a reset first by going into AYC > Settings > Reset. This is needed to remove desktop, start menu shortcuts.

## Links

[Website](https://advanced-youtube-client-ayc.sourceforge.io)

[Project on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc)

[AYC on VideoHelp](https://www.videohelp.com/software/Advanced-Youtube-Client-AYC)

[AYC on Softpedia](https://www.softpedia.com/get/Internet/Download-Managers/AYC.shtml)

[AYC on Softaro](https://softaro.net/advanced-youtube-client-ayc/)

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[yt-dlp/ffmpeg](https://github.com/yt-dlp/FFmpeg-Builds)

[AnimMouse/ffmpeg-autobuild](https://github.com/AnimMouse/ffmpeg-autobuild)

[AtomicParsley](https://github.com/wez/atomicparsley)

[aria2](https://github.com/aria2/aria2)
