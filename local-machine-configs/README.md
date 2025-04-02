# developer-configs

### MacOS

> You must have `curl` installed

1. [Install homebrew](https://brew.sh/index)
2. [Install iTerm2](https://iterm2.com/downloads.html)
3. Install ZSH
    > It might already be installed with iTerm2
    ```bash
    brew install zsh
    ```
4. Install Oh-My-Zsh (ZSH Configuration manager)
    > It might already be installed with iTerm2
    ```bash
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```
5. [Install and configure Powerlevel10k (ZSH Theme)](https://github.com/romkatv/powerlevel10k#installation)
    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```

    > The following must be above the `source $ZSH/oh-my-zsh.sh` line in .zshrc
    ```bash
     echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc
    ```

    Restart the terminal. It should show the Powerlevel10k configuration flow.

6. [Install VSCode](https://code.visualstudio.com/docs/setup/mac)
    
    Install and then [configure `code` command](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line).

    Download and install JetBrains Mono
    
    Login into Visual Studio Code using GitHub and sync settings