
# PSP 1000

The PSP 1000 is able to have permanent custom firmware installed via cIPL flasher. cIPL (custom IPL) installs to the nand and allows the PSP to load the custom firmware files on boot.

Steps:
 - Copy all files from PSP_00 folder to your memory card folder (on root)
 - Start the update to OFW 6.61 from the list of games, then do it.
 - You should restart in OFW 6.61, check this in the settings => system information
 - Now start PRO UPDATE then select X to validate the flash installation.
 - You should restart in 6.61 PRO-C, check that in the parameters => system information
 - Start CIPL Flash to make the flash permanent. Then select X to validate.


# PSP 2000

Some PSP 2000s are able to install permanent custom firmware via the cIPL flasher like the PSP 1000. For others you will need to use Infinity to enjoy the same benefits.

Steps:
 - Removed the battery cover from the PSP and look at the code number indicated on the sticker in the battery slot. eg. 5A, 5C, 6A, 7C, 8B would be older than 8C, 8D, 9A.
 - If the date code is 8C or later, you cannot use CIPL Flasher follow the same steps as PSP 3000. If the date code is lower than 8C you can use CIPL Flasher follow the same steps as PSP 1000.


# PSP 3000 / STREET / GO

The PSP 3000 / STREET / GO are not able to install a permanent custom firmware via the cIPL flasher like the PSP 1000 and certain 2000. For this one it will be necessary to use Infinity to benefit from the same advantages.

Steps:
 - Copy all files from PSP_00 folder to your memory card folder (on root)
 - Start the update to OFW 6.61 from the list of games, then do it.
 - You should restart in OFW 6.61, check this in the settings => system information
 - Now start PRO UPDATE then select X to validate the flash installation.
 - You should restart in 6.61 PRO-C, check that in the parameters => system information
 - PSP 3000/STREET ONLY: Copy all files from PSP_01 folder to your PSP folder (yes replace old file)
 - PSP GO ONLY: Copy all files from PSP_02 folder to your memory card folder (on root) (yes replace old file)
 - Now start Infinity then select X to validate installation.
 - You should restart in 6.61∞, check that in the parameters => system information
 - Now start Fast Recovery to re-enable Flash PRO-C.
 - You should restart in 6.61 PRO-C∞, check that in the parameters => system information
 - Now start Infinity then select ← and select PRO en press X (a star should appear next to it). Now Press Home and Exit.
 - Turn off your PSP, remove the battery and charger. Then turn it back on.
 - You should start in 6.61 PRO-C∞, check that in the parameters => system information


# Tricks

- Remember to always format your memory card from your console and not on your computer. Otherwise it can be a problem for large card capacities.

 - An essential plugin if you have a big memory card is [Game Categories Lite](https://www.gamebrew.org/wiki/GC_Lite_PSP) or GC Lite. It allows you to categorize games by subfolders. It is mandatory if you have more than 100 Games, because in this case the PSP could not display them all. This plugins solves the problem is to put you much more than 100 Games. To use it, copy the contents of PSP_SAMPLE to the root of your memory card. Then place your games and Homebrews in the appropriate folders.

 - For fix error like "The system software of your PSP™ system is version 9.90. There is no need to update" when run OFW 6.61 update, run VERSiON.TXT SWiTCHER and press X to fix firmware Version. Now you can exit, and you should now be able to install the 6.61 update.

 - You can find the full set of PSP games in ISO here [part1](https://archive.org/download/redump.psp) [part2](https://archive.org/download/redump.psp.p2). Many Community Games and Homebrews are also available on [gamebrew.org](https://www.gamebrew.org/index.php?title=Special:CargoQuery&limit=500&offset=10&tables=Infobox_PSP_Homebrews&fields=_pageName&order_by=lastupdated+DESC&format=ul). You can also take the saves of the games that interest you on [gamespot.com](https://gamefaqs.gamespot.com/psp/category/999-all)

 - You can compress your ISOs in CSO format, to save storage space. For this on Windows you can use [CISO GUI](https://forums.ppsspp.org/showthread.php?tid=5384), the tools also exist in command line for linux and mac [github](https://github.com/jamie/ciso)

# Explanation folders

- PSP_00 Contains the file tree for the Update to 6.61 Official (for all model), the PRO-C flash (UPDATE, Flash Recovery, CIPL Flasher) to be copied to the root of the memory card
- PSP_01 Contains the file tree with Infinity 2.1 (for some 2000, all 3000 and STREET) file and the PRO-C flash (UPDATE, Flash Recovery) to be copied to the root of the memory card
- PSP_02 Contains the file tree with Infinity for PSP GO and the PRO-C flash (UPDATE, Flash Recovery) to be copied to the root of the memory card
- PSP_SAMPLE Contains an example of using the Game Categories plugin, to organize your games by folder. To be copied to the root of the memory card. Then place your Games/Homebrews in the appropriate category folders
