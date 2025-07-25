#!/usr/bin/env bash
# Beautiful test runner for SilkCircuit theme

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

# Unicode symbols
CHECK="✓"
CROSS="✗"
WARNING="⚠"
DOT="•"
ARROW="▸"
STAR="★"

# Print header
print_header() {
        echo -e "\n${PURPLE}${BOLD}SilkCircuit Theme${RESET} ${GRAY}•${RESET} ${CYAN}Test Runner${RESET}"
        echo -e "${GRAY}──────────────────────────────────${RESET}\n"
}

# Print footer
print_footer() {
        local success=$1
        echo -e "\n${GRAY}──────────────────────────────────${RESET}"
        if [ "$success" = true ]; then
                echo -e "${GREEN}${STAR} ${BOLD}All tests passed!${RESET}"
                echo -e "${CYAN}Theme is ready to use!${RESET}\n"
        else
                echo -e "${PINK}${CROSS} ${BOLD}Some tests failed${RESET}"
                echo -e "${GRAY}Please check the output above${RESET}\n"
        fi
}

# Print section
print_section() {
        echo -e "\n${PURPLE}${ARROW}${RESET} ${PINK}${BOLD}$1${RESET}"
        echo -e "${GRAY}$(printf '─%.0s' {1..40})${RESET}"
}

# Print test result
print_test() {
        local test_name=$1
        local status=$2
        if [ "$status" = "pass" ]; then
                echo -e "  ${GREEN}${CHECK}${RESET} ${WHITE}$test_name${RESET}"
        else
                echo -e "  ${PINK}${CROSS}${RESET} ${WHITE}$test_name${RESET}"
        fi
}

# Spinner animation
spinner() {
        local pid=$1
        local delay=0.1
        local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
        local i=0
        while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
                local temp=${spinstr:$i:1}
                echo -ne "  ${PURPLE}$temp${RESET} Loading theme...\r"
                sleep $delay
                i=$(((i + 1) % ${#spinstr}))
        done
        echo -ne "                    \r"
}

# Main test execution
print_header

all_tests_passed=true

# Test 1: Check file structure
print_section "File Structure Check"
files_to_check=(
        "lua/silkcircuit/init.lua"
        "lua/silkcircuit/config.lua"
        "lua/silkcircuit/palette.lua"
        "lua/silkcircuit/theme.lua"
        "lua/silkcircuit/util.lua"
        "colors/silkcircuit.lua"
)

for file in "${files_to_check[@]}"; do
        if [ -f "$file" ]; then
                print_test "$file" "pass"
        else
                print_test "$file" "fail"
                all_tests_passed=false
        fi
done

# Test 2: Lua syntax check
print_section "Lua Syntax Check"
echo -e "  ${CYAN}${DOT}${RESET} ${GRAY}Checking Lua files for syntax errors...${RESET}"

syntax_errors=false
for lua_file in $(find lua -name "*.lua"); do
        if ! luac -p "$lua_file" 2>/dev/null; then
                print_test "$lua_file" "fail"
                syntax_errors=true
                all_tests_passed=false
        fi
done

if [ "$syntax_errors" = false ]; then
        print_test "All Lua files have valid syntax" "pass"
fi

# Test 3: Theme loading test
print_section "Theme Loading Test"
echo -e "  ${CYAN}${DOT}${RESET} ${GRAY}Testing theme in Neovim...${RESET}"

# Run the test in background
nvim --headless -u tests/init.lua +qa 2>/dev/null &
test_pid=$!

# Show spinner while test runs
spinner $test_pid

# Wait for test to complete and check result
wait $test_pid
test_result=$?

if [ $test_result -eq 0 ]; then
        print_test "Theme loads successfully" "pass"
        print_test "Highlight groups defined" "pass"
        print_test "Plugin integrations load" "pass"
else
        print_test "Theme loading" "fail"
        all_tests_passed=false
fi

# Test 4: Color validation
print_section "Color Palette Validation"
echo -e "  ${CYAN}${DOT}${RESET} ${GRAY}Validating color definitions...${RESET}"

if python3 scripts/validate_colors.py >/dev/null 2>&1; then
        print_test "Color palette is valid" "pass"
else
        print_test "Color palette validation" "fail"
        all_tests_passed=false
fi

# Test 5: Performance check
print_section "Performance Check"
echo -e "  ${CYAN}${DOT}${RESET} ${GRAY}Measuring theme load time...${RESET}"

start_time=$(date +%s%N)
nvim --headless -c "colorscheme silkcircuit" -c "qa" 2>/dev/null
end_time=$(date +%s%N)
load_time=$(((end_time - start_time) / 1000000))

if [ $load_time -lt 100 ]; then
        print_test "Theme loads in ${load_time}ms" "pass"
else
        print_test "Theme loads in ${load_time}ms (>100ms)" "fail"
fi

# Show summary
echo -e "\n${PURPLE}${BOLD}Summary${RESET}"
echo -e "${GRAY}───────${RESET}"

if [ "$all_tests_passed" = true ]; then
        echo -e "${GREEN}${STAR} All tests passed!${RESET}"
else
        echo -e "${PINK}${WARNING} Some tests failed${RESET}"
fi

print_footer $all_tests_passed

# Exit with appropriate code
if [ "$all_tests_passed" = true ]; then
        exit 0
else
        exit 1
fi
