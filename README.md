<div id="top"></div>

# ArchKatze 🐱

<!-- TABLE OF CONTENTS -->
<details>
  <summary>📗 <b>Table of Contents</b></summary>
  <ol>
    <li>
      <a href="#-about-the-project"> About The Project</a>
    </li>
    <li><a href="#-how-it-works">How it Works</a></li>
    <li><a href="#-authors">Authors</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## 🔰 About The Project
My Customized Arch Linux to increase productivity. 
![Screenshot](ss.png)

<p align="right">(<a href="#top">back to top</a>)</p>

## ⚡ How It Works

### Generating the ISO file
- Run `$ ./aur_download.sh` (Download aur packages from `aur_packages`)
- Run `$ sudo ./build.sh -v`
- Get the ISO file in the *parent* directory of this repository.
- You need to have `archiso` installed in your system to use this script, and a working internet connection to pull the packages that we'll embed into the ISO. The embedded packages are detected using `detect_packages.sh`, will be downloaded in `airootfs/root/pkg`, and will be automatically updated when
you run `build.sh` (the ISO-building script).
- If you don't want to auto-update the packages when running the script,
edit `customtools.sh` and change the *UPDATECACHE* variable to 0.

### Installing your system

Burn the generated ISO to a DVD or an USB stick.
When you boot it, you'll be greeted by a welcome message that hints you the
necessary steps that you have to follow, so you can run the installation
script (`install.sh`).

<p align="right">(<a href="#top">back to top</a>)</p>

### Authors
- [Mehrdad Shahidi](https://github.com/CyberKatze)






