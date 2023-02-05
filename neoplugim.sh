##!/usr/bin/env bash
# Author: Javier Orfo
# Last Edited: 06 Jan 2023

echo -e "\033[0;33m"
echo -e "                        _             _           "
echo -e " _ __   ___  ___  _ __ | |_   _  __ _(_)_ __ ___  "
echo -e "| '_ \ / _ \/ _ \| '_ \| | | | |/ _' | | '_ ' _ \ "
echo -e "| | | |  __/ (_) | |_) | | |_| | (_| | | | | | | |"
echo -e "|_| |_|\___|\___/| .__/|_|\__,_|\__, |_|_| |_| |_|"
echo -e "                 |_|            |___/             "
echo -e "\033[0m"

if [ -e ~/.config/neoplugim/neoplugim.conf ]; then
    . ~/.config/neoplugim/neoplugim.conf
fi

echo "neoplugim ==> Starting!"
echo ""
read -p "Plugin name: " PLUGIN_NAME

if [ -z "$MAINTAINER" ]; then
    read -p "Maintainer: " MAINTAINER
fi

if [ -z "$REPO" ]; then
    read -p "URL repository: " REPO
fi

if [ -z "$GIT_IGN" ]; then
    while true; do
        read -p "With .gitignore? [y/n] " GIT_IGN
        case $GIT_IGN in 
            [YyNn] ) 
                break;;
            * ) echo -e "\033[0;31mneoplugim ==> Invalid response. Please, try again\033[0m";;
        esac
    done
fi

if [ -z "$README" ]; then
    while true; do
        read -p "With README.md? [y/n] " README
        case $README in 
            [YyNn] ) 
                break;;
            * ) echo -e "\033[0;31mneoplugim ==> Invalid response. Please, try again\033[0m";;
        esac
    done
fi

if [ -z "$MIT_LIC" ]; then
    while true; do
        read -p "With MIT License? [y/n] " MIT_LIC
        case $MIT_LIC in 
            [YyNn] ) 
                break;;
            * ) echo -e "\033[0;31mneoplugim ==> Invalid response. Please, try again\033[0m";;
        esac
    done
fi

echo ""
echo "neoplugim ==> Details:"
echo "          -> Name: $PLUGIN_NAME"
echo "          -> Maintainer: $MAINTAINER"
echo "          -> URL Repository: $REPO"
[[ $GIT_IGN =~ [yY] ]]   && echo "          -> With .gitignore"
[[ $README =~ [yY] ]]    && echo "          -> With README.md"
[[ $MIT_LIC =~ [yY] ]]   && echo "          -> With MIT License"
echo ""

generate_license() {
    echo "neoplugim ==> Generating MIT LICENSE..."
    touch $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE

    echo "MIT License" > $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "Copyright (c) $(date -u '+%Y') $MAINTAINER" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "Permission is hereby granted, free of charge, to any person obtaining a copy" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "of this software and associated documentation files (the \"Software\"), to deal" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "in the Software without restriction, including without limitation the rights" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "copies of the Software, and to permit persons to whom the Software is" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "furnished to do so, subject to the following conditions:" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
     
    echo "The above copyright notice and this permission notice shall be included in all" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "copies or substantial portions of the Software." >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
     
    echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY," >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM," >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE" >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE
    echo "SOFTWARE." >> $PLUGIN_PREFIX$PLUGIN_NAME/LICENSE

    echo "plugim ==> Done!"
}

generate_readmes() {
    if [[ $README =~ [yY] ]]; then
        touch $PLUGIN/README.md
        
        REPO_USER=$(cut -d "/" -f4 <<< $REPO)

        echo "# $PLUGIN" > $PLUGIN/README.md
        echo "*$PLUGIN is a plugin written in Lua.*" >> $PLUGIN/README.md
        echo "" >> $PLUGIN/README.md
        echo "## Caveats" >> $PLUGIN/README.md
        echo "- This plugin has been developed on and for Linux following open source philosophy." >> $PLUGIN/README.md
        echo "" >> $PLUGIN/README.md
        echo "## Installation" >> $PLUGIN/README.md
        echo "\`Vim Plug\`" >> $PLUGIN/README.md
        echo "\`\`\`vim" >> $PLUGIN/README.md
        echo "Plug '$REPO_USER/$PLUGIN'" >> $PLUGIN/README.md
        echo "\`\`\`" >> $PLUGIN/README.md
        echo "\`Packer\`" >> $PLUGIN/README.md
        echo "\`\`\`lua" >> $PLUGIN/README.md
        echo "use '$REPO_USER/$PLUGIN'" >> $PLUGIN/README.md
        echo "\`\`\`" >> $PLUGIN/README.md
        echo "" >> $PLUGIN/README.md
        echo "## Usage" >> $PLUGIN/README.md
        echo "- Set mappings in *init.vim* or *init.lua*" >> $PLUGIN/README.md
        echo "\`\`\`lua" >> $PLUGIN/README.md
        echo "print('something')" >> $PLUGIN/README.md
        echo "\`\`\`" >> $PLUGIN/README.md
        echo "" >> $PLUGIN/README.md
        echo "## Configuration" >> $PLUGIN/README.md
        echo "\`\`\`lua" >> $PLUGIN/README.md
        echo "print('configuration')" >> $PLUGIN/README.md
        echo "\`\`\`" >> $PLUGIN/README.md
        echo "" >> $PLUGIN/README.md
        echo "## Screenshots" >> $PLUGIN/README.md
        echo "### Something" >> $PLUGIN/README.md
        echo "" >> $PLUGIN/README.md
        echo "<img src=\"\" alt=\"something\" style=\"width:600px;\"/>" >> $PLUGIN/README.md
        if [ -v PAYPAL ] || [ -v BUY_ME_A_COFFEE ] || [ -v PATREON ]; then
            echo "" >> $PLUGIN/README.md
            echo "## Support" >> $PLUGIN/README.md
            [ -v PAYPAL ] && echo "- [Paypal]($PAYPAL)" >> $PLUGIN/README.md
            [ -v BUY_ME_A_COFFEE ] && echo "- [Buy Me A Coffee]($BUY_ME_A_COFFEE)" >> $PLUGIN/README.md
            [ -v PATREON ] && echo "- [Patreon]($PATREON)" >> $PLUGIN/README.md
        fi
    fi
}

copy_to_lua_file() {
    echo "$TOP_BOTTOM" > $1
    echo "$MAINTAINER_LABEL" >> $1
    echo "$URL_LABEL" >> $1
    echo "$LAST_CHANGE_LABEL" >> $1
    echo "$TOP_BOTTOM" >> $1
}

add_module_to_lua_file() {
    echo "" >> $1
    echo "local M = {}" >> $1
    echo "" >> $1
    echo "return M" >> $1
}

add_initials_to_plugin_lua() {
    echo "" >> $1
    echo "if vim.g.$PLUGIN_NAME then" >> $1
    echo "  return" >> $1
    echo "end" >> $1
    echo "" >> $1
    echo "vim.g.$PLUGIN_NAME = 1" >> $1
    echo "" >> $1
    echo "-- vim.api.nvim_create_user_command('Command', 'lua require(\"$PLUGIN_NAME\").some_function()', {})" >> $1
    echo "-- vim.api.nvim_set_keymap('n', '<Plug>Plug', '<cmd>lua require(\"$PLUGIN_NAME.core\").some_function()<CR>', {})" >> $1
}

generate_lua_heading() { 
    MAINTAINER_LABEL="-- # Maintainer:  $MAINTAINER" 
    URL_LABEL="-- # URL:         $REPO/$PLUGIN #"
    LAST_CHANGE_LABEL="-- # Last Change: $(LC_TIME=en_US.UTF-8 date -u '+%d %b %Y')"

    FINAL_SIZE=${#URL_LABEL}
    TOP_BOTTOM="-- "

    for n in $(seq 4 $FINAL_SIZE)
    do
        TOP_BOTTOM+="#"
    done
    
    MAINTAINER_SIZE=${#MAINTAINER_LABEL}
    for n in $(seq 2 $((FINAL_SIZE - MAINTAINER_SIZE)))
    do
        MAINTAINER_LABEL+=" "
    done
    MAINTAINER_LABEL+="#"
    
    LAST_CHANGE_SIZE=${#LAST_CHANGE_LABEL}
    for n in $(seq 2 $((FINAL_SIZE - LAST_CHANGE_SIZE)))
    do
        LAST_CHANGE_LABEL+=" "
    done
    LAST_CHANGE_LABEL+="#"

    copy_to_lua_file $PLUGIN/plugin/$PLUGIN_NAME.lua 
    copy_to_lua_file $PLUGIN/lua/$PLUGIN_NAME/core.lua
    copy_to_lua_file $PLUGIN/lua/$PLUGIN_NAME/init.lua
    copy_to_lua_file $PLUGIN/lua/$PLUGIN_NAME/utils.lua

    add_module_to_lua_file $PLUGIN/lua/$PLUGIN_NAME/core.lua
    add_module_to_lua_file $PLUGIN/lua/$PLUGIN_NAME/init.lua
    add_module_to_lua_file $PLUGIN/lua/$PLUGIN_NAME/utils.lua
    
    add_initials_to_plugin_lua $PLUGIN/plugin/$PLUGIN_NAME.lua 
}

generate_plugin() {
    echo "neoplugim ==> Generating directories..."

    # directories
    PLUGIN=$PLUGIN_PREFIX$PLUGIN_NAME
    mkdir -p $PLUGIN/plugin
    mkdir -p $PLUGIN/lua/$PLUGIN_NAME
    
    echo "neoplugim ==> Done!"
    
    echo "neoplugim ==> Generating Lua files..."
    
    touch $PLUGIN/plugin/$PLUGIN_NAME.lua
    touch $PLUGIN/lua/$PLUGIN_NAME/core.lua
    touch $PLUGIN/lua/$PLUGIN_NAME/init.lua
    touch $PLUGIN/lua/$PLUGIN_NAME/utils.lua
    
    generate_lua_heading

    echo "neoplugim ==> Done!"
    
    # Additional files
    [[ $GIT_IGN =~ [yY] ]]   && echo "neoplugim ==> Generating .gitignore..."; touch $PLUGIN/.gitignore
    [[ $MIT_LIC =~ [yY] ]]   && generate_license 
    generate_readmes 

}

while true; do
    read -p "neoplugim ==> Do you want to generate a Neovim plugin archetype with these settings? [y/n] " GENERATE
    case $GENERATE in 
        [Yy] ) echo "neoplugim ==> Generating Neovim plugin archetype...";
            generate_plugin
            break;;
        [Nn] ) echo "neoplugim ==> Process aborted.";
            exit 1;;
        * ) echo -e "\033[0;31mneoplugim ==> Invalid response. Please, try again\033[0m";;
    esac
done
