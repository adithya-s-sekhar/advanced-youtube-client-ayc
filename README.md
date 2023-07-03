<div align="center">

![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC

![GitHub release (latest by date)](https://img.shields.io/github/v/release/adithya-s-sekhar/advanced-youtube-client-ayc?style=flat) ![SourceForge Downloads](https://img.shields.io/sourceforge/dt/advanced-youtube-client-ayc?label=Downloads%20%28Sourceforge%29) ![GitHub all releases](https://img.shields.io/github/downloads/adithya-s-sekhar/advanced-youtube-client-ayc/total?label=Downloads%20%28GitHub%29)

## Why?

<div align="left">

AYC is the simply the fastest no nonsense video downloader ever. There I said it, I've tried it all. I tried both open source and closed source applications, paid and free. Some of those were good, has unique features. But most of them I found **too complicated**, **too bloated**, **too slow**, **too many clicks**, **can't use muscle memory** the list goes on. They were not for me.

I just wanted to download a video, and I need to know when it's finished and show me a big green screen. So I made a tui script for yt-dlp, it took 7 years and it's still going. To this day, I keep finding little improvments here and there. Make sure to follow this repo to keep track of them.

</div>

## Screenshots

![512](https://raw.githubusercontent.com/adithya-s-sekhar/advanced-youtube-client-ayc/main/Screenshots/screens.png)

*v3.6 01/Sep/2021*

</div>

## Table of Contents

- [Features](#features)
- [Installation](#installation)
  - [Basic](#basic)
  - [Complete](#complete)
- [Instructions](#instructions)
- [Frequently Asked Questions (FAQ)](#frequently-asked-questions-faq)
- [Links](#links)

## Features

- Supports Youtube, Reddit, Twitter, Facebook, Instagram, Twitch, Dailymotion, Vimeo and [100s of other websites](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md) that yt-dlp supports.
- Automatically saves Video Chapters, Thumbnails, Subtitles for Youtube videos. Enable some of them in settings.
- Supports downloading playlists, channels, keyword topics on multiple websites.
- Multithreaded downloads to fully utilize your Internet speeds.
- Batch mode! You can create jobs, save urls to them and download, resume, edit, delete anytime you want.
- Extremely light and instantly responding Text Based UI.
- You can easily edit the scripts to make it do what you want, probably.
- Compatible with Windows 7/8/8.1/10/11 (32/64-bit) only. I've seen the horrors of Windows Batch, don't wan't to do bash.
- Downloads only. We don't transcode.
- Except for audio. Along with untouched M4A and OPUS audio straight from youtube, there is also a 128k CBR MP3 option.
- Everything designed to help you create muscle memory.

## Installation 

*Note: Windows Defender will show a one-time warning before you try to start a batch file downloaded from the internet. You need to click **More info** and click **Run Anyway** for it to go away.*

### Basic
1. Download the latest AYC release from [here](https://github.com/adithya-s-sekhar/advanced-youtube-client-ayc/releases/latest) or [here](https://advanced-youtube-client-ayc.sourceforge.io/).
2. Extract the **ayc** folder inside to anywhere on your computer (eg: **C:\ayc**). **Do not extract inside Program Files.**
3. Open **AYClient.bat** and follow the on screen [instructions](#instructions). 

**That's all you need to start using AYC. If you want to Pin AYC to taskbar or have an icon, which I highly recommend, follow Complete install below**

### Complete
1. Inside the **ayc** folder, right click **AYClient.bat** and select create a shortcut.
2. Right click the created shortcut, choose **Properties** >**Shortcut** Tab.
3. The **Target** box will have your path auto filled. Add `cmd.exe /c ` before the start of the path.
4. Example: If target is `"C:\ayc\AYClient.bat"`, change it to `cmd.exe /c "C:\ayc\AYClient.bat"`.
5. Click **Change icon** button and select the included **ayc.ico** file and click **Apply**.
6. Now you can right click the created shortcut and select **Pin to taskbar**.

[Why is this complicated?](#5-why-is-the-installation-so-complicated)

## Instructions

When you open AYC for the first time, it'll ask you to do these in order for it to work properly. **Please don't skip this.**([Why?](#6-why-do-i-have-to-do-magic-phrases-and-others))

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

## Frequently asked questions (FAQ)

### [1. Why?](#why)

### 2. Was it worth it?

- From a sanity perspective? Questionable. Windows Batch is not a programming language. It can sometimes fail the whole script if one command fails. So it was challenging to keep it from being *"too hacky it's unreadable"* but also have ways to *"not crash at the first error"*. It has a lot of quirks that'll only show up when you use it for a long time. That's why this project took so long.
- For what came out of it? **Yes. A solid yes.** Once you set this up, it will be the fastest no nonsense video downloading experience you'll ever have. I know because I use it almost everyday.

### 3. Why didn't you use Python or Go?

Although not being a programming language, batch has some excellent inbuilt tools to handle a front end like this. Compared to how slow languages with a vm can be and how hard it is for them to interact with the rest of Windows, batch is the best choice for AYC and it shows.

### 4. Where are the old releases?

AYC started it's life on Sourceforge in 2016, it's only been on Github since 2021. Part of old releases are available on the [Sourceforge page](https://sourceforge.net/projects/advanced-youtube-client-ayc/) and the complete archive is on [MEGA](https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ) and always updated each release. The archive is still missing some early files from v2 era. I couldn't recover them.

### 5. Why is the installation so complicated?

AYC used to be compiled to exe files. These exe files extracted the batch script and then ran it which was easier for the user. Which is a sketchy thing to do. So antiviruses everywhere started flagging them. 

Now AYC is released as straight batch files you can open with notepad and read. Some old v2 releases were lost due to this before I could archive them for future reference. The remaining recovered releases along with their source codes along with all the new releases are kept in an updated archive file on MEGA. If you want you can download them below. 

Be advised since then antivirus softwares have improved to detect that these are indeed harmless but some still falsely flag them. Windows defender sometimes does. It's not consistent. 

MEGA Archive Link: [https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ](https://mega.nz/folder/HgtFmBxQ#5Qd4j73u_O5CZIomc3S3AQ)

### 6. Why do I have to do magic phrases and others?

AYC uses a command `mode` to dynamically resize window size to fit and disaply all it's content. This works on **Windows Console Host**, the application which ran .bat batch scripts for 30 years since Windows NT was first released and works on everything upto Windows 11.

Recently Microsoft's been trying to push the newer **Windows Terminal** to it's users on Windows 10 and 11. But this is not feature complete. One of the feature it's missing is `mode`. 

So on these computers users have to manually change their setttings to allow batch scripts to open in Windows Console Host. But people downloading this from other websites and even from here skipped over the instructions to do that and thought the script was broken. 

So AYC now makes all first time users go through this once before continuing.

## Links

[Website](https://advanced-youtube-client-ayc.sourceforge.io)

[Project on Sourceforge](https://sourceforge.net/projects/advanced-youtube-client-ayc)

### Thanks to these guys

[AYC on VideoHelp](https://www.videohelp.com/software/Advanced-Youtube-Client-AYC)

[AYC on Softpedia](https://www.softpedia.com/get/Internet/Download-Managers/AYC.shtml)

[AYC on Softaro](https://softaro.net/advanced-youtube-client-ayc/)

### This won't be possible without these awesome projects

[yt-dlp](https://github.com/yt-dlp/yt-dlp)

[yt-dlp/ffmpeg](https://github.com/yt-dlp/FFmpeg-Builds)

[AnimMouse/ffmpeg-autobuild](https://github.com/AnimMouse/ffmpeg-autobuild)

[AtomicParsley](https://github.com/wez/atomicparsley)

[aria2](https://github.com/aria2/aria2)
