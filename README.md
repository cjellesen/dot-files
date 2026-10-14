# Installing the dot files

This is a compilation of my private dot files for linux setup. This is currently for an arch build running with hyprland as its compositor.

Before proceeding do the following:

    - Ensure that multilib is enable in /etc/pacman.conf (for lib32-nvidia-utils)

    - Ensure that the setting in "/etc/gai.conf" that allows IPv4 prioritization is on.

The last step might also be relevant during an Arch install as a solution to problems pinging a site via its FQDN even though it can be pinged using its IP.

Install Ansible and run the Ansible Playbook:

    - Install ansible by running "pacman -S ansible"

    - Run the ansible playbook through the "ansible-playbook main.yaml -K" command

After the playbok has run its course ensure that the "systemd-networkd-wait-online.service" is still disabled. It might be enabled during one of the package installs.

Once all packages has been installed use the "cp_to_config.sh" to copy the relevant configuration to the "$HOME/.config/" folder and run "hyprctl reload". Also remember to alter the monitor name and resolution in the hyprland.conf (run "hyprctl monitors" for this) along with the monitor name in the hyprpaper.conf.

There have been cases on a new install where the first load of hyprland, after the "cp_to_config.sh" as been executed, where Hyprland ignores the "$HOME/.config/hypr/" folder. In this case it will create its default files in the "$HOME/.config/" directory and use those. In this case just delete the default files that was created and reload Hyprland after ensuring there are files in the "$HOME/.config/hypr/" directory, which they should be, and it should work.

## After installation notes
Below is an assortment of notes that might/might not be relevant:

3D software such as FreeCAD or Bambulab Studio will fail to render the 3D compositor unless launched with:

    - __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json <NAME OF PROGRAM>

For Bambu Studio, in order to run it with the 3D compositor working and with GPU rendering enabled used the following:

    - __GLX_VENDOR_LIBRARY_NAME=mesa __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json MESA_LOADER_DRIVER_OVERRIDE=zink GALLIUM_DRIVER=zink WEBKIT_DISABLE_DMABUF_RENDERER=1 bambu-studio

Be aware that on newer network devices the system might default to IPv6 first which can fail to resolve some sites (e.g. archlinux.org during the arch install). It can however, also throw off initialization of Hyprlandand result in the following status message after initialization of Hyprland:

    - "graphical.target is queued for start, waiting for 60s..."

This might be network related and possible fixes include:

    - IPv4 not being prioritized and can be resolved by editing the "/etc/gai.conf" as mentioned in the beginning

    - Networkd waiting for an online signal, in order to disable this run "systemctl disable systemd-networkd-wait-online.service"

# Neovim
I have yet to modernize my Neovim setup. I am planning to move from the Jetbrains Rider to Neovim but the ergonomics are not quite there yet for a full migrations. This portion of the README will come at a later time.
For extra resources on Neovim check out: https://alpha2phi.medium.com/learn-neovim-the-practical-way-8818fcf4830f#545a.

# DotNet
As a part of the ansible playbook install process the "dotnet tool" CLI is installed, and a number of tools are subsequently install as global tools to the system.

Thos tools are as follows:
    - Roslyn Language Server
    - Entity Framework Core
    - Microsoft Artifacts CredentialProvider

In order to make the tools callable ensure that the "dotnet tool" install directory has been added to the "$PATH" variable. The PATH is already configured in the "./config/bash_profile" so either copy the relevant lines yourself, or copy it to your $HOME directory and rename it to '.bash_profile'.

## Roslyn Language Server - Integration with Neovim
The Neovim setup in this repository should work with with Roslyn. If there are any issues make sure the correct PATH for the dotnet tool directory is set in the .bash_profile. It should also be noted that the Neovim setup currently expects the language server to be called using the command "roslyn-language-server". If this is not the case it can be fixed by creating a symlink of that name with the name of Roslyn tool executable from the dotnet tool installation.

Once the Neovim integration with the Roslyn LSP is done the workflow in Neovim for getting linting outside the current file is:

    - On intialization of Neovim set the compiler to dotnet using ":compile dotnet"
    - The build chain can now be intialized by running ":make" which builds and adds its output to the quick fix list
    - The result of the build can be in the quick fix list using the ":copen" command

It is possible to force Roslyn to continously scan the entire solution by edition the Neovim configuration:

    - dotnet_analyzer_diagnostics_scope = "openFiles",

Do note that this comes with a significant processing overhead for larger solutions.

For documentaion about the ":make" in relation to dotnet see: "https://neovim.io/doc/user/quickfix.html#compiler-dotnet". One can add the options described in the documentation to Neovim as global defaults as done in the "./config/nvim/lua/config/globals.lua" where the following is set:

    - vim.g.dotnet_errors_only = true
    - vim.g.dotnet_show_project_file = false

## Microsoft Artifacts CredentialProvider - Connecting to a private NuGet feed
The tool is installed via the ansible playbook, so once the playbook is finished, running the command:
    - "dotnet restore --interactive"

should open a new tab for authentication in the browser.
Alternatively install the credential tool through the "dotnet tool" command. Remember to ensure the "$HOME/.dotnet/tools" folder is added to "$PATH" for this to work.

# Python
As a part of the ansible playbook install process the "uv" CLI tool is installed, and a number of tools are subsequently installed.

Those tools are as follows:
    - Ruff (Linter and Formatter)
    - Pyrefly (Language Server Protocol)

In order to make the tools callable ensure that the "uv" tool install directory has been added to the "$PATH" variable. The PATH is already configured in the "./config/bash_profile" so either copy the relevant lines yourself, or copy it to your $HOME directory and rename it to '.bash_profile'.

I have not yet configured Neovim to use these tools optimally so this is on my TODO list.

