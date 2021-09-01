![256](https://user-images.githubusercontent.com/60822601/115324256-36724180-a1a7-11eb-929c-c0d1221b7b84.png)

# Advanced Youtube Client - AYC
Advanced Youtube Client - AYC is a lightweight youtube downloader written using windows batch commands based on youtube-dl.
You can call it a console front end if you want.

## Planned

- Teenage code. Rewrite this properly with proper error handling.
- ~~Use any other compiler to fix Virus Warnings.~~

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

## Source and Building

### Compiling
AYC is compiled with [Bat-To-Exe-Converter](http://ipfs.io/ipfs/QmPBp7wBSC9GukPUcp7LXFCGXBvc2e45PUfWUbCJzuLG65). (Hosted on [IPFS](http://ipfs.io))

1. Download AYClient.bat.
2. Open the file with notepad and replace all instances of AYClient.bat to AYClient.exe using the replace tool.
3. Open the file in Bat To Exe Converter, you can add an icon if you want.
4. Compile.
5. You need [ffmpeg.exe](https://github.com/AnimMouse/ffmpeg-stable-autobuild/), [youtube-dl.exe](https://youtube-dl.org) and [atomicparsley.exe](https://sourceforge.net/projects/atomicparsley/) in the same folder as the compiled binary.
6. Start AYClient.exe and it will create the necessary files for further execution.

### Running the batch file itself
Running AYC as a live batch file can help you tweak it to your needs. Or if you don't trust the binaries.

1. Download AYClient.bat.
2. Create a folder with any name anywhere, on a USB stick or your hard disk.
3. Also have [ffmpeg.exe](https://github.com/AnimMouse/ffmpeg-stable-autobuild/), [youtube-dl.exe](https://youtube-dl.org) and [atomicparsley.exe](https://sourceforge.net/projects/atomicparsley/) in the folder.\
   Thank you Zeranoe for building ffmpeg for us windows peeps all these years, AYC switched to AnimMouse builds since Dec 2020.
4. Start AYClient.bat and it'll create the necessary files for further execution.
