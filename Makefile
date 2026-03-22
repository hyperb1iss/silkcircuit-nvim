.PHONY: help setup test lint format clean install-hooks compile vscode vscode-package vscode-publish-vsce vscode-publish-ovsx vscode-publish chrome

# Colors matching SilkCircuit theme
PURPLE := \033[38;2;199;146;234m
PINK := \033[38;2;255;88;116m
CYAN := \033[38;2;127;219;202m
GREEN := \033[38;2;173;219;103m
YELLOW := \033[38;2;236;196;141m
BLUE := \033[38;2;130;170;255m
GRAY := \033[38;2;99;119;119m
WHITE := \033[38;2;238;255;255m
RESET := \033[0m
BOLD := \033[1m

# Unicode symbols
CHECK := ✓
ARROW := ▸
DOT := •
STAR := ★

# Default target
help:
	@printf "\n"
	@printf "$(PURPLE)$(BOLD)SilkCircuit Theme$(RESET) $(GRAY)•$(RESET) $(CYAN)Development Commands$(RESET)\n"
	@printf "$(GRAY)────────────────────────────────────$(RESET)\n"
	@printf "\n"
	@printf "  $(PURPLE)$(STAR) setup$(RESET)          $(GRAY)─$(RESET) Install development dependencies\n"
	@printf "  $(PURPLE)$(STAR) test$(RESET)           $(GRAY)─$(RESET) Run all tests\n"
	@printf "  $(PURPLE)$(STAR) lint$(RESET)           $(GRAY)─$(RESET) Run linters (selene)\n"
	@printf "  $(PURPLE)$(STAR) format$(RESET)         $(GRAY)─$(RESET) Format code (stylua)\n"
	@printf "  $(PURPLE)$(STAR) clean$(RESET)          $(GRAY)─$(RESET) Clean generated files\n"
	@printf "  $(PURPLE)$(STAR) install-hooks$(RESET)  $(GRAY)─$(RESET) Install git pre-commit hooks\n"
	@printf "  $(PURPLE)$(STAR) compile$(RESET)        $(GRAY)─$(RESET) Compile theme for performance\n"
	@printf "  $(PURPLE)$(STAR) chrome$(RESET)         $(GRAY)─$(RESET) Generate Chrome theme variants\n"
	@printf "  $(PURPLE)$(STAR) vscode$(RESET)         $(GRAY)─$(RESET) Build VSCode theme package\n"
	@printf "  $(PURPLE)$(STAR) vscode-package$(RESET)  $(GRAY)─$(RESET) Package VSCode extension (VSIX)\n"
	@printf "  $(PURPLE)$(STAR) vscode-publish$(RESET)  $(GRAY)─$(RESET) Publish to VSCode + Open VSX (requires tokens)\n"
	@printf "\n"

# Install development dependencies
setup:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Installing Development Dependencies$(RESET)\n"
	@printf "\n"
	@command -v selene >/dev/null 2>&1 || { \
		printf "  $(CYAN)$(DOT)$(RESET) Installing $(PURPLE)selene$(RESET)...\n"; \
		cargo install selene && printf "  $(GREEN)$(CHECK)$(RESET) selene installed\n"; \
	}
	@command -v stylua >/dev/null 2>&1 || { \
		printf "  $(CYAN)$(DOT)$(RESET) Installing $(PURPLE)stylua$(RESET)...\n"; \
		cargo install stylua && printf "  $(GREEN)$(CHECK)$(RESET) stylua installed\n"; \
	}
	@command -v pre-commit >/dev/null 2>&1 || { \
		printf "  $(CYAN)$(DOT)$(RESET) Installing $(PURPLE)pre-commit$(RESET)...\n"; \
		pip install --user pre-commit && printf "  $(GREEN)$(CHECK)$(RESET) pre-commit installed\n"; \
	}
	@printf "  $(CYAN)$(DOT)$(RESET) Installing pre-commit hooks...\n"
	@pre-commit install >/dev/null 2>&1 && printf "  $(GREEN)$(CHECK)$(RESET) Git hooks installed\n"
	@printf "\n"
	@printf "$(GREEN)$(STAR) Setup complete$(RESET)\n"
	@printf "\n"

# Run tests
test:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Running Tests$(RESET)\n"
	@printf "\n"
	@cd $(shell pwd) && nvim --headless -u NONE -c "luafile tests/run.lua" 2>&1

# Run linters
lint:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Running Linters$(RESET)\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Running selene...\n"
	@if ! selene lua/ 2>&1; then \
		printf "\n"; \
		printf "$(YELLOW)$(WARNING)$(RESET) Lua linting issues found\n"; \
		exit 1; \
	else \
		printf "  $(GREEN)$(CHECK)$(RESET) Lua code is clean\n"; \
	fi
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Running markdownlint...\n"
	@if ! markdownlint '**/*.md' 2>&1; then \
		printf "\n"; \
		printf "$(YELLOW)$(WARNING)$(RESET) Markdown linting issues found\n"; \
		exit 1; \
	else \
		printf "  $(GREEN)$(CHECK)$(RESET) Markdown is clean\n"; \
	fi
	@printf "\n"
	@printf "$(GREEN)$(STAR) All linting checks passed$(RESET)\n"
	@printf "\n"

# Format code
format:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Formatting Code$(RESET)\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Running stylua...\n"
	@printf "  $(YELLOW)$(DOT)$(RESET) Formatting Lua files...\n"
	@find . -name "*.lua" -type f | xargs stylua
	@printf "  $(GREEN)$(CHECK)$(RESET) Lua code formatted\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Running prettier...\n"
	@printf "  $(YELLOW)$(DOT)$(RESET) Formatting JSON/YAML files...\n"
	@npx prettier --write "**/*.{json,yaml,yml}" --ignore-path .gitignore >/dev/null 2>&1
	@printf "  $(GREEN)$(CHECK)$(RESET) JSON/YAML formatted\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Fixing file endings...\n"
	@find . -name "*.lua" -o -name "*.md" -type f | xargs -I {} sh -c 'tail -c1 {} | read -r _ || echo >> {}'
	@printf "  $(GREEN)$(CHECK)$(RESET) File endings fixed\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Trimming trailing whitespace...\n"
	@find . -name "*.lua" -o -name "*.md" -type f | xargs sed -i '' -e 's/[[:space:]]*$$//'
	@printf "  $(GREEN)$(CHECK)$(RESET) Trailing whitespace removed\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Running markdownlint...\n"
	@printf "  $(YELLOW)$(DOT)$(RESET) Formatting markdown files...\n"
	@markdownlint '**/*.md' --fix >/dev/null 2>&1 || true
	@printf "  $(GREEN)$(CHECK)$(RESET) Markdown formatted\n"
	@printf "\n"
	@printf "$(GREEN)$(STAR) All code beautified$(RESET)\n"
	@printf "\n"

# Clean generated files
clean:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Cleaning Generated Files$(RESET)\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Removing cache...\n"
	@rm -rf cache/
	@printf "  $(CYAN)$(DOT)$(RESET) Removing .luarc.json...\n"
	@rm -f .luarc.json
	@printf "  $(GREEN)$(CHECK)$(RESET) Clean complete\n"
	@printf "\n"

# Install git hooks
install-hooks:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Installing Git Hooks$(RESET)\n"
	@printf "\n"
	@pre-commit install >/dev/null 2>&1
	@printf "  $(GREEN)$(CHECK)$(RESET) Git hooks installed\n"
	@printf "\n"

# Compile theme
compile:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Compiling Theme$(RESET)\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Generating optimized theme...\n"
	@nvim --headless -u scripts/compile.lua +qa 2>/dev/null
	@printf "  $(GREEN)$(CHECK)$(RESET) Theme compiled\n"
	@printf "\n"

# Build VSCode theme
vscode:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Building VSCode Theme$(RESET)\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Packaging extension...\n"
	@cd extras/vscode && npx @vscode/vsce package --no-dependencies 2>/dev/null
	@printf "  $(GREEN)$(CHECK)$(RESET) Theme packaged → extras/vscode/silkcircuit-theme-1.0.0.vsix\n"
	@printf "\n"
	@printf "$(CYAN)$(STAR) Install in VSCode/Cursor:$(RESET)\n"
	@printf "  $(GRAY)Extensions → ... → Install from VSIX$(RESET)\n"
	@printf "\n"

# Explicit packaging target
vscode-package:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Packaging VSCode Extension (VSIX)$(RESET)\n"
	@printf "\n"
	@cd extras/vscode && npx @vscode/vsce package --no-dependencies | cat
	@printf "  $(GREEN)$(CHECK)$(RESET) VSIX created in extras/vscode/\n"

# Publish to VS Code Marketplace (requires VSCE_PAT)
vscode-publish-vsce:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Publishing to VS Code Marketplace$(RESET)\n"
	@printf "\n"
	@cd extras/vscode && npx @vscode/vsce publish --no-dependencies | cat
	@printf "  $(GREEN)$(CHECK)$(RESET) Published to VS Code Marketplace\n"

# Publish to Open VSX (requires OVSX_PAT)
vscode-publish-ovsx:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Publishing to Open VSX$(RESET)\n"
	@printf "\n"
	@cd extras/vscode && npx ovsx publish | cat
	@printf "  $(GREEN)$(CHECK)$(RESET) Published to Open VSX\n"

# Convenience aggregator target
vscode-publish: vscode-publish-vsce vscode-publish-ovsx
	@printf "\n"
	@printf "$(GREEN)$(STAR) VSCode extension published to both marketplaces$(RESET)\n"
	@printf "\n"

# Build Chrome themes (all 5 variants)
chrome:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Generating Chrome Themes$(RESET)\n"
	@printf "\n"
	@printf "  $(CYAN)$(DOT)$(RESET) Generating all 5 variants...\n"
	@python3 scripts/generate_chrome_themes.py
	@printf "  $(GREEN)$(CHECK)$(RESET) Chrome themes generated → extras/chrome-theme/silkcircuit-*/\n"
	@printf "\n"
	@printf "$(CYAN)$(STAR) Load in Chrome:$(RESET)\n"
	@printf "  $(GRAY)chrome://extensions → Developer mode → Load unpacked$(RESET)\n"
	@printf "\n"

# Package Chrome themes as .zip files for Chrome Web Store
chrome-package:
	@printf "\n"
	@printf "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Packaging Chrome Themes$(RESET)\n"
	@printf "\n"
	@for variant in neon vibrant soft glow dawn; do \
		cd extras/chrome-theme && \
		zip -r "../../silkcircuit-chrome-$$variant.zip" "silkcircuit-$$variant/" \
			-x "*.DS_Store" 2>/dev/null && \
		cd ../.. && \
		printf "  $(GREEN)$(CHECK)$(RESET) silkcircuit-chrome-$$variant.zip\n"; \
	done
	@printf "\n"
	@printf "$(CYAN)$(STAR) Upload to Chrome Web Store:$(RESET)\n"
	@printf "  $(GRAY)https://chrome.google.com/webstore/devconsole$(RESET)\n"
	@printf "\n"

# CI target
ci: lint test
	@printf "\n"
	@printf "$(GREEN)$(STAR) All CI checks passed$(RESET)\n"
	@printf "\n"
