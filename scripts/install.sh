#!/usr/bin/env bash
# Beautiful installer for SilkCircuit theme

# Colors matching SilkCircuit theme
PURPLE='\033[38;2;199;146;234m'
PINK='\033[38;2;255;88;116m'
CYAN='\033[38;2;127;219;202m'
GREEN='\033[38;2;173;219;103m'
YELLOW='\033[38;2;236;196;141m'
BLUE='\033[38;2;130;170;255m'
GRAY='\033[38;2;99;119;119m'
WHITE='\033[38;2;238;255;255m'
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

# Unicode symbols
CHECK="✓"
CROSS="✗"
WARNING="⚠"
DOT="•"
ARROW="▸"
STAR="★"

# Detect OS
OS="$(uname -s)"
ARCH="$(uname -m)"

# Print beautiful banner
print_banner() {
        clear
        echo -e "\n${PURPLE}${BOLD}SilkCircuit Theme${RESET} ${GRAY}•${RESET} ${CYAN}Synthwave Dreams for Neovim${RESET}"
        echo -e "${GRAY}────────────────────────────────────────────${RESET}\n"
}

# Animated progress bar
progress_bar() {
        local duration=$1
        local steps=30
        local step_duration=$(echo "scale=2; $duration / $steps" | bc)

        echo -ne "  ${GRAY}["
        for ((i = 0; i < $steps; i++)); do
                echo -ne "${PURPLE}█${RESET}"
                sleep $step_duration
        done
        echo -e "${GRAY}]${RESET} ${GREEN}${CHECK}${RESET}"
}

# Typing effect
type_text() {
        local text="$1"
        local delay=${2:-0.03}
        for ((i = 0; i < ${#text}; i++)); do
                echo -ne "${text:$i:1}"
                sleep $delay
        done
        echo
}

# Check dependencies
check_dependencies() {
        echo -e "\n${PURPLE}${ARROW}${RESET} ${PINK}${BOLD}Checking Dependencies${RESET}"
        echo -e "${GRAY}──────────────────────${RESET}\n"

        local deps_ok=true

        # Check Neovim
        echo -ne "  ${CYAN}${DOT}${RESET} Checking for Neovim... "
        if command -v nvim >/dev/null 2>&1; then
                local nvim_version=$(nvim --version | head -1 | cut -d' ' -f2)
                echo -e "${GREEN}${CHECK}${RESET} ${GRAY}(${nvim_version})${RESET}"
        else
                echo -e "${PINK}${CROSS}${RESET} ${GRAY}Not found${RESET}"
                deps_ok=false
        fi

        # Check Git
        echo -ne "  ${CYAN}${DOT}${RESET} Checking for Git... "
        if command -v git >/dev/null 2>&1; then
                echo -e "${GREEN}${CHECK}${RESET}"
        else
                echo -e "${PINK}${CROSS}${RESET}"
                deps_ok=false
        fi

        # Check terminal colors
        echo -ne "  ${CYAN}${DOT}${RESET} Checking terminal colors... "
        if [ -t 1 ] && [ -n "${TERM}" ] && [ "${TERM}" != "dumb" ]; then
                echo -e "${GREEN}${CHECK}${RESET} ${GRAY}(24-bit color support)${RESET}"
        else
                echo -e "${YELLOW}${WARNING}${RESET} ${GRAY}Limited color support${RESET}"
        fi

        return $([ "$deps_ok" = true ])
}

# Detect plugin manager
detect_plugin_manager() {
        echo -e "\n${PURPLE}${ARROW}${RESET} ${PINK}${BOLD}Detecting Plugin Manager${RESET}"
        echo -e "${GRAY}─────────────────────────${RESET}\n"

        local config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
        local detected=""

        # Check for lazy.nvim
        if [ -d "$config_dir/lazy" ] || grep -q "lazy" "$config_dir/init.lua" 2>/dev/null; then
                detected="lazy"
                echo -e "  ${GREEN}${CHECK}${RESET} Found ${PURPLE}lazy.nvim${RESET}"
        # Check for packer
        elif [ -d "$HOME/.local/share/nvim/site/pack/packer" ] || grep -q "packer" "$config_dir/init.lua" 2>/dev/null; then
                detected="packer"
                echo -e "  ${GREEN}${CHECK}${RESET} Found ${PURPLE}packer.nvim${RESET}"
        # Check for vim-plug
        elif [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ] || grep -q "plug#begin" "$config_dir/init.lua" 2>/dev/null; then
                detected="plug"
                echo -e "  ${GREEN}${CHECK}${RESET} Found ${PURPLE}vim-plug${RESET}"
        else
                echo -e "  ${YELLOW}${WARNING}${RESET} No plugin manager detected"
        fi

        echo "$detected"
}

# Install with plugin manager
install_with_plugin_manager() {
        local manager=$1

        echo -e "\n${PURPLE}${ARROW}${RESET} ${PINK}${BOLD}Installation Instructions${RESET}"
        echo -e "${GRAY}─────────────────────────${RESET}\n"

        case "$manager" in
        "lazy")
                echo -e "  ${CYAN}${DOT}${RESET} Add to your ${PURPLE}init.lua${RESET}:\n"
                echo -e "${DIM}${WHITE}"
                cat <<'EOF'
    {
      "hyperb1iss/silkcircuit-nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("silkcircuit").setup()
        vim.cmd.colorscheme("silkcircuit")
      end,
    }
EOF
                echo -e "${RESET}"
                ;;
        "packer")
                echo -e "  ${CYAN}${DOT}${RESET} Add to your ${PURPLE}init.lua${RESET}:\n"
                echo -e "${DIM}${WHITE}"
                cat <<'EOF'
    use {
      "hyperb1iss/silkcircuit-nvim",
      config = function()
        require("silkcircuit").setup()
        vim.cmd.colorscheme("silkcircuit")
      end
    }
EOF
                echo -e "${RESET}"
                ;;
        "plug")
                echo -e "  ${CYAN}${DOT}${RESET} Add to your ${PURPLE}init.vim${RESET}:\n"
                echo -e "${DIM}${WHITE}"
                cat <<'EOF'
    Plug 'hyperb1iss/silkcircuit-nvim'
    colorscheme silkcircuit
EOF
                echo -e "${RESET}"
                ;;
        *)
                echo -e "  ${CYAN}${DOT}${RESET} Manual installation:\n"
                echo -e "  ${GRAY}1. Clone the repository:${RESET}"
                echo -e "     ${DIM}git clone https://github.com/hyperb1iss/silkcircuit-nvim.git \\${RESET}"
                echo -e "     ${DIM}  ~/.local/share/nvim/site/pack/silkcircuit/start/silkcircuit-nvim${RESET}\n"
                echo -e "  ${GRAY}2. Add to your config:${RESET}"
                echo -e "     ${DIM}vim.cmd.colorscheme('silkcircuit')${RESET}"
                ;;
        esac
}

# Show configuration options
show_config_options() {
        echo -e "\n${PURPLE}${ARROW}${RESET} ${PINK}${BOLD}Configuration Options${RESET}"
        echo -e "${GRAY}─────────────────────${RESET}\n"

        echo -e "  ${CYAN}Customization examples:${RESET}\n"

        # Transparent background
        echo -e "  ${GRAY}• Transparent background:${RESET}"
        echo -e "    ${DIM}require('silkcircuit').setup({ transparent = true })${RESET}\n"

        # Style options
        echo -e "  ${GRAY}• Style customization:${RESET}"
        echo -e "    ${DIM}require('silkcircuit').setup({"
        echo -e "      styles = {"
        echo -e "        comments = { italic = true },"
        echo -e "        keywords = { bold = true },"
        echo -e "      }"
        echo -e "    })${RESET}\n"

        # Plugin integrations
        echo -e "  ${GRAY}• Disable plugin themes:${RESET}"
        echo -e "    ${DIM}require('silkcircuit').setup({"
        echo -e "      integrations = {"
        echo -e "        telescope = false,"
        echo -e "      }"
        echo -e "    })${RESET}"
}

# Terminal themes
show_terminal_themes() {
        echo -e "\n${PURPLE}${ARROW}${RESET} ${PINK}${BOLD}Terminal Themes${RESET}"
        echo -e "${GRAY}────────────────${RESET}\n"

        echo -e "  ${CYAN}${DOT}${RESET} Available in ${PURPLE}extras/${RESET} directory:"
        echo -e "    ${GRAY}•${RESET} Alacritty  ${DIM}(alacritty.yml)${RESET}"
        echo -e "    ${GRAY}•${RESET} Kitty      ${DIM}(kitty.conf)${RESET}"
        echo -e "    ${GRAY}•${RESET} WezTerm    ${DIM}(wezterm.lua)${RESET}"
        echo -e "    ${GRAY}•${RESET} Windows Terminal ${DIM}(windows_terminal.json)${RESET}"
}

# Success message
show_success() {
        echo -e "\n${GRAY}────────────────────────────────────────────${RESET}"
        echo -e "${GREEN}${STAR} ${BOLD}Installation Complete!${RESET}"
        echo -e "${PURPLE}Enjoy your new synthwave experience!${RESET}\n"
}

# Main installation flow
main() {
        print_banner

        # Welcome message with typing effect
        echo -ne "  ${CYAN}"
        type_text "Welcome to the SilkCircuit theme installer!" 0.02
        echo -e "${RESET}"

        sleep 0.5

        # Check dependencies
        if ! check_dependencies; then
                echo -e "\n${PINK}${CROSS}${RESET} Missing dependencies. Please install Neovim and Git first."
                exit 1
        fi

        # Detect plugin manager
        plugin_manager=$(detect_plugin_manager)

        # Show installation instructions
        install_with_plugin_manager "$plugin_manager"

        # Show configuration options
        show_config_options

        # Show terminal themes
        show_terminal_themes

        # Success message
        show_success

        # Quick tips
        echo -e "${GRAY}  Quick tips:${RESET}"
        echo -e "  ${PURPLE}${DOT}${RESET} Run ${CYAN}:checkhealth${RESET} in Neovim to verify installation"
        echo -e "  ${PURPLE}${DOT}${RESET} Use ${CYAN}:SilkCircuit compile${RESET} for faster loading"
        echo -e "  ${PURPLE}${DOT}${RESET} Visit ${BLUE}github.com/hyperb1iss/silkcircuit-nvim${RESET} for docs\n"
}

# Run the installer
main
