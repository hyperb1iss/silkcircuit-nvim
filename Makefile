.PHONY: help setup test lint format clean install-hooks compile

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
	@echo ""
	@echo "$(PURPLE)$(BOLD)SilkCircuit Theme$(RESET) $(GRAY)•$(RESET) $(CYAN)Development Commands$(RESET)"
	@echo "$(GRAY)────────────────────────────────────$(RESET)"
	@echo ""
	@echo "  $(PURPLE)$(STAR) setup$(RESET)          $(GRAY)─$(RESET) Install development dependencies"
	@echo "  $(PURPLE)$(STAR) test$(RESET)           $(GRAY)─$(RESET) Run all tests"
	@echo "  $(PURPLE)$(STAR) lint$(RESET)           $(GRAY)─$(RESET) Run linters (selene)"
	@echo "  $(PURPLE)$(STAR) format$(RESET)         $(GRAY)─$(RESET) Format code (stylua)"
	@echo "  $(PURPLE)$(STAR) clean$(RESET)          $(GRAY)─$(RESET) Clean generated files"
	@echo "  $(PURPLE)$(STAR) install-hooks$(RESET)  $(GRAY)─$(RESET) Install git pre-commit hooks"
	@echo "  $(PURPLE)$(STAR) compile$(RESET)        $(GRAY)─$(RESET) Compile theme for performance"
	@echo ""

# Install development dependencies
setup:
	@echo ""
	@echo "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Installing Development Dependencies$(RESET)"
	@echo ""
	@command -v selene >/dev/null 2>&1 || { \
		echo "  $(CYAN)$(DOT)$(RESET) Installing $(PURPLE)selene$(RESET)..."; \
		cargo install selene && echo "  $(GREEN)$(CHECK)$(RESET) selene installed"; \
	}
	@command -v stylua >/dev/null 2>&1 || { \
		echo "  $(CYAN)$(DOT)$(RESET) Installing $(PURPLE)stylua$(RESET)..."; \
		cargo install stylua && echo "  $(GREEN)$(CHECK)$(RESET) stylua installed"; \
	}
	@command -v pre-commit >/dev/null 2>&1 || { \
		echo "  $(CYAN)$(DOT)$(RESET) Installing $(PURPLE)pre-commit$(RESET)..."; \
		pip install --user pre-commit && echo "  $(GREEN)$(CHECK)$(RESET) pre-commit installed"; \
	}
	@echo "  $(CYAN)$(DOT)$(RESET) Installing pre-commit hooks..."
	@pre-commit install >/dev/null 2>&1 && echo "  $(GREEN)$(CHECK)$(RESET) Git hooks installed"
	@echo ""
	@echo "$(GREEN)$(STAR) Setup complete$(RESET)"
	@echo ""

# Run tests
test:
	@echo ""
	@echo "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Running Tests$(RESET)"
	@echo ""
	@cd $(shell pwd) && lua tests/run.lua

# Run linters
lint:
	@echo ""
	@echo "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Running Linters$(RESET)"
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Running selene..."
	@if ! selene lua/ 2>&1; then \
		echo ""; \
		echo "$(YELLOW)$(WARNING)$(RESET) Lua linting issues found"; \
		exit 1; \
	else \
		echo "  $(GREEN)$(CHECK)$(RESET) Lua code is clean"; \
	fi
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Running markdownlint..."
	@if ! markdownlint '**/*.md' 2>&1; then \
		echo ""; \
		echo "$(YELLOW)$(WARNING)$(RESET) Markdown linting issues found"; \
		exit 1; \
	else \
		echo "  $(GREEN)$(CHECK)$(RESET) Markdown is clean"; \
	fi
	@echo ""
	@echo "$(GREEN)$(STAR) All linting checks passed$(RESET)"
	@echo ""

# Format code
format:
	@echo ""
	@echo "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Formatting Code$(RESET)"
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Running stylua..."
	@echo "  $(YELLOW)$(DOT)$(RESET) Formatting Lua files..."
	@find . -name "*.lua" -type f | xargs stylua
	@echo "  $(GREEN)$(CHECK)$(RESET) Lua code formatted"
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Fixing file endings..."
	@find . -name "*.lua" -o -name "*.md" -type f | xargs -I {} sh -c 'tail -c1 {} | read -r _ || echo >> {}'
	@echo "  $(GREEN)$(CHECK)$(RESET) File endings fixed"
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Trimming trailing whitespace..."
	@find . -name "*.lua" -o -name "*.md" -type f | xargs sed -i '' -e 's/[[:space:]]*$$//'
	@echo "  $(GREEN)$(CHECK)$(RESET) Trailing whitespace removed"
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Running markdownlint..."
	@echo "  $(YELLOW)$(DOT)$(RESET) Formatting markdown files..."
	@markdownlint '**/*.md' --fix >/dev/null 2>&1 || true
	@echo "  $(GREEN)$(CHECK)$(RESET) Markdown formatted"
	@echo ""
	@echo "$(GREEN)$(STAR) All code beautified$(RESET)"
	@echo ""

# Clean generated files
clean:
	@echo ""
	@echo "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Cleaning Generated Files$(RESET)"
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Removing cache..."
	@rm -rf cache/
	@echo "  $(CYAN)$(DOT)$(RESET) Removing .luarc.json..."
	@rm -f .luarc.json
	@echo "  $(GREEN)$(CHECK)$(RESET) Clean complete"
	@echo ""

# Install git hooks
install-hooks:
	@echo ""
	@echo "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Installing Git Hooks$(RESET)"
	@echo ""
	@pre-commit install >/dev/null 2>&1
	@echo "  $(GREEN)$(CHECK)$(RESET) Git hooks installed"
	@echo ""

# Compile theme
compile:
	@echo ""
	@echo "$(PURPLE)$(ARROW)$(RESET) $(PINK)$(BOLD)Compiling Theme$(RESET)"
	@echo ""
	@echo "  $(CYAN)$(DOT)$(RESET) Generating optimized theme..."
	@nvim --headless -u scripts/compile.lua +qa 2>/dev/null
	@echo "  $(GREEN)$(CHECK)$(RESET) Theme compiled"
	@echo ""

# CI target
ci: lint test
	@echo ""
	@echo "$(GREEN)$(STAR) All CI checks passed$(RESET)"
	@echo ""
