Advanced Youtube Client - AYC v4.23 - 07/Sep/2024
Open AYClient.bat

What's new?

[4.23]
- New: Toggle to enable or disable downloading auto-generated subtitles.
- New: Subtitles support added to custom quality youtube downloads.
- Fixed: Thumbnails were not being shown on custom quality youtube downloads.
- Updated: ffmpeg, atomicparsley.

[4.22]
- Fixed: Retries were failing due to a previous optimization from v4.19.
- Updated: Libraries.

[4.21]
- New: Option to open downloads folder after a successful download.
- Improved: UI.
- Improved: Code quality.
- Updated: ffmpeg to v7.0.

[4.20]
- New: Simplified quality selector for youtube and bilibili.
- Improved: Link validator.
- Improved: UI on some quality selectors.
- Improved: History.

[4.19]
- New: Subtitle languages can be selected.
- New: Subtitle type can be selected (as .srt or embedded into the file).
- New: Quickkey for reset.
- Fixed: Crashing on some urls.
- Fixed: Quotes and spaces crashing ayc in various inputs; urls, settings values, format codes.
- Fixed: Unexpected errorlevel checking.
- Fixed: Some formats failing with some configurations.
- Fixed: Temporary folder UI still showed invalid after an invalid path is fixed.
- Fixed: Download folder UI still showed invalid after an invalid path is fixed.
- Fixed: Failed batch downloads crashing AYC.
- Improved: Reset UI.
- Improved: Generic downloads UI.
- Improved: Input sanitization for all inputs.
- Updated: aria2c to v1.37.0
- Code cleanup and improvements.

[4.18]
- Fixed: Shortcuts weren't being made or broken when AYC is in a path with spaces.
- Fixed: Reset in folder settings were resetting to an old path.
- Added: Custom quality selectors for youtube downloads.
- Code cleanups.
- UI Fixes.

[4.17]
- Fixed: Empty inputs triggered youtube search.
- Fixed: Webm audio downloads failed when embed thumbnails was enabled.
- Other minor improvements.

[4.16]
- New: Search and download from youtube from AYC. Just type whatever it is you're looking for.
eg: "mkbhd pixel 2 review" to download MKBHD's pixel 2 review video.
eg: "ryan george fruit names" to download How fruits got their names? video by Ryan George.
- Improved: Error screen.

[4.15]
- Added: New quickkeys.
- Added: Auto shortcuts in AYC folder, Desktop and Start Menu.
- Added: Simple download history.
- Fixed: Reset didn't delete all config files.
- Improved: New folder structure to keep everything clean and less confusing.

[4.14]
- Added: Automatic setup on first run. No longer need to copy paste things from github or magic phrases.
- Added: Long path names setup to first run.
- Added: Quickkey to change folders.
- Added: Support for bilibili mobile website.
- Fixed: Downloads failing on long file names.
- Fixed: Downloads failing on long path names.
- Fixed: File naming on some downloaders.
- Fixed: Some batch modes were missing custom configs.
- Fixed: Theme colors breaking on non-dark themes.
- Improved: First run setup.
- Improved: AYC will now save files with the time they are downloaded, not uploaded.
- Improved: Format selectors will now use default config as well.
- Improved: UI.
- Relicensed to GPLv3.

[4.13]
- Fixed: Broken first run text for first time Windows Terminal users.
- Added: aria2 switch on start page.
- Added: Reddit thumbnail support. (Fixed by yt-dlp v2023.09.24)
- Minor fixes and updates.

[4.12]
- Added: Twitch quality selectors.
- Fixed: yt-dlp version wasn't refreshed if updated by auto updater.
- Fixed: Site fixes did not apply everytime.
- Fixed: Bilibili, Youtube did not follow global thumbnail settings.
- Fixed: Bilibili custom formats didn't work.
- Fixed: Youtube download status wasn't set on start.
- Improved: Some UI elements.
- Improved: Input sanitization on all custom format fields.
- Improved: Generic downloads will save custom format id in filename if it's used.
- Improved: Rename legacy scripts to make sense for new users who want to tweak.
- Refactored batch mode, settingsToggles. 
- Organized and cleaned up some code.

[4.11]
- Added: More themes.
- Removed: Date from version. AYC releases will no longer have date attached to them.
- Improved: Theme colors applied to more pages. Download windows are still overridden by yt-dlp. Nothing I can do about it.
- Improved: Dark theme readability.

[4.10]
- Added: Pop up yt-dlp updater.
- Added: Light and Dark themes.
- Added: More useful quickkeys.
- Fixed: Reddit providing broken PNGs which broke the downloader.
- Improved: First run setup.
- Improved: yt-dlp update checker page.

[4.9]
- Improved: UI.
- Code cleanup and refactors. See full changes on GitHub.

[4.8]
- Added: Support for embedding thumbnail, subtitles on non youtube links.
- Added: Ability to change the temporary folder.
- Fixed: Some windows glitched by changing window size twice when opened.
- Improved: UI.

[4.7]
- This is a rushed release, if anything doesn't work, do report and downgrade to v4.6 until it's fixed.
- Added: Support for cookies.txt. Now you can download from sites with accounts. Read FAQ for instructions.
- Added: Quality selector for bilibili.
- Added: Custom config support. You can add custom options for yt-dlp per download mode in scripts\custom.bat
- Fixed: A race condition set tmp_loc before it was even declared.

[4.6]
- Fixed: 144p,240p videos saving larger size audio than video.
- Fixed: Batch job name displayed invalid on empty input.

[4.5]
- New and faster link validator. This should fix the delays users on v4.4 have been experiencing.
- Old one needed 2 passes for best case links, and 10 passes for worst case.
- New one needs only 1 pass for best case links and 2 passes for worst cases.
- 100% faster best case checks and 400% faster worst case checks.
- Fixed: Retries
- Improved: UI.

[4.4]
- Added: Support for updating to nightly and stable builds of yt-dlp.
- Added: Link counter for tracking how many links were added to the batch job that session.
- Fixed: youtube_dl_version missing was shown as a quick error on first run.
- Fixed: Default output folder was being created even if downloads are to a user defined folder.
- Fixed: Batch jobs allowed non-youtube links in youtube jobs.
- Fixed: Reset didn't delete youtube_dl_version.
- Improved: Validate links in a way such that it's only needed once.
- Improved: Reset will not delete data folder now.
- Improved: Going back to menu from batch's 'Add Links' is easier now.
- Improved: Download success pages now shows current URL or Job.
- Improved: Rechecker is now retry. AYC no longer tries to redownload any thing if yt-dlp returns success.
- Improved: Aria2 can now be enabled for "All downloads" or "Only non-youtube downloads" or can be "Disabled".
- UI updates and fixes.
- Code cleanup and refactors.

[4.3]
- Fixed: VP9 downloads failed due to a youtube change.
- Code cleanup.

[4.2]
- Fixed: Reset didn't close AYC.
- Improved: Seperated downloaders for batch, youtube and non-youtube.
- Improved: UI.
- Code cleanup.

[4.1]
- Fixed: aria2 failing downloads on long path names.
- Removed: File name length restrictions.
- Added: Temporary folder for downloads.

[4.0]
- Major Update: Fully Refactored.
- Binary files moved to bin folder.
- Split AYClient.bat functions into 14 seperate scripts inside scripts folder.
- Refactored almost all functions.
- Fixed: Batch url validation was getting disabled after after valid url.
- Fixed: Settings allowed the script to continue even with invalid config values.
- Added: Easy way to reset to default values in case of invalid settings.
- Removed: External version checker and Reset on updater.
- Removed: Dependency checker.
- Improved: UI.
- Improved: Code readability.
- Updated: ffmpeg.

[3.29]
- Removed: Dependency checker.
- Removed: External version check and reset on update.
- Added: Bin folder to keep binary files.
- Added: Easy way to reset to default download location.
- Added: Easy way to reset to default rechecker count.
- Fixed: Batch mode link validation was disabled after first valid url.
- Fixed: User was allowed to continue if download location was invalid, which lead to crashes.
- Fixed: User was allowed to continue if rechecker count was invalid, which lead to crashes.
- Improved: UI.

[3.28]
- Fixed: Location drag and drop crashing.
- Improved: UI.

[3.27]
- Removed: Support for people who can't read instructions.
- Fixed: Github button wasn't working.

[3.26]
- Fixed: Rechecker crashing on changing value.
- Added: Video Chapters on all downloads.
- Added: Interface for Job Editor with Notepad.
- Improved: Embed auto generated subtitles if none are uploaded. Needs to be enabled in Settings.
- Improved: Input validation on URLs, folder paths, job names.
- Improved: Error handling.
- Improved: Routing between pages.
- Improved: UI.

[3.25]
- Fixed: Going back on settings > location changed location.
- Fixed: URLs with '&' in them, often used for tracking purposes crashed normal and batch modes.
- Fixed: Batch job names with quotes crashed ayc.
- Improved: UI.

[3.24]
- Fixed: All formats UI was cutting off on Vimeo and other websites with lot of formats.
- Fixed: Opening settings via QuickKey will not apply changes to current console.
- Removed: Universal Mode option in More page and QuickKeys.
- Improved: Merged Universal mode functionality with regular youtube mode.
- Improved: UI.

[3.23]
- Fixed: Using unquoted paths with space in Settings>Location lead to a crash.

[3.22]
- User facing: 
  - Fixed: Input validation for spaces.
  - Fixed: Batch mode didn't error out if sample url failed.
  - Added: Delete job button in batch mode.
  - Added: Intro screen for dependency fixer.
  - Improved: Updated some strings.
- Under the hood: 
  - Use call instead of goto to check and fix all config files, this reduces disk activity from reading already read files.
  - Refactor url reciever in universal mode into two separate labels instead of if statements. No need for delayed expansion anymore.
  - Removing spaces from empty strings adds ' =' to the empty strings. Added a check to prevent it from passing input validation and triggering Universal mode.
  - Declared inherited window size and colors explicitly.
  - Removed unnecessarily checking for errorlevel 255 in choice.
  - Removed unused input validator in universal mode.

[3.21]
- Fixed: Universal mode couldn't be manually started.
- Minor UI fixes.

[3.20]
- Improved: AYC now detects if the link is youtube or not and redirect the user to youtube mode or universal mode. No more extra steps to download non-youtube videos.
- Improved: First run flow will now show version details.
- Fixed: Batch mode was continuing even when no Job name was given.
- Fixed: Batch mode was not informing the user if a blank URL was given and was saving it.
- Fixed: Universal mode was continuing even when a blank URL was given.
- Fixed: Universal mode was not erroring out when it couldn't fetch all available formats.
- Removed: Portable tag from About.
- Dev: Readability improvements and removed long chaining AND statements.

[3.19]
- Fixed: Reset in rechecker only if current value is invalid.

[3.18]
- Validate and fix download location on start.
- Validate and fix rechecker limit on start.
- Refactor error page.

[3.17]
- Refactor banner.

[3.16]
- Restrict filenames more granularly to work better with Windows MAX_PATH limit.

[3.15]
- This update is focused on cleaning up the code for people who like to modify.
- Unified batch mode and regular mode quality selectors. (110 lines reduced)
- Unified success pages. (41 lines reduced)
- Unified error pages. (46 lines reduced)
- Cleaned up variables and labels.
- Added QuickKey to open settings.
- Now resetting AYC completely removes Data folder. Downloads are untouched.
- Add support links to GitHub and Sourceforge inside script.
- Minor updates to dependency fixer.

[3.14]
- Fix downloads failing on long file names.
- Automatically detect and use yt-dlp.exe, yt-dlp_x86.exe and youtube-dl.exe in that order.
- Updated to ffmpeg 6.0.
- Switched to wez/atomicparsley for both 32 and 64-bit.

[3.13]
- Improved high-low quality selector in Batch and Universal modes.
- Added ffprobe to support post-processing on some websites.
- Updated dependencies.

[3.12]
- Faster HLS(480p,1080p) and Non-Youtube downloads without sacrificing regular Youtube speeds.
- Force aria2 in Universal Mode.
- Force aria2 in Non-Youtube Batch Jobs.
- Increase concurrent HLS fragments to 8 if aria2 is disabled.
- Ability to change batch download type after creation.
- Remove aria2 setup prompt on first run.
- UI fixes.
- Updated ffmpeg to 5.0.

[3.11]
- Start download immediately in Universal Mode instead of waiting for it to fetch all available formats.
- Added option to disable aria2 in Settings and First Run.
- Added option to embed thumbnails and subtitles in Settings.
- VP9/AV1 are now saved in MP4 containers.
- Added dependencyfix for aria2c.
- Detect when AYC gets updated and offer to reset old settings.
- UI Fixes throughout.

[3.10 and 3.9]
- Added missing license to release zip. (Reason for 3.10)
- aria2c multithreaded download enabled. 
-- HLS/DASH/Non-Youtube downloads are significantly faster: 68sec --> 11sec on a Hotstar Video!
-- Youtube Downloads are slightly faster depending on your internet.
- Ship old 32-bit binary of AtomicParsley for 32-bit release. Now it works on 32-bit PCs too. :)
- Update dependencyfix with 32-bit links to AtomicParsley.
- Append Video ID to end of file name to fix downloading videos with same title.

[3.8]
- Fix batch downloads failing on non-youtube jobs.
- Fix batch youtube quality selector going back to regular youtube format selector.
- Fix VP9 resolution limit.
- Fix VP9 video and audio failing to merge sometimes. Switched to yt-dlp/ffmpeg.
- VP9 and AV1 videos will now save 160k opus audio insted of 128k aac.
- Batch downloads now saves format code or resolution at end of file name.
- Some TUI changes here and there.
- Updated dependencies in release zip.

[3.7]
- Added dependency checks on startup for yt-dlp, ffmpeg and atomicparsley.
- AYC will now guide users how to fix each dependency if any is missing.
- Removed unnecessary step in yt-dlp update menu, should be faster.
- Inform user about best/worst in Universal/Batch Modes.
- Use color to indicate ID in Universal Mode.
- Replaced all references to youtube-dl to yt-dlp.
- In release zip: Updated dependencies.

[3.6]
-> AYC will be released as batch files from now on and only as portables.
This is due to the horrible AV detection from Microsoft Defender that flags anything unpopular as a Virus.
-> Switched to yt-dlp. No more throttling, super fast to download and contains a lot of fixes youtube-dl hasn't merged yet. 
-> Switched to the new AtomicParsley from wez (https://github.com/wez/atomicparsley).

[3.5]
-> Seperate Format Selector pages for MP4/VP9/AV1 and Audio Formats.
-> Fixed Wrongly downloading VP9.
-> New quality selector using vcodec instead of ext.(see youtube-dl readme#FORMAT-SELECTION)
-> UI Updates.
-> ffmpeg updated to AnimMouse n4.4 2021-05-12 08:09 734bf00 (64/32-bit) (see ayc github readme)
-> youtube-dl updated to v2021.05.16

[3.4]
-> Fix bug: AYC was creating aycdata folder while it already exists, this showed as an error momentarily while starting downloads.
-> Enhancement: Batch downloads can now pick a custom quality to download from a sample url.
-> Enhancement: Pass URLs directly to AYClient without using tmp.txt in Appdata.
-> Enhancement: Add rechecker to error page solutions list.
-> Enhancement: Minor UI Updates.

[3.3]
-> Fix bug: Resetting AYC deleted youtube-dl.
-> Fix bug: Choice in reset window was listening for a non existing 3rd option.
-> Fix bug: Window size wasn't applied while preparing first run.
-> Enhancement: The zipped version is now fully portable instead of creating folders on the running system.

[3.2]
-> Enhancement: youtube-dl can now be updated without admin permissions.
-> Enhancement: updated download failed pages with more information.
-> Enhancement: update youtube-dl on first run.
-> Enhancement: minor ui updates.

[3.1]
-> Fix bug: 1440p, 4k and 8k downloads fixed. Youtube changed these to VP9 from regular H264 which broke 3.0 because it was looking for MP4 h264 streams. As a result anything from 1440p and up can now be only saved as MKV files.
-> Fix bug: Changing recheck counts only applied on restart, now it updates everytime it's changed.
-> Fix bug: Fixed displayed choice range in download window.
-> Updated: youtube-dl

[3.0]
-> Note: Major Update - It's way better now.
-> Rewrite: Redid download block.
-> Rewrite: Unified stream selection pages.
-> Rewrite: Redid UI for quick access to everything.
-> Removed: Removed custom window sizes and accompanying logic.
-> Removed: Removed all unnecessary prompts and extra pages.
-> Enhancement: Code size reduced by over 40%.
-> Enhancement: Now uses a single download block instead of the old 4 per mode.

It's a proper tool now rather than a fun piece of script.


What's New in v2.99.7?

1. Fixed wrongly selecting MP4 on format selection screen.
2. Ask if user wants to reset before resetting.
3. Increased aria2 piece size to 4MB from 1MB.
4. Fixed UI mistakes:
- wrong header
- padding
- wrong wording on rechecker settings
- different date formats in different windows


What's New in v2.99.6?

* Seperated 64 and 32 bit installers.
* Zipped version now available. :)
* Added youtube-dl update option.
* Cleaned up source code mess from my teenage years
-unnecessary things
-repeated commands
-visual c++ 2010 installer
-immature jokes
* Updated ffmpeg:
-thank you zeranoe for building ffmpeg for us windows peeps all these years.
-now using https://github.com/AnimMouse/ffmpeg-stable-autobuild/
* Updated aria2 and youtube-dl.
* Reintroduced controls for the installer.
* Removed 3gp support since it's broken. Need to find another way.


What's New in v2.99.5? (Compared to v2.99.4)

*Maintenance Update
Updated youtube-dl to v2019.04.30
Updated ffmpeg to 4.1.3 release
Minor UI updates


What's New in v2.99.4? (Compared to v2.99.3)

*Maintenance Update
Updated youtube-dl to v2019.01.30.1
Updated ffmpeg to 20190129 zeranoe nightly
Minor UI updates


What's New in v2.99.3? (Compared to v2.99.2)

*Maintenance Update
Updated youtube-dl to v2018.11.07
Minor UI updates


What's New in v2.99.2? (Compared to v2.99.1)

Batch downloads can be resumed by entering the job name.
More updates to batch downloader
Removed all custom aria2 tweaks. aria2c is fine for now. ;)
Updated youtube-dl to v2018.09.10 (fixed youtube audio download)


What's New in v2.99.1? (Compared to v2.99.0)

[IMPORTANT] Disabled aria2 tweaks from Batch and Universal modes (some weird youtube-dl bug)
Fixed bugs overwriting already downloaded mp3 files (might need some more testing, stay with m4a unless you really need it)
Fixed bugs in Universal mode and Batch mode
youtube-dl updated to v2018.09.01


What's New in v2.99.0? (Compared to v2.98.0)

-New feature: Rechecker
-New feature: AYC windows size can be now customized
-New feature: Reset switch to fix crashes due to wrong or corrupt config changes
-Logic updated for directory handling
-New failsafes to prevent crashes
-Updated youtube-dl to v2018.08.22