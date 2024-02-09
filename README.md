# hypr-dots :octocat:
Current versions of the dot files installed on my desktop

## Usage of the installer 

The following commands have to be executed from whithin the git directory itself.

### Preparing the system, 1^^st^^ step

To prepare the system, you may run

`./install.sh --prepare` or `./install.sh -p`

This step is optional and is only interesting if you have a vanilla Tumbleweed system. In that case, all neccessary packes are being taken care of so you will be able to launch hyprland after installing the dot-files ( see below ).

### Recovering files 2^^nd^^ step
 
To sync files back from the repo 

`./install.sh --install` or `./install.sh -i`

### Saving config

To push files to the repo. This is only to make my jop easier... :smile:

`./install.sh --sync` or `./install.sh -s`

### Closing thoughts

Currently, the installer does **not** configure the packets, but that is something I am thinking of. Although [Debian](https://www.debian.org/) is my favorite Linux flavor, I have chosen [OpenSuSE Tumbleweed](https://get.opensuse.org/tumbleweed/)  as the base for a [Hyprland](https://hyprland.org/) installation. OpenSuSE was one of the first distros I have tried back in 1996 and I switched to Debian back then because I liked their package manager better. Stability was also an important criteria, but I'm really impressed with it's Tumbleweed spin. Good job SuSE! In the future I will definitively consider installin SuSE for bleeding edge installations...
