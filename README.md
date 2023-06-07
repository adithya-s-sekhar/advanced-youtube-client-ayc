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
- [Alternative: Build an .exe](#build-an-exe-old-way)
- [Supported Sites](#supported-sites)
- [Frequently Asked Questions (FAQ)](#frequently-asked-questions-faq)
- [Developer notes](#developer-notes)
- [Links](#links)

## Features

- Download 8K, 4K, 2K, 1080p, 720p, 480p, 360p, 240p, 144p videos from YouTube.
- Create Batch Download Jobs to organize and download multiple videos from multiple websites.
- Supports more than 1000 websites.
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
    2. Press `Ctrl + ,` (comma) to open **Settings**.
    3. Change your **Default terminal application** to `Windows Console Host` and click **Save**. 
    4. You can now close this terminal.
2. Copy the magic phrase from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/b4808d1f75c0af1dea5951b7a190d9b66835cc09/magic.txt#L10), go back to AYC, and paste it into the field. This is to ensure that you actually read the instructions.

### Windows 7/8/8.1 users

1. Copy the magic phrase from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/blob/b4808d1f75c0af1dea5951b7a190d9b66835cc09/magic.txt#L10), go back to AYC, and paste it into the field. This is to ensure that you actually read the instructions.

- [How to pin AYC to taskbar for easy access?](#complete)

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

### 3. Why do I have to do magic phrases and others?

To put it simply

- AYC uses `mode` to change window sizes dynamically and fit all its contents to screen.
- Windows Console Host was the application where batch scripts ran for 30 years.
- Windows Console Host supports `mode`.
- So, AYC works perfectly in Windows Console Host.
- Windows Terminal was released. It's a good terminal app but it's not finished. It's lacking some really important features.
- One of the features it's missing is `mode`. **So AYC is broken in Windows Terminal**.
- It's ok. Batch scripts still runs in Windows Console Host because Microsoft isn't stupid to replace a 30 year old mature software with an unfinished software.
- A few updates later, in Windows 10 and 11, Microsoft forces Windows Terminal as default for everyone.
- Someone cares at Microsoft, so there is still a toggle to switch to the actually working Windows Console Host. But you have to change it manually.
- People not realizing this starts complaining to me.
- I wrote extensive instructions and revised multiple times to solve it. People don't read. Can't blame them, we all accept Terms and Conditions without reading. Kyle did it.
- Ask Microsoft to implement the missing functionality? Done. ([#5094](https://github.com/microsoft/terminal/issues/5094), [#5079](https://github.com/microsoft/terminal/issues/5079), [#5651](https://github.com/microsoft/terminal/issues/5651), [#5753](https://github.com/microsoft/terminal/issues/5753), [#2630](https://github.com/microsoft/terminal/issues/2630), [#6392](https://github.com/microsoft/terminal/issues/6392), [#40](https://github.com/vladdeSV/scone/issues/40), [#6832](https://github.com/microsoft/terminal/issues/6832), [#7082](https://github.com/microsoft/terminal/issues/7082), [#7232](https://github.com/microsoft/terminal/issues/7232), [#7466](https://github.com/microsoft/terminal/issues/7466), [#7623](https://github.com/microsoft/terminal/issues/7623), [#7605](https://github.com/microsoft/terminal/issues/7605), [#8581](https://github.com/microsoft/terminal/issues/8581), [#8673](https://github.com/microsoft/terminal/issues/8673), [#9113](https://github.com/microsoft/terminal/issues/9113), [#11033](https://github.com/microsoft/terminal/issues/11033), [#12929](https://github.com/microsoft/terminal/issues/12929), [#13232](https://github.com/microsoft/terminal/issues/13232), [#13392](https://github.com/microsoft/terminal/issues/13392), [#13375](https://github.com/microsoft/terminal/issues/13375), [#13441](https://github.com/microsoft/terminal/issues/13441), [#13564](https://github.com/microsoft/terminal/issues/13564), [#13006](https://github.com/microsoft/terminal/issues/13006), [#13911](https://github.com/microsoft/terminal/issues/13911), [#13940](https://github.com/microsoft/terminal/issues/13940), [#14487](https://github.com/microsoft/terminal/issues/14487), [#14568](https://github.com/microsoft/terminal/issues/14568), [#14622](https://github.com/microsoft/terminal/issues/14622), [#15297](https://github.com/microsoft/terminal/issues/15297)).
- Prevent AYC from running inside Windows Terminal? They won't let anyone detect if anything is running in Windows Terminal or Windows Console Host. ([#7434](https://github.com/microsoft/terminal/issues/7434),...)
- So I blocked people from using the script until they read instructions and **maybe** did the changes it need. I said maybe because there still isn't a way to detect it.
  

## Developer notes

- Some parts of the code might look weird but those were added, refactored and cleaned to fix some edge cases found over the years. Trust me, those are there for a reason. Still you're welcome to improving these and if it works, submit a PR, any help is appreciated. :) 
- The script is lacking documentation. Unfortunately, I am too busy looking for a job to have time to write it. Hope it's readable. Any PR adding documentation is also welcome.    

## Links

[Website](https://advanced-youtube-client-ayc.sourceforge.io)

[Project on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc)

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[yt-dlp/ffmpeg](https://github.com/yt-dlp/FFmpeg-Builds)

[AtomicParsley](https://github.com/wez/atomicparsley)

[aria2](https://github.com/aria2/aria2)
