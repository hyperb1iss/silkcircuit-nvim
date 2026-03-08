#!/usr/bin/env bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# SilkCircuit Universal Installer
# Detect installed apps and theme everything in neon
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -euo pipefail

# ─── Color codes ─────────────────────────────────────────────────────────────
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
PURPLE='\033[38;2;225;53;255m'
CYAN='\033[38;2;128;255;234m'
PINK='\033[38;2;255;0;255m'
GREEN='\033[38;2;80;250;123m'
YELLOW='\033[38;2;241;250;140m'
RED='\033[38;2;255;99;99m'
CORAL='\033[38;2;255;106;193m'
BLUE='\033[38;2;130;170;255m'
WHITE='\033[38;2;248;248;242m'
GRAY='\033[38;2;99;119;119m'
BG_DARK='\033[48;2;18;16;26m'
BG_PURPLE='\033[48;2;40;20;60m'

# ─── Globals ─────────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXTRAS_DIR="${SCRIPT_DIR}/extras"
DETECTED=()
INSTALLED=()
SKIPPED=()
FAILED=()
DRY_RUN=false
INTERACTIVE=true

# ─── Neon UI primitives ─────────────────────────────────────────────────────
glow() { printf "${PURPLE}${BOLD}%s${RESET}" "$*"; }
spark() { printf "${CYAN}%s${RESET}" "$*"; }
flash() { printf "${PINK}${BOLD}%s${RESET}" "$*"; }
success() { printf "${GREEN}${BOLD}  %s${RESET}\n" "$*"; }
warn() { printf "${YELLOW}  ! %s${RESET}\n" "$*"; }
fail() { printf "${RED}  x %s${RESET}\n" "$*"; }
info() { printf "${WHITE}  %s${RESET}\n" "$*"; }
diminfo() { printf "${GRAY}    %s${RESET}\n" "$*"; }

neon_line() {
    printf "${PURPLE}"
    printf '  %.0s' {1..2}
    local i
    for i in $(seq 1 "$1"); do
        local r=$((225 - i * 2))
        local g=$((53 + i * 3))
        local b=255
        printf '\033[38;2;%d;%d;%dm━' "$r" "$g" "$b"
    done
    printf "${RESET}\n"
}

pulse_dot() {
    local label="$1"
    local status="$2"
    if [[ "$status" == "found" ]]; then
        printf "${GREEN}${BOLD}  [+]${RESET} ${WHITE}%s${RESET}\n" "$label"
    else
        printf "${GRAY}  [ ] %s${RESET}\n" "$label"
    fi
}

# ─── Embedded logo (pre-rendered truecolor block art, zero dependencies) ────
# Generated from assets/icon.png via chafa - centered neon circuit S logo
# with gradient "SILKCIRCUIT" title and tagline baked in
LOGO_B64="ICAgICAgICAgICAbWzBtG1szODsyOzIzOzg7MzE7NDg7MjsxNzs4OzI3beKWlxtbMzg7MjsxOTQ7
NjsxMjc7NDg7Mjs0Nzs4OzQ0beKWlxtbMzg7MjsxNjE7ODsxMDg7NDg7MjszODs4OzQxbeKWhhtb
Mzg7MjszMDsxMzsyOTs0ODsyOzE2Nzs3OzExN23iloMbWzM4OzI7MjA7MTM7MjM7NDg7MjsxNjc7
NzsxMTlt4paDG1szODsyOzE5OzEzOzIzOzQ4OzI7MTY2Ozg7MTIwbeKWgxtbMzg7MjsxOTsxMzsy
Mjs0ODsyOzE2Njs4OzEyMW3iloMbWzQ4OzI7MTY1Ozg7MTIxbeKWgxtbNDg7MjsxNjY7ODsxMjJt
4paD4paDG1szODsyOzE5OzE0OzIybeKWgxtbNDg7MjsxNjY7ODsxMjNt4paDG1szODsyOzIwOzE0
OzIzbeKWg+KWgxtbNDg7MjsxNjU7ODsxMjRt4paDG1s0ODsyOzE2NDs5OzEyNW3iloMbWzQ4OzI7
MTY0Ozk7MTI3beKWgxtbNDg7MjsxNjI7OTsxMjdt4paDG1szODsyOzIwOzE1OzIzOzQ4OzI7MTYx
Ozk7MTI4beKWgxtbMzg7MjsyMTsxNDsyNDs0ODsyOzE2MDsxMDsxMzBt4paDG1szODsyOzMwOzE1
OzMyOzQ4OzI7MTU1OzEyOzEzMW3iloMbWzM4OzI7MTM5OzE5OzEyODs0ODsyOzM3Ozk7NDZt4paG
G1szODsyOzE2MjsyNTsxNTc7NDg7Mjs0MzsxMjs1M23ilpYbWzM4OzI7MjE7MTA7MzQ7NDg7Mjsx
Nzs5OzI4beKWlhtbMG0KICAgICAgICAgICAbWzM4OzI7MzM7ODszNzs0ODsyOzE2OTs3OzExMm3i
loobWzM4OzI7MjExOzU7MTM1OzQ4OzI7ODY7MTI7NjBt4paLG1szODsyOzQwOzE0OzM0OzQ4OzI7
MjI7MTM7MjRt4paPG1szODsyOzE3OzExOzI0OzQ4OzI7NDE7MTA7Mzlt4paBG1szODsyOzkxOzc7
NzQ7NDg7Mjs0MjsxMDs0MG3ilpcbWzM4OzI7Nzc7Nzs2NDs0ODsyOzQ0OzEwOzQxbeKWlhtbMzg7
Mjs1OTsxMDs1MDs0ODsyOzE4OzE1OzI4beKWjxtbMzg7MjsxNzsxMzsyMTs0ODsyOzE2OzI5OzUx
beKWlBtbMzg7MjsxNjs0OTs4MTs0ODsyOzE3OzEzOzIxbeKWhRtbMzg7MjsyMTsyODs1NDs0ODsy
OzE5OzI0OzQzbeKWlRtbMzg7MjsyNTs0MDs3Nm3ilo8bWzM4OzI7MjI7NDI7NzY7NDg7MjsyMDsx
ODszMm3ilpYbWzM4OzI7MjM7MTQ7MjQ7NDg7MjszNTsyMjs1MG3iloobWzM4OzI7NDI7MjU7NTc7
NDg7MjszMjsyMDs0M23ilpUbWzM4OzI7NTU7Mjk7NzU7NDg7MjszMzsxOTs0M23ilpcbWzM4OzI7
NTA7Mjk7Njg7NDg7MjsyOTsxODszOW3ilpUbWzM4OzI7MjU7MTY7MzI7NDg7MjsyOTsxODszOG3i
lo8bWzM4OzI7NDk7MzA7NzA7NDg7MjsyOTsxOTs0MW3ilo8bWzM4OzI7NDM7Mjg7NjQ7NDg7Mjsy
MzsxNjszMW3ilpYbWzM4OzI7MTg7MTQ7MjE7NDg7MjsxNTsxMzsyMG3iloAbWzM4OzI7MTY7MTM7
MjA7NDg7MjsyNDsxNjsyMW3iloEbWzM4OzI7MzM7MTc7Mzc7NDg7MjsyMDsxNDsyNG3ilpUbWzM4
OzI7NjY7MjE7Njc7NDg7MjsxNTU7NDA7MTY0beKWjRtbMzg7MjsxMjg7MzY7MTQxOzQ4OzI7Mjk7
MTM7NDFt4paOG1swbQogICAgICAgICAgIBtbMzg7MjsyMzs4OzMyOzQ4OzI7MTkwOzc7MTI0beKW
ixtbMzg7MjsyMDk7NTsxMzY7NDg7MjsyNjsxNDsyNW3ilosbWzM4OzI7MjI7MTQ7MjM7NDg7Mjsx
NzsxMzsyMm3ilo4bWzM4OzI7Mzc7MTA7Mzc7NDg7MjsxNjsxMTsyMm3ilpUbWzM4OzI7NTY7OTs1
Mzs0ODsyOzQ0OzEwOzQzbeKWjxtbNDg7Mjs0NzsxMDs0Nm3ilpgbWzM4OzI7NTY7MTE7NTQ7NDg7
MjszOTsxMTs0Mm3ilo8bWzM4OzI7MTM2OzE4OzEwODs0ODsyOzM1OzEyOzQybeKWghtbMzg7Mjs0
MzsxMzs0NDs0ODsyOzE3MjsxNjsxMjlt4paAG1szODsyOzEzNDsxNDsxMDA7NDg7MjsyNzsxMjsz
Mm3iloYbWzM4OzI7MTMxOzE0Ozk3OzQ4OzI7Mjk7MTM7MzRt4paGG1szODsyOzEzMDsxNTs5Njs0
ODsyOzMwOzEzOzM0beKWhuKWhhtbNDg7MjsyOTsxMzszM23iloYbWzM4OzI7MTMwOzE1Ozk1OzQ4
OzI7Mjg7MTM7MzFt4paGG1szODsyOzkzOzEzOzcwOzQ4OzI7Mjk7MTM7MzBt4paOG1szODsyOzIw
OzE0OzMwOzQ4OzI7MjA7MTI7MjRt4paVG1szODsyOzIxOzE1OzM0OzQ4OzI7MjE7MTM7Mjlt4pad
G1szODsyOzI3OzE1OzM3OzQ4OzI7MjA7MTQ7MzBt4paBG1szODsyOzI1OzE2OzQwOzQ4OzI7MTk7
MTQ7Mjht4paBG1szODsyOzIyOzE2OzM2OzQ4OzI7MTY7MTM7MjJt4paBG1szODsyOzE3OzE0OzIx
OzQ4OzI7MjE7MTY7MjVt4paKG1szODsyOzIzOzE3OzI4OzQ4OzI7MTMzOzU0OzE2M23ilo0bWzM4
OzI7MTI2OzUxOzE1NTs0ODsyOzIzOzEzOzM3beKWjRtbMG0KICAgICAgICAgICAbWzM4OzI7MjM7
ODszMzs0ODsyOzE4Mzs5OzEyNm3ilosbWzM4OzI7MjAyOzg7MTM4OzQ4OzI7MjM7MTU7MjRt4paL
G1szODsyOzE5OzE0OzIyOzQ4OzI7MTY7MTM7MjFt4paNG1szODsyOzE1OzEyOzIxOzQ4OzI7MTY7
MTM7MjJt4paPG1szODsyOzE2OzEyOzIzOzQ4OzI7MTc7MTQ7NDFt4paKG1szODsyOzM5OzE0OzUz
OzQ4OzI7Mjg7MTM7NDBt4paVG1szODsyOzE2NDszNjsxNTI7NDg7Mjs3NjsyMDs3N23ilpcbWzM4
OzI7NTk7MTg7NTg7NDg7MjsxNTk7MjI7MTI4beKWhRtbMzg7Mjs2NjsxNzs1OTs0ODsyOzMyOzE1
OzM1beKWlBtbMzg7MjsxNzI7MTU7MTI4OzQ4OzI7Mzg7MTQ7Mzht4paDG1szODsyOzE2NTsxNTsx
MjI7NDg7MjsyOTsxNDszMm3iloUbWzM4OzI7MTYxOzE2OzEyMTs0ODsyOzMwOzE0OzMzbeKWhRtb
Mzg7MjsxNjA7MTc7MTIxOzQ4OzI7MzA7MTQ7MzJt4paFG1szODsyOzE1OTsxOTsxMjNt4paFG1sz
ODsyOzE1ODsxOTsxMjQ7NDg7MjsyOTsxNDszMm3iloUbWzM4OzI7MTU3OzIwOzEyNDs0ODsyOzI4
OzE0OzMxbeKWhRtbMzg7MjsxNjU7MjA7MTMwOzQ4OzI7NDQ7MTQ7NDJt4paFG1szODsyOzY5OzE2
OzYzOzQ4OzI7MTY1OzE4OzEyOG3ilpcbWzM4OzI7MTA4OzIwOzk1OzQ4OzI7MTU4OzIxOzEzMW3i
lpYbWzM4OzI7Nzg7MTg7NzM7NDg7MjsyMjsxNTsyN23ilo8bWzM4OzI7MjQ7MTY7Mzc7NDg7Mjsx
NjsxMzsyMG3ilpQbWzM4OzI7MTc7MTQ7MjE7NDg7MjsyMDsxNjsyNW3iloobWzM4OzI7MjI7MTg7
Mjc7NDg7MjsxMDY7NzE7MTY3beKWjRtbMzg7Mjs5Njs2OTsxNTg7NDg7MjsyMTsxNDszN23ilo0b
WzBtCiAgICAgICAgICAgG1szODsyOzIzOzk7MzQ7NDg7MjsxNzI7MTc7MTMybeKWixtbMzg7Mjsx
OTA7MTc7MTQ1OzQ4OzI7MjM7MTU7MjZt4paLG1szODsyOzIwOzE1OzI0OzQ4OzI7MTc7MTM7MjJt
4paOG1szODsyOzQzOzEyOzUyOzQ4OzI7MTk7MTI7MjVt4paBG1szODsyOzY5OzEzOzcxOzQ4OzI7
MjA7MTI7MjVt4paCG1szODsyOzY4OzE2Ozc0OzQ4OzI7MjY7MTM7MzJt4paCG1szODsyOzM4OzE5
OzQ1OzQ4OzI7MTM1OzQ1OzE0OW3ilpUbWzM4OzI7MzA7MTY7Mzc7NDg7MjsyNTsxNDszMW3ilo4b
WzM4OzI7MTczOzIyOzE0Mjs0ODsyOzM2OzE2OzM5beKWkBtbMzg7MjsxODI7MjE7MTQ4OzQ4OzI7
ODI7MTg7NzNt4paLG1szODsyOzQyOzE3OzQzOzQ4OzI7MjY7MTU7MzBt4paPG1szODsyOzI3OzE1
OzI5OzQ4OzI7MjA7MTQ7MjVt4paUG1szODsyOzE4OzE0OzI0OzQ4OzI7MjQ7MTQ7Mjdt4paGG1sz
ODsyOzE5OzE0OzI0OzQ4OzI7MjU7MTQ7Mjht4paGG1szODsyOzIyOzE5OzM0OzQ4OzI7MjI7MTQ7
Mjdt4paBG1szODsyOzE5OzE0OzI1OzQ4OzI7MjY7MTQ7Mjlt4paGG1szODsyOzQ4OzE2OzQ3OzQ4
OzI7MjA7MTQ7MjVt4paUG1szODsyOzI2OzE0OzI5OzQ4OzI7MTY2OzI1OzEzOW3iloYbWzM4OzI7
MjE7MTQ7MjU7NDg7MjsxMzQ7MjQ7MTE3beKWhhtbMzg7MjsyMTsxNTsyNDs0ODsyOzE2OzEzOzIw
beKWlBtbMzg7MjsxNTsxMzsyMDs0ODsyOzE1OzEzOzE5beKWghtbMzg7MjsxNjsxNDsyMTs0ODsy
OzE5OzE3OzI2beKWihtbMzg7MjsyMDsxODsyOTs0ODsyOzcyOzk0OzE3MG3ilo0bWzM4OzI7NjQ7
OTE7MTYxOzQ4OzI7MjA7MTY7Mzht4paNG1swbQogICAgICAgICAgIBtbMzg7MjsyMzsxMTszNTs0
ODsyOzE1MTszMzsxNDBt4paLG1szODsyOzE2NTszNTsxNTQ7NDg7MjsyMzsxNjsyNm3ilosbWzM4
OzI7MTY7MTM7MjI7NDg7MjsxOTsxNDsyNG3ilpAbWzM4OzI7NDU7MTM7NTg7NDg7MjsxODsxMjsy
Nm3ilpQbWzM4OzI7OTQ7MTM7OTY7NDg7MjszNzsxMzs1NG3ilpQbWzM4OzI7NjA7MTY7OTM7NDg7
Mjs0MTsxNjs1NG3iloIbWzM4OzI7MzA7MjA7NDE7NDg7MjsxMTM7NjI7MTYxbeKWlRtbMzg7Mjsz
MjsxOTs0ODs0ODsyOzI4OzE2OzM3beKWghtbMzg7Mjs5NDsyNDs5Mjs0ODsyOzI5OzE3OzQwbeKW
nRtbMzg7Mjs0MTsyMjs1Mzs0ODsyOzE1MTszODsxNTJt4paDG1szODsyOzY2OzM5OzkxOzQ4OzI7
MTI5OzQ1OzE0Nm3iloEbWzM4OzI7MTIwOzU4OzE1Nzs0ODsyOzM3OzIxOzQ3beKWhRtbMzg7Mjsx
MDE7NjQ7MTQ5OzQ4OzI7MjU7MTk7MzZt4paDG1szODsyOzYzOzUyOzEwNzs0ODsyOzIzOzIxOzM5
beKWgRtbMzg7MjsyMjszMDs1Mzs0ODsyOzY3Ozc1OzEzN23iloMbWzM4OzI7NDY7ODg7MTM5OzQ4
OzI7MjE7MjQ7NDFt4paFG1szODsyOzI3Ozc4OzExMjs0ODsyOzE4OzIwOzM0beKWghtbMzg7Mjsx
NjsxODsyOTs0ODsyOzI2OzE4OzQwbeKWhhtbMzg7MjsyNTsxOTszODs0ODsyOzE2OzE1OzIybeKW
gRtbMzg7MjsyMzsxODszMzs0ODsyOzE1OzE0OzIxbeKWgRtbMzg7MjsxNTsxNDsyMDs0ODsyOzIy
OzE2OzMybeKWhhtbMzg7MjsxNTsxNTsyMTs0ODsyOzE2OzE4OzI1beKWixtbMzg7MjsxNzsyMTsz
MTs0ODsyOzQzOzExNTsxNzFt4paNG1szODsyOzM3OzExMDsxNjE7NDg7MjsxNzsxODs0MG3ilo0b
WzBtCiAgICAgICAgICAgG1szODsyOzIyOzEyOzM2OzQ4OzI7MTMwOzQ3OzE0NW3ilosbWzM4OzI7
MTQxOzUxOzE1OTs0ODsyOzIzOzE3OzI3beKWixtbMzg7MjsxOTsxNTsyNDs0ODsyOzE2OzE0OzIx
beKWjRtbMzg7MjsxNzsxNDsyMzs0ODsyOzE1OzEzOzIybeKWlhtbMzg7MjsxOTsxMzszMTs0ODsy
OzE1OzE1OzI2beKWlBtbMzg7MjszMjsxNzs1Mzs0ODsyOzE4OzE3OzM0beKWlBtbMzg7MjsyNjsz
NTs2Mzs0ODsyOzc2OzcyOzE0N23iloMbWzM4OzI7NDU7Nzg7MTM0OzQ4OzI7MjI7MjA7NDFt4paF
G1szODsyOzIzOzI1OzQ2OzQ4OzI7Mzg7Nzc7MTI1beKWgBtbMzg7MjsxNzsxNjsyODs0ODsyOzIx
OzE3OzMybeKWhRtbMzg7MjsyOTsyMTs0Mjs0ODsyOzE4OzE2OzI4beKWlBtbMzg7MjsxODsxODsz
MTs0ODsyOzgzOzU3OzEyOG3iloYbWzM4OzI7ODc7NzI7MTUwOzQ4OzI7MTc7MjI7MzVt4paAG1sz
ODsyOzIxOzM0OzUzOzQ4OzI7Nzg7ODU7MTU4beKWghtbMzg7Mjs1OTsxMDM7MTY0OzQ4OzI7MzI7
NDA7NzFt4paGG1szODsyOzM3Ozk2OzEzOTs0ODsyOzE3OzMxOzQ4beKWlhtbMzg7MjsxNjszNzs1
MDs0ODsyOzI4OzExMzsxNTNt4paFG1szODsyOzE0OzI5OzM3OzQ4OzI7MTU7MTA4OzEyOG3ilp0b
WzM4OzI7MTk7MTg7MzE7NDg7MjsxNDsyMDsyNW3ilpQbWzM4OzI7MTg7MTY7MjY7NDg7MjsxNDsx
NjsyMW3ilpQbWzQ4OzI7MTQ7MTU7MjBtIBtbMzg7MjsxNDsxNzsyMjs0ODsyOzE1OzIxOzI4beKW
ihtbMzg7MjsxNTsyNTszMzs0ODsyOzIyOzEzNDsxNjht4paNG1szODsyOzE5OzEyNjsxNjA7NDg7
MjsxNjsyMTs0Mm3ilo0bWzBtCiAgICAgICAgICAgG1szODsyOzIyOzEzOzM3OzQ4OzI7MTEzOzU5
OzE0OG3ilosbWzM4OzI7MTIxOzY1OzE2Mzs0ODsyOzIyOzE3OzI3beKWixtbMzg7MjsxOTsxNTsy
NDs0ODsyOzE2OzE0OzIybeKWjRtbMzg7MjsxNzsxODszMDs0ODsyOzE3OzE2OzI0beKWlRtbMzg7
MjsyMDsxMjg7MTc3OzQ4OzI7MjA7NDE7NjRt4paXG1szODsyOzE2OzIyOzM5OzQ4OzI7MTk7ODc7
MTI2beKWlBtbMzg7MjsxOTsxMTI7MTU0OzQ4OzI7MTY7MzQ7NTZt4paFG1szODsyOzE4Ozk1OzEy
OTs0ODsyOzE1OzIyOzM5beKWhRtbMzg7MjsxNzs3ODsxMDY7NDg7MjsxNTsyMDszNG3iloUbWzM4
OzI7MTQ7Mzc7NTY7NDg7MjsxNTsyNTszOG3ilpUbWzM4OzI7MTE7NTk7ODY7NDg7MjsxNDszMDs0
Nm3ilpUbWzM4OzI7MTI7NTY7ODA7NDg7MjsxMzszMjs0N23ilp0bWzM4OzI7MTQ7MzQ7NDg7NDg7
MjsxNDsyMjszMm3ilpUbWzM4OzI7MTM7MjA7MzA7NDg7MjsxMjsyNDszN23ilosbWzM4OzI7MTQ7
NDM7NjA7NDg7MjsyNzsxMjY7MTY0beKWjRtbMzg7MjsyNTsxMjM7MTU4OzQ4OzI7MTY7MjY7MzRt
4paLG1szODsyOzIxOzI5OzI3OzQ4OzI7MTc7MjQ7Mjlt4paXG1szODsyOzE5OzM1OzMyOzQ4OzI7
Mzc7MTQyOzEwM23ilpUbWzM4OzI7MTk7MzA7Mjk7NDg7MjsxNzsyMjsyNG3ilo4bWzM4OzI7MjA7
MTc7Mjk7NDg7MjsxNzsxNzsyM23ilp0bWzM4OzI7MTQ7MTU7MjA7NDg7MjsxODsxNjsyNG3ilpQb
WzM4OzI7MTU7MTg7MjE7NDg7MjsxNTsyMjsyNm3iloobWzM4OzI7MTU7Mjc7MzI7NDg7MjsxMTsx
NTU7MTU1beKWjRtbMzg7MjsxMTsxNDU7MTQ1OzQ4OzI7MTU7MjU7Mzht4paNG1swbQogICAgICAg
ICAgIBtbMzg7MjsyMTsxNDszNzs0ODsyOzkzOzcyOzE1Mm3ilosbWzM4OzI7OTk7Nzg7MTY1OzQ4
OzI7MjE7MTc7MjZt4paLG1szODsyOzE5OzE2OzIzOzQ4OzI7MTY7MTU7MjJt4paOG1szODsyOzEy
OzI1OzQ5OzQ4OzI7MTU7MTY7MjZt4paXG1szODsyOzE3OzY2OzkzOzQ4OzI7MTU7MjA7MzBt4paU
G1szODsyOzE5OzI4OzQzOzQ4OzI7MTg7MTI5OzE3Nm3iloYbWzM4OzI7MTY7Njg7OTU7NDg7Mjsx
ODsyMTszNG3ilpQbWzM4OzI7MjE7MTY7MzI7NDg7MjsxNzsxODsyOW3ilpYbWzM4OzI7MjA7Mjc7
NDM7NDg7MjsxOTsxODszMG3ilpUbWzM4OzI7MjQ7OTM7MTI3OzQ4OzI7MTU7MjA7MzFt4paFG1sz
ODsyOzIwOzEwMDsxMzM7NDg7MjsxNDsyMTszMm3iloUbWzM4OzI7MTg7MTAyOzEzMzs0ODsyOzEz
OzIxOzMybeKWhRtbMzg7MjsxNzsxMDc7MTM0OzQ4OzI7MTM7MjM7MzVt4paFG1szODsyOzE3OzEw
ODsxMzE7NDg7MjsxMzs0Nzs2M23iloYbWzM4OzI7MjA7MzQ7Mzk7NDg7MjsxNzsxMjQ7MTUxbeKW
gxtbMzg7MjsxNzs2MDs3Mzs0ODsyOzIyOzI4OzMwbeKWlBtbMzg7MjsyMDg7MTUyOzE3OzQ4OzI7
NDU7NDA7MjRt4paXG1szODsyOzc2OzYxOzI0OzQ4OzI7MTYyOzE0MjsyN23iloIbWzM4OzI7MTkw
OzE0MzsyMjs0ODsyOzI5OzI4OzIxbeKWlhtbMzg7MjsyMTsyMDsxOTs0ODsyOzE4OzE3OzE4beKW
jRtbMzg7MjsxODsxNzsxOTs0ODsyOzE2OzE2OzE5beKWgxtbMzg7MjsxNzsxODsyMDs0ODsyOzE5
OzI0OzI0beKWihtbMzg7MjsyMTsyOTsyNzs0ODsyOzU2OzE2OTs5OG3ilo0bWzM4OzI7NTA7MTYx
OzkzOzQ4OzI7MTk7Mjk7MzBt4paNG1swbQogICAgICAgICAgIBtbMzg7MjsxODsxNjszNzs0ODsy
OzY0OzkzOzE1N23ilosbWzM4OzI7NjQ7MTAwOzE3MDs0ODsyOzIwOzE5OzI3beKWixtbMzg7Mjsx
ODsxNzsyMzs0ODsyOzE2OzE1OzIxbeKWjRtbMzg7MjsxNDsxODszNDs0ODsyOzE0OzEzOzIwbeKW
lBtbMzg7MjsxNDsxMzsxOTs0ODsyOzE1OzEzOzIwbeKWjhtbMzg7MjsxNTsxMzsyMDs0ODsyOzE2
OzE0OzIxbeKWjRtbMzg7MjsyMDsxNDsyNDs0ODsyOzE3OzE0OzIybeKWlxtbMzg7Mjs4MDsxOTs3
MTs0ODsyOzIzOzE0OzI3beKWlxtbMzg7MjsxMjA7MjQ7MTA0OzQ4OzI7MjU7MTc7MzNt4paGG1sz
ODsyOzEyODszMDsxMTg7NDg7MjszMzsyMDs0M23iloUbWzM4OzI7MTU0OzQ3OzEyNTs0ODsyOzI4
OzIxOzM5beKWgxtbMzg7MjsxODk7Njc7MTAwOzQ4OzI7MjU7MjI7MzZt4paDG1szODsyOzE5ODs4
Njs3Mjs0ODsyOzIzOzIyOzMxbeKWgxtbMzg7MjsyMDQ7MTA2OzQ0OzQ4OzI7MjQ7MjM7Mjdt4paD
G1szODsyOzIxMDsxMjE7MjY7NDg7MjsyNzsyNDsyNW3iloMbWzM4OzI7NTc7NDM7MjM7NDg7Mjsx
ODc7MTE5OzE3beKWgBtbMzg7MjsxOTM7MTM4OzE5OzQ4OzI7NjM7NDc7MjFt4paAG1szODsyOzE3
ODsxMjk7MTg7NDg7Mjs0MzszNDsyMG3iloAbWzM4OzI7MTUyOzExMzsyMTs0ODsyOzI3OzI0OzE4
beKWmBtbMzg7MjsyMzsyMDsxODs0ODsyOzIwOzE3OzE3beKWmBtbMzg7MjsyMDsxODsxODs0ODsy
OzE5OzE3OzE4beKWghtbMzg7MjsyMDsxOTsxOTs0ODsyOzIzOzIzOzIxbeKWixtbMzg7MjsyODsz
MDsyNDs0ODsyOzE1MDsxNjc7Mzdt4paNG1szODsyOzE0MjsxNjI7Mzg7NDg7MjsyODszMDsyNG3i
lo0bWzBtCiAgICAgICAgICAgG1szODsyOzE3OzIxOzQ0OzQ4OzI7Mjk7OTQ7MTM3beKWihtbMzg7
MjsyMzs1MDs3Mzs0ODsyOzI5OzEyMTsxNjVt4padG1szODsyOzE4OzQ0OzU5OzQ4OzI7MTY7MTk7
Mjdt4paBG1szODsyOzMwOzE0OzQxOzQ4OzI7MTc7MTY7Mjdt4padG1szODsyOzQ4OzE1OzUwOzQ4
OzI7MTU7MTU7MjNt4paAG1szODsyOzQzOzE1OzQ2beKWgBtbMzg7MjszNTsxNjs0MTs0ODsyOzIx
OzE1OzI3beKWjxtbMzg7Mjs0NjsxNjs0Nzs0ODsyOzMwOzE2OzM3beKWlBtbMzg7MjsyNDsxNzsz
MDs0ODsyOzE0ODsyNzsxMjht4paFG1szODsyOzI2OzE3OzMxOzQ4OzI7MTExOzI1OzEwMW3iloUb
WzM4OzI7OTQ7Mjk7Nzg7NDg7MjsyOTsxNzszNG3ilpQbWzM4OzI7MTE2OzQxOzY2OzQ4OzI7Mjk7
MTg7MzJt4paUG1szODsyOzEyMjs1Mzs0OTs0ODsyOzI4OzE5OzI5beKWlBtbMzg7MjsxMjU7NjQ7
MzQ7NDg7MjsyNzsyMDsyM23ilpQbWzM4OzI7MTI3OzcyOzI2OzQ4OzI7Mjc7MjE7MjJt4paUG1sz
ODsyOzYxOzQxOzIzOzQ4OzI7MjU7MjE7MjBt4paUG1szODsyOzIzOzIwOzIwOzQ4OzI7MzE7MjQ7
MjRt4paGG1szODsyOzIyOzE5OzE5OzQ4OzI7MzM7MjM7MzBt4paGG1s0ODsyOzI3OzIxOzI1beKW
hhtbMzg7MjsyNjsyMjsxOTs0ODsyOzIxOzE4OzE4beKWghtbMzg7MjsyOTsyNDsyMTs0ODsyOzIy
OzE5OzE5beKWghtbMzg7Mjs3NTs1ODsyNDs0ODsyOzMwOzI1OzIxbeKWgRtbMzg7Mjs4Mzs2ODsy
Mzs0ODsyOzIwMTsxNTc7MTlt4paYG1szODsyOzE2MTsxMjk7MjI7NDg7Mjs0MDszMzsyNG3ilo4b
WzBtCiAgICAgICAgICAgG1szODsyOzE0OzE2OzM3OzQ4OzI7MTQ7MTM7Mjlt4padG1szODsyOzI4
OzEwOTsxNDQ7NDg7MjsxNTsyNTs0Nm3ilp0bWzM4OzI7MTY7MzI7NTM7NDg7MjsyOTsxMTQ7MTQ1
beKWgxtbMzg7MjsyNTsxMDI7MTI2OzQ4OzI7MTU7MjM7MzNt4paGG1szODsyOzIzOzEwNzsxMjU7
NDg7MjsxNTsyMTsyOW3iloYbWzM4OzI7MjM7MTA5OzEyMjs0ODsyOzE2OzIxOzI5beKWhhtbMzg7
MjsyNDsxMTE7MTE4OzQ4OzI7MTY7MjI7Mjlt4paGG1szODsyOzI2OzExMzsxMTM7NDg7MjsxODsy
MjszMG3iloYbWzM4OzI7Mjk7MTE3OzEwOTs0ODsyOzE5OzIyOzI5beKWhhtbMzg7MjszNjsxMjA7
OTk7NDg7MjsyMDsyMzsyOW3iloYbWzM4OzI7NDY7MTIzOzg1OzQ4OzI7MjE7MjQ7Mjht4paGG1sz
ODsyOzYzOzEyNTs2ODs0ODsyOzIyOzI0OzI2beKWhhtbMzg7Mjs4ODsxMjU7NTA7NDg7MjsyMzsy
NTsyNG3iloYbWzM4OzI7MTEzOzEyNTszODs0ODsyOzI2OzI1OzIybeKWhhtbMzg7MjsxMjg7MTI1
OzMxOzQ4OzI7Mjg7MjY7MjJt4paGG1szODsyOzEzODsxMjQ7Mjht4paGG1szODsyOzE0NDsxMjQ7
MjY7NDg7MjsyOTsyNjsyMW3iloYbWzM4OzI7MTQ5OzEyNDsyNTs0ODsyOzMxOzI3OzIxbeKWhhtb
Mzg7MjsxNTQ7MTI0OzIzOzQ4OzI7MzI7MjY7MjFt4paGG1szODsyOzE1ODsxMjM7MjE7NDg7Mjsz
NTsyNzsyMm3iloYbWzM4OzI7MTYyOzEyMzsyMDs0ODsyOzQwOzMxOzIzbeKWhhtbMzg7Mjs2MDs0
NDsyNTs0ODsyOzE4OTsxNDM7MTht4paDG1szODsyOzE4MzsxMzg7MTk7NDg7Mjs0NjszNDsyNW3i
lpgbWzM4OzI7MzI7MjQ7MjQ7NDg7MjsyMTsxNzsyM23ilpgbWzBtCgogICAgICAgG1sxOzM4OzI7
MjI1OzUzOzI1NW3iloQbWzE7Mzg7MjsyMjQ7NTM7MjU0beKWiBtbMTszODsyOzIyNDs1MzsyNTRt
4paIG1sxOzM4OzI7MjI0OzU0OzI1NG3iloAbWzE7Mzg7MjsyMjM7NTY7MjU0beKWgCAbWzE7Mzg7
MjsyMjE7NTk7MjU0beKWiBtbMTszODsyOzIyMDs2MjsyNTRt4paIIBtbMTszODsyOzIxNzs2Nzsy
NTNt4paIG1sxOzM4OzI7MjE2OzcxOzI1M23iloggICAgG1sxOzM4OzI7MjA2OzkxOzI1MW3ilogb
WzE7Mzg7MjsyMDQ7OTU7MjUwbeKWiCAbWzE7Mzg7MjsxOTk7MTA1OzI0OW3iloQbWzE7Mzg7Mjsx
OTc7MTEwOzI0OW3iloAgG1sxOzM4OzI7MTkyOzEyMDsyNDdt4paEG1sxOzM4OzI7MTg5OzEyNjsy
NDdt4paIG1sxOzM4OzI7MTg3OzEzMTsyNDZt4paIG1sxOzM4OzI7MTg0OzEzNzsyNDZt4paIG1sx
OzM4OzI7MTgxOzE0MjsyNDVt4paAIBtbMTszODsyOzE3NjsxNTQ7MjQ0beKWiBtbMTszODsyOzE3
MzsxNTk7MjQzbeKWiCAbWzE7Mzg7MjsxNjg7MTcwOzI0Mm3ilogbWzE7Mzg7MjsxNjU7MTc2OzI0
Mm3ilogbWzE7Mzg7MjsxNjM7MTgxOzI0MW3iloAbWzE7Mzg7MjsxNjA7MTg3OzI0MW3ilogbWzE7
Mzg7MjsxNTg7MTkyOzI0MG3iloQgG1sxOzM4OzI7MTUzOzIwMjsyMzlt4paEG1sxOzM4OzI7MTUw
OzIwNzsyMzht4paIG1sxOzM4OzI7MTQ4OzIxMjsyMzht4paIG1sxOzM4OzI7MTQ2OzIxNjsyMzdt
4paIG1sxOzM4OzI7MTQ0OzIyMTsyMzdt4paAIBtbMTszODsyOzE0MDsyMjk7MjM2beKWiBtbMTsz
ODsyOzEzODsyMzM7MjM2beKWiCAbWzE7Mzg7MjsxMzU7MjQwOzIzNW3ilogbWzE7Mzg7MjsxMzM7
MjQzOzIzNW3iloggG1sxOzM4OzI7MTMxOzI0ODsyMzRt4paIG1sxOzM4OzI7MTMwOzI1MDsyMzRt
4paIIBtbMTszODsyOzEyODsyNTM7MjM0beKWgBtbMTszODsyOzEyODsyNTQ7MjM0beKWiBtbMTsz
ODsyOzEyODsyNTQ7MjM0beKWiBtbMTszODsyOzEyODsyNTU7MjM0beKWgBtbMG0KICAgICAgIBtb
MTszODsyOzIyNTs1MzsyNTVt4paAG1sxOzM4OzI7MjI0OzUzOzI1NG3iloQbWzE7Mzg7MjsyMjQ7
NTM7MjU0beKWhBtbMTszODsyOzIyNDs1NDsyNTRt4paEICAbWzE7Mzg7MjsyMjE7NTk7MjU0beKW
iBtbMTszODsyOzIyMDs2MjsyNTRt4paIIBtbMTszODsyOzIxNzs2NzsyNTNt4paIG1sxOzM4OzI7
MjE2OzcxOzI1M23iloggICAgG1sxOzM4OzI7MjA2OzkxOzI1MW3ilogbWzE7Mzg7MjsyMDQ7OTU7
MjUwbeKWiBtbMTszODsyOzIwMjsxMDA7MjUwbeKWiBtbMTszODsyOzE5OTsxMDU7MjQ5beKWgCAg
G1sxOzM4OzI7MTkyOzEyMDsyNDdt4paIG1sxOzM4OzI7MTg5OzEyNjsyNDdt4paIICAgIBtbMTsz
ODsyOzE3NjsxNTQ7MjQ0beKWiBtbMTszODsyOzE3MzsxNTk7MjQzbeKWiCAbWzE7Mzg7MjsxNjg7
MTcwOzI0Mm3ilogbWzE7Mzg7MjsxNjU7MTc2OzI0Mm3ilogbWzE7Mzg7MjsxNjM7MTgxOzI0MW3i
logbWzE7Mzg7MjsxNjA7MTg3OzI0MW3iloAgIBtbMTszODsyOzE1MzsyMDI7MjM5beKWiBtbMTsz
ODsyOzE1MDsyMDc7MjM4beKWiCAgICAbWzE7Mzg7MjsxNDA7MjI5OzIzNm3ilogbWzE7Mzg7Mjsx
Mzg7MjMzOzIzNm3iloggG1sxOzM4OzI7MTM1OzI0MDsyMzVt4paIG1sxOzM4OzI7MTMzOzI0Mzsy
MzVt4paIIBtbMTszODsyOzEzMTsyNDg7MjM0beKWiBtbMTszODsyOzEzMDsyNTA7MjM0beKWiCAg
G1sxOzM4OzI7MTI4OzI1NDsyMzRt4paIG1sxOzM4OzI7MTI4OzI1NDsyMzRt4paIIBtbMG0KICAg
ICAgICAbWzE7Mzg7MjsyMjQ7NTM7MjU0beKWhBtbMTszODsyOzIyNDs1MzsyNTRt4paEG1sxOzM4
OzI7MjI0OzU0OzI1NG3iloQbWzE7Mzg7MjsyMjM7NTY7MjU0beKWgCAbWzE7Mzg7MjsyMjE7NTk7
MjU0beKWiBtbMTszODsyOzIyMDs2MjsyNTRt4paIIBtbMTszODsyOzIxNzs2NzsyNTNt4paIG1sx
OzM4OzI7MjE2OzcxOzI1M23ilogbWzE7Mzg7MjsyMTQ7NzQ7MjUybeKWhBtbMTszODsyOzIxMjs3
ODsyNTJt4paEG1sxOzM4OzI7MjEwOzgyOzI1MW3iloQgG1sxOzM4OzI7MjA2OzkxOzI1MW3ilogb
WzE7Mzg7MjsyMDQ7OTU7MjUwbeKWiBtbMTszODsyOzIwMjsxMDA7MjUwbeKWiBtbMTszODsyOzE5
OTsxMDU7MjQ5beKWhCAgG1sxOzM4OzI7MTkyOzEyMDsyNDdt4paIG1sxOzM4OzI7MTg5OzEyNjsy
NDdt4paIICAbWzE7Mzg7MjsxODE7MTQyOzI0NW3iloQgG1sxOzM4OzI7MTc2OzE1NDsyNDRt4paI
G1sxOzM4OzI7MTczOzE1OTsyNDNt4paIIBtbMTszODsyOzE2ODsxNzA7MjQybeKWiBtbMTszODsy
OzE2NTsxNzY7MjQybeKWiBtbMTszODsyOzE2MzsxODE7MjQxbeKWgBtbMTszODsyOzE2MDsxODc7
MjQxbeKWiCAgG1sxOzM4OzI7MTUzOzIwMjsyMzlt4paIG1sxOzM4OzI7MTUwOzIwNzsyMzht4paI
ICAbWzE7Mzg7MjsxNDQ7MjIxOzIzN23iloQgG1sxOzM4OzI7MTQwOzIyOTsyMzZt4paIG1sxOzM4
OzI7MTM4OzIzMzsyMzZt4paIG1sxOzM4OzI7MTM2OzIzNjsyMzVt4paEG1sxOzM4OzI7MTM1OzI0
MDsyMzVt4paIG1sxOzM4OzI7MTMzOzI0MzsyMzVt4paIIBtbMTszODsyOzEzMTsyNDg7MjM0beKW
iBtbMTszODsyOzEzMDsyNTA7MjM0beKWiCAgG1sxOzM4OzI7MTI4OzI1NDsyMzRt4paIG1sxOzM4
OzI7MTI4OzI1NDsyMzRt4paIIBtbMG0KICAgICAgIBtbMTszODsyOzIyNTs1MzsyNTVt4paAG1sx
OzM4OzI7MjI0OzUzOzI1NG3iloAbWzE7Mzg7MjsyMjQ7NTM7MjU0beKWiBtbMTszODsyOzIyNDs1
NDsyNTRt4paIG1sxOzM4OzI7MjIzOzU2OzI1NG3iloAgG1sxOzM4OzI7MjIxOzU5OzI1NG3iloAb
WzE7Mzg7MjsyMjA7NjI7MjU0beKWgCAbWzE7Mzg7MjsyMTc7Njc7MjUzbeKWgBtbMTszODsyOzIx
Njs3MTsyNTNt4paAG1sxOzM4OzI7MjE0Ozc0OzI1Mm3iloAbWzE7Mzg7MjsyMTI7Nzg7MjUybeKW
gBtbMTszODsyOzIxMDs4MjsyNTFt4paAIBtbMTszODsyOzIwNjs5MTsyNTFt4paAG1sxOzM4OzI7
MjA0Ozk1OzI1MG3iloAgG1sxOzM4OzI7MTk5OzEwNTsyNDlt4paAG1sxOzM4OzI7MTk3OzExMDsy
NDlt4paAIBtbMTszODsyOzE5MjsxMjA7MjQ3beKWgBtbMTszODsyOzE4OTsxMjY7MjQ3beKWiBtb
MTszODsyOzE4NzsxMzE7MjQ2beKWiBtbMTszODsyOzE4NDsxMzc7MjQ2beKWiBtbMTszODsyOzE4
MTsxNDI7MjQ1beKWgCAbWzE7Mzg7MjsxNzY7MTU0OzI0NG3iloAbWzE7Mzg7MjsxNzM7MTU5OzI0
M23iloAgG1sxOzM4OzI7MTY4OzE3MDsyNDJt4paAG1sxOzM4OzI7MTY1OzE3NjsyNDJt4paAIBtb
MTszODsyOzE2MDsxODc7MjQxbeKWgBtbMTszODsyOzE1ODsxOTI7MjQwbeKWgCAbWzE7Mzg7Mjsx
NTM7MjAyOzIzOW3iloAbWzE7Mzg7MjsxNTA7MjA3OzIzOG3ilogbWzE7Mzg7MjsxNDg7MjEyOzIz
OG3ilogbWzE7Mzg7MjsxNDY7MjE2OzIzN23ilogbWzE7Mzg7MjsxNDQ7MjIxOzIzN23iloAgIBtb
MTszODsyOzEzODsyMzM7MjM2beKWgBtbMTszODsyOzEzNjsyMzY7MjM1beKWgBtbMTszODsyOzEz
NTsyNDA7MjM1beKWgCAgG1sxOzM4OzI7MTMxOzI0ODsyMzRt4paAG1sxOzM4OzI7MTMwOzI1MDsy
MzRt4paAICAbWzE7Mzg7MjsxMjg7MjU0OzIzNG3iloAbWzE7Mzg7MjsxMjg7MjU0OzIzNG3iloAg
G1swbQogICAgICAgG1syOzM7Mzg7MjsxNTU7MTEwOzI1NW0gICBFbGVjdHJpYyBtZWV0cyBlbGVn
YW50LhtbMG0KCg==
"
# ─── The banner ─────────────────────────────────────────────────────────────
banner() {
    printf '\n'
    printf '%s' "$LOGO_B64" | base64 -d 2>/dev/null || true
    printf '\n\n'
}




# ─── Detection engine ───────────────────────────────────────────────────────

cmd_exists() { command -v "$1" &>/dev/null; }
dir_exists() { [[ -d "$1" ]]; }

detect_all() {
    printf '\n'

    # Ghostty
    if cmd_exists ghostty || dir_exists "$HOME/.config/ghostty"; then
        DETECTED+=("ghostty")
        pulse_dot "Ghostty" "found"
    else
        pulse_dot "Ghostty" "missing"
    fi

    # Alacritty
    if cmd_exists alacritty || dir_exists "$HOME/.config/alacritty"; then
        DETECTED+=("alacritty")
        pulse_dot "Alacritty" "found"
    else
        pulse_dot "Alacritty" "missing"
    fi

    # Kitty
    if cmd_exists kitty || dir_exists "$HOME/.config/kitty"; then
        DETECTED+=("kitty")
        pulse_dot "Kitty" "found"
    else
        pulse_dot "Kitty" "missing"
    fi

    # Warp
    if cmd_exists warp-terminal || dir_exists "$HOME/.warp"; then
        DETECTED+=("warp")
        pulse_dot "Warp" "found"
    else
        pulse_dot "Warp" "missing"
    fi

    # btop
    if cmd_exists btop || dir_exists "$HOME/.config/btop"; then
        DETECTED+=("btop")
        pulse_dot "btop" "found"
    else
        pulse_dot "btop" "missing"
    fi

    # k9s
    if cmd_exists k9s || dir_exists "$HOME/.config/k9s"; then
        DETECTED+=("k9s")
        pulse_dot "k9s" "found"
    else
        pulse_dot "k9s" "missing"
    fi

    # fzf
    if cmd_exists fzf; then
        DETECTED+=("fzf")
        pulse_dot "fzf" "found"
    else
        pulse_dot "fzf" "missing"
    fi

    # fastfetch
    if cmd_exists fastfetch || dir_exists "$HOME/.config/fastfetch"; then
        DETECTED+=("fastfetch")
        pulse_dot "fastfetch" "found"
    else
        pulse_dot "fastfetch" "missing"
    fi

    # starship
    if cmd_exists starship || [[ -f "$HOME/.config/starship.toml" ]]; then
        DETECTED+=("starship")
        pulse_dot "Starship" "found"
    else
        pulse_dot "Starship" "missing"
    fi

    # tmux
    if cmd_exists tmux; then
        DETECTED+=("tmux")
        pulse_dot "tmux" "found"
    else
        pulse_dot "tmux" "missing"
    fi

    # bat
    if cmd_exists bat; then
        DETECTED+=("bat")
        pulse_dot "bat" "found"
    else
        pulse_dot "bat" "missing"
    fi

    # lsd
    if cmd_exists lsd; then
        DETECTED+=("lsd")
        pulse_dot "lsd" "found"
    else
        pulse_dot "lsd" "missing"
    fi

    # procs
    if cmd_exists procs; then
        DETECTED+=("procs")
        pulse_dot "procs" "found"
    else
        pulse_dot "procs" "missing"
    fi

    # atuin
    if cmd_exists atuin || dir_exists "$HOME/.config/atuin"; then
        DETECTED+=("atuin")
        pulse_dot "Atuin" "found"
    else
        pulse_dot "Atuin" "missing"
    fi

    # lazygit
    if cmd_exists lazygit || dir_exists "$HOME/.config/lazygit"; then
        DETECTED+=("lazygit")
        pulse_dot "lazygit" "found"
    else
        pulse_dot "lazygit" "missing"
    fi

    # Git (with delta)
    if cmd_exists git; then
        DETECTED+=("git")
        pulse_dot "Git" "found"
        if cmd_exists delta; then
            pulse_dot "  delta (git pager)" "found"
        fi
    else
        pulse_dot "Git" "missing"
    fi

    # COSMIC Desktop
    if dir_exists "$HOME/.config/cosmic" || cmd_exists cosmic-comp; then
        DETECTED+=("cosmic")
        pulse_dot "COSMIC Desktop" "found"
    else
        pulse_dot "COSMIC Desktop" "missing"
    fi

    # Neovim
    if cmd_exists nvim; then
        DETECTED+=("neovim")
        pulse_dot "Neovim" "found"
        # Check for AstroNvim
        if [[ -f "$HOME/.config/nvim/lua/astronvim/init.lua" ]] || \
           grep -rql "AstroNvim" "$HOME/.config/nvim/" 2>/dev/null; then
            DETECTED+=("astronvim")
            pulse_dot "  AstroNvim" "found"
        fi
    else
        pulse_dot "Neovim" "missing"
    fi

    # VSCode
    if cmd_exists code || cmd_exists code-insiders; then
        DETECTED+=("vscode")
        pulse_dot "VS Code" "found"
    else
        pulse_dot "VS Code" "missing"
    fi

    # Slack
    if cmd_exists slack || \
       [[ -d "/Applications/Slack.app" ]] || \
       cmd_exists flatpak && flatpak list 2>/dev/null | grep -qi slack; then
        DETECTED+=("slack")
        pulse_dot "Slack" "found"
    else
        pulse_dot "Slack" "missing"
    fi

    # Windows Terminal (WSL)
    if [[ -n "${WSL_DISTRO_NAME:-}" ]]; then
        DETECTED+=("windows-terminal")
        pulse_dot "Windows Terminal (WSL)" "found"
    else
        pulse_dot "Windows Terminal" "missing"
    fi

    printf '\n'
    printf "${GREEN}${BOLD}  %d${RESET}${WHITE} apps detected${RESET}\n\n" "${#DETECTED[@]}"
}

# ─── Install functions ───────────────────────────────────────────────────────

safe_copy() {
    local src="$1"
    local dst="$2"
    local label="$3"

    if [[ ! -f "$src" ]]; then
        fail "${label}: source not found"
        FAILED+=("$label")
        return 1
    fi

    mkdir -p "$(dirname "$dst")"

    if [[ "$DRY_RUN" == true ]]; then
        diminfo "dry-run: $src -> $dst"
        INSTALLED+=("$label")
        return 0
    fi

    if [[ -f "$dst" ]]; then
        # Back up existing file
        cp "$dst" "${dst}.silkcircuit.bak" 2>/dev/null || true
    fi

    if cp "$src" "$dst" 2>/dev/null; then
        INSTALLED+=("$label")
        return 0
    else
        FAILED+=("$label")
        return 1
    fi
}

install_ghostty() {
    local theme_dir="$HOME/.config/ghostty/themes"
    printf "${PURPLE}${BOLD}  >> Ghostty${RESET}\n"

    # Install all variants so they can switch
    local count=0
    for f in "${EXTRAS_DIR}/ghostty/silkcircuit-"*; do
        local name
        name=$(basename "$f")
        if safe_copy "$f" "${theme_dir}/${name}" "ghostty:${name}"; then
            count=$((count + 1))
        fi
    done
    success "Installed ${count} Ghostty themes"
    diminfo "Activate: theme = silkcircuit-neon (or vibrant/soft/glow/dawn)"
}

install_alacritty() {
    local theme_dir="$HOME/.config/alacritty/themes"
    printf "${PURPLE}${BOLD}  >> Alacritty${RESET}\n"

    safe_copy "${EXTRAS_DIR}/alacritty.yml" "${theme_dir}/silkcircuit.yml" "alacritty:dark"
    if [[ -f "${EXTRAS_DIR}/alacritty-dawn.yml" ]]; then
        safe_copy "${EXTRAS_DIR}/alacritty-dawn.yml" "${theme_dir}/silkcircuit-dawn.yml" "alacritty:dawn"
    fi
    success "Installed Alacritty themes"
    diminfo "Import in alacritty.toml: [general] import = [\"~/.config/alacritty/themes/silkcircuit.yml\"]"
}

install_kitty() {
    local theme_dir="$HOME/.config/kitty/themes"
    printf "${PURPLE}${BOLD}  >> Kitty${RESET}\n"

    safe_copy "${EXTRAS_DIR}/kitty.conf" "${theme_dir}/silkcircuit.conf" "kitty:dark"
    if [[ -f "${EXTRAS_DIR}/kitty-dawn.conf" ]]; then
        safe_copy "${EXTRAS_DIR}/kitty-dawn.conf" "${theme_dir}/silkcircuit-dawn.conf" "kitty:dawn"
    fi
    success "Installed Kitty themes"
    diminfo "Activate: include themes/silkcircuit.conf"
}

install_warp() {
    local theme_dir="$HOME/.warp/themes"
    printf "${PURPLE}${BOLD}  >> Warp${RESET}\n"

    safe_copy "${EXTRAS_DIR}/warp.yaml" "${theme_dir}/silkcircuit.yaml" "warp:dark"
    if [[ -f "${EXTRAS_DIR}/warp-dawn.yaml" ]]; then
        safe_copy "${EXTRAS_DIR}/warp-dawn.yaml" "${theme_dir}/silkcircuit-dawn.yaml" "warp:dawn"
    fi
    success "Installed Warp themes"
}

install_btop() {
    local theme_dir="$HOME/.config/btop/themes"
    printf "${PURPLE}${BOLD}  >> btop${RESET}\n"

    local count=0
    for f in "${EXTRAS_DIR}/btop/silkcircuit_"*.theme; do
        local name
        name=$(basename "$f")
        if safe_copy "$f" "${theme_dir}/${name}" "btop:${name}"; then
            count=$((count + 1))
        fi
    done
    success "Installed ${count} btop themes"
    diminfo "Select in btop: Esc -> Options -> Color theme"
}

install_k9s() {
    # k9s skins go in the k9s config directory
    local skin_dir="$HOME/.config/k9s/skins"
    printf "${PURPLE}${BOLD}  >> k9s${RESET}\n"

    local count=0
    for f in "${EXTRAS_DIR}/k9s/silkcircuit"*.yaml; do
        local name
        name=$(basename "$f")
        if safe_copy "$f" "${skin_dir}/${name}" "k9s:${name}"; then
            count=$((count + 1))
        fi
    done
    success "Installed ${count} k9s skins"
    diminfo "Activate: k9s --skin silkcircuit"
}

install_fzf() {
    printf "${PURPLE}${BOLD}  >> fzf${RESET}\n"

    local target="$HOME/.config/silkcircuit/fzf.sh"
    if safe_copy "${EXTRAS_DIR}/fzf.sh" "$target" "fzf"; then
        success "Installed fzf theme"
        diminfo "Add to shell rc: source ~/.config/silkcircuit/fzf.sh"
    fi
}

install_git() {
    printf "${PURPLE}${BOLD}  >> Git${RESET}\n"

    local target="$HOME/.config/silkcircuit/gitconfig"
    if safe_copy "${EXTRAS_DIR}/gitconfig" "$target" "git"; then
        # Check if already included
        if git config --global --get-all include.path 2>/dev/null | grep -q "silkcircuit/gitconfig"; then
            success "Git theme already configured"
        else
            if [[ "$DRY_RUN" == false ]]; then
                git config --global --add include.path "$target"
                success "Installed Git theme (added include to .gitconfig)"
            else
                success "Git theme (dry-run: would add include to .gitconfig)"
            fi
        fi
        if ! cmd_exists delta; then
            diminfo "Tip: install delta for enhanced git diffs"
        fi
    fi
}

install_starship() {
    printf "${PURPLE}${BOLD}  >> Starship${RESET}\n"

    local target="$HOME/.config/starship.toml"
    if safe_copy "${EXTRAS_DIR}/starship/starship.toml" "$target" "starship"; then
        success "Installed Starship config"
    fi
}

install_tmux() {
    printf "${PURPLE}${BOLD}  >> tmux${RESET}\n"

    local target="$HOME/.tmux.conf"
    if [[ -f "$target" ]] && grep -qi "silkcircuit" "$target" 2>/dev/null; then
        success "tmux already has SilkCircuit theme"
        INSTALLED+=("tmux")
    else
        if safe_copy "${EXTRAS_DIR}/tmux.conf" "$target" "tmux"; then
            success "Installed tmux config"
            diminfo "Reload: tmux source-file ~/.tmux.conf"
        fi
    fi
}

install_bat() {
    printf "${PURPLE}${BOLD}  >> bat${RESET}\n"

    local theme_dir
    theme_dir="$(bat --config-dir 2>/dev/null)/themes"
    local config_dir
    config_dir="$(bat --config-dir 2>/dev/null)"

    if [[ -n "$theme_dir" ]]; then
        mkdir -p "$theme_dir"
        if safe_copy "${EXTRAS_DIR}/bat/SilkCircuit.tmTheme" "${theme_dir}/SilkCircuit.tmTheme" "bat:theme"; then
            safe_copy "${EXTRAS_DIR}/bat/config" "${config_dir}/config" "bat:config"
            if [[ "$DRY_RUN" == false ]]; then
                bat cache --build &>/dev/null || true
            fi
            success "Installed bat theme"
        fi
    else
        warn "Could not determine bat config directory"
        SKIPPED+=("bat")
    fi
}

install_lsd() {
    printf "${PURPLE}${BOLD}  >> lsd${RESET}\n"

    local config_dir="$HOME/.config/lsd"
    safe_copy "${EXTRAS_DIR}/lsd/colors.yaml" "${config_dir}/colors.yaml" "lsd:colors"
    safe_copy "${EXTRAS_DIR}/lsd/config.yaml" "${config_dir}/config.yaml" "lsd:config"
    success "Installed lsd theme"
}

install_procs() {
    printf "${PURPLE}${BOLD}  >> procs${RESET}\n"

    local target="$HOME/.config/procs/config.toml"
    if safe_copy "${EXTRAS_DIR}/procs/config.toml" "$target" "procs"; then
        success "Installed procs config"
    fi
}

install_atuin() {
    printf "${PURPLE}${BOLD}  >> Atuin${RESET}\n"

    local theme_dir="$HOME/.config/atuin/themes"
    if safe_copy "${EXTRAS_DIR}/atuin/silkcircuit.toml" "${theme_dir}/silkcircuit.toml" "atuin"; then
        success "Installed Atuin theme"
        diminfo "Add to atuin config.toml: theme = \"silkcircuit\""
    fi
}

install_lazygit() {
    printf "${PURPLE}${BOLD}  >> lazygit${RESET}\n"

    local config_dir="$HOME/.config/lazygit"
    local target="${config_dir}/config.yml"

    # If config exists, check if themed already
    if [[ -f "$target" ]] && grep -qi "silkcircuit\|neonPurple\|#e135ff" "$target" 2>/dev/null; then
        success "lazygit already has SilkCircuit theme"
        INSTALLED+=("lazygit")
        return
    fi

    mkdir -p "$config_dir"

    if [[ "$DRY_RUN" == true ]]; then
        diminfo "dry-run: would write lazygit theme to ${target}"
        INSTALLED+=("lazygit")
        return
    fi

    # Merge theme into existing config or create new
    if [[ -f "$target" ]] && grep -q "gui:" "$target" 2>/dev/null; then
        warn "Existing lazygit config found - theme file saved separately"
        safe_copy "${EXTRAS_DIR}/lazygit/config.yml" "${config_dir}/silkcircuit-theme.yml" "lazygit:theme-ref"
        diminfo "Merge theme settings from: ${config_dir}/silkcircuit-theme.yml"
    else
        safe_copy "${EXTRAS_DIR}/lazygit/config.yml" "$target" "lazygit"
        success "Installed lazygit theme"
    fi
}

install_fastfetch() {
    printf "${PURPLE}${BOLD}  >> fastfetch${RESET}\n"

    local target="$HOME/.config/fastfetch/config.jsonc"
    if safe_copy "${EXTRAS_DIR}/fastfetch/config.jsonc" "$target" "fastfetch"; then
        success "Installed fastfetch config"
    fi
}

install_cosmic() {
    printf "${PURPLE}${BOLD}  >> COSMIC Desktop${RESET}\n"

    # Copy all variants to a central location
    local cosmic_dir="$HOME/.config/silkcircuit/cosmic"
    local count=0
    for f in "${EXTRAS_DIR}/cosmic/silkcircuit-"*.ron; do
        local name
        name=$(basename "$f")
        if safe_copy "$f" "${cosmic_dir}/${name}" "cosmic:${name}"; then
            count=$((count + 1))
        fi
    done

    success "Installed ${count} COSMIC themes"
    diminfo "Import via: Settings -> Desktop -> Appearance -> Import"
    diminfo "Theme files: ~/.config/silkcircuit/cosmic/"
}

install_vscode() {
    printf "${PURPLE}${BOLD}  >> VS Code${RESET}\n"

    # Find VS Code extensions directory
    local ext_dir=""
    if [[ -d "$HOME/.vscode/extensions" ]]; then
        ext_dir="$HOME/.vscode/extensions"
    elif [[ -d "$HOME/.vscode-insiders/extensions" ]]; then
        ext_dir="$HOME/.vscode-insiders/extensions"
    fi

    if [[ -z "$ext_dir" ]]; then
        warn "VS Code extensions directory not found"
        diminfo "Install from VS Code marketplace or manually copy extras/vscode/"
        SKIPPED+=("vscode")
        return
    fi

    local dest="${ext_dir}/silkcircuit-theme"
    mkdir -p "$dest"

    if [[ "$DRY_RUN" == false ]]; then
        cp -r "${EXTRAS_DIR}/vscode/"* "$dest/" 2>/dev/null
        INSTALLED+=("vscode")
        success "Installed VS Code theme"
        diminfo "Restart VS Code and select: SilkCircuit Neon"
    else
        diminfo "dry-run: would copy to ${dest}/"
        INSTALLED+=("vscode")
    fi
}

install_slack() {
    printf "${PURPLE}${BOLD}  >> Slack${RESET}\n"

    local target="$HOME/.config/silkcircuit/slack-theme.txt"
    if safe_copy "${EXTRAS_DIR}/slack-theme.txt" "$target" "slack"; then
        success "Slack theme reference installed"
        diminfo "Open: Preferences -> Themes -> paste colors from:"
        diminfo "$target"
    fi
}

install_windows_terminal() {
    printf "${PURPLE}${BOLD}  >> Windows Terminal${RESET}\n"

    local target="$HOME/.config/silkcircuit/windows-terminal.json"
    if safe_copy "${EXTRAS_DIR}/windows-terminal.json" "$target" "windows-terminal"; then
        success "Windows Terminal theme installed"
        diminfo "Import into Windows Terminal settings.json"
    fi
}

install_neovim() {
    printf "${PURPLE}${BOLD}  >> Neovim${RESET}\n"

    # Check if silkcircuit is already installed as a plugin
    local found=false
    for d in "$HOME/.local/share/nvim" "$HOME/.config/nvim"; do
        if find "$d" -path "*/silkcircuit*" -name "*.lua" 2>/dev/null | head -1 | grep -q .; then
            found=true
            break
        fi
    done

    if [[ "$found" == true ]]; then
        success "SilkCircuit already installed in Neovim"
    else
        info "Add to your plugin manager:"
        diminfo "{ \"AstroBliss/silkcircuit-nvim\", lazy = false, priority = 1000 }"
        SKIPPED+=("neovim")
    fi
}

install_astronvim() {
    printf "${PURPLE}${BOLD}  >> AstroNvim${RESET}\n"

    local dest="$HOME/.config/nvim/lua/plugins"
    if [[ -d "$dest" ]]; then
        local count=0
        for f in "${EXTRAS_DIR}/astronvim/plugins/"*.lua; do
            local name
            name=$(basename "$f")
            if safe_copy "$f" "${dest}/${name}" "astronvim:${name}"; then
                count=$((count + 1))
            fi
        done
        success "Installed ${count} AstroNvim plugin configs"
    else
        warn "AstroNvim plugins directory not found"
        SKIPPED+=("astronvim")
    fi
}

# ─── Main install orchestrator ───────────────────────────────────────────────

run_installs() {
    printf "${PURPLE}${BOLD}  INSTALLING${RESET}${CYAN} >> all variants${RESET}\n"
    neon_line 40
    printf '\n'

    for app in "${DETECTED[@]}"; do
        case "$app" in
            ghostty)          install_ghostty ;;
            alacritty)        install_alacritty ;;
            kitty)            install_kitty ;;
            warp)             install_warp ;;
            btop)             install_btop ;;
            k9s)              install_k9s ;;
            fzf)              install_fzf ;;
            fastfetch)        install_fastfetch ;;
            starship)         install_starship ;;
            tmux)             install_tmux ;;
            bat)              install_bat ;;
            lsd)              install_lsd ;;
            procs)            install_procs ;;
            atuin)            install_atuin ;;
            lazygit)          install_lazygit ;;
            git)              install_git ;;
            cosmic)           install_cosmic ;;
            vscode)           install_vscode ;;
            slack)            install_slack ;;
            windows-terminal) install_windows_terminal ;;
            neovim)           install_neovim ;;
            astronvim)        install_astronvim ;;
        esac
        printf '\n'
    done
}

# ─── Summary ─────────────────────────────────────────────────────────────────

summary() {
    neon_line 50
    printf "${PURPLE}${BOLD}  TRANSMISSION COMPLETE${RESET}\n"
    neon_line 50
    printf '\n'

    if [[ ${#INSTALLED[@]} -gt 0 ]]; then
        printf "${GREEN}${BOLD}  Installed (${#INSTALLED[@]})${RESET}\n"
        for item in "${INSTALLED[@]}"; do
            printf "${GREEN}    + %s${RESET}\n" "$item"
        done
        printf '\n'
    fi

    if [[ ${#SKIPPED[@]} -gt 0 ]]; then
        printf "${YELLOW}  Skipped (${#SKIPPED[@]})${RESET}\n"
        for item in "${SKIPPED[@]}"; do
            printf "${YELLOW}    ~ %s${RESET}\n" "$item"
        done
        printf '\n'
    fi

    if [[ ${#FAILED[@]} -gt 0 ]]; then
        printf "${RED}  Failed (${#FAILED[@]})${RESET}\n"
        for item in "${FAILED[@]}"; do
            printf "${RED}    x %s${RESET}\n" "$item"
        done
        printf '\n'
    fi

    printf "${CYAN}  Your environment is now running on SilkCircuit.${RESET}\n"
    printf "${GRAY}  Backups saved as *.silkcircuit.bak where applicable.${RESET}\n"
    printf '\n'
}

# ─── CLI interface ───────────────────────────────────────────────────────────

usage() {
    printf "${PURPLE}${BOLD}SilkCircuit Installer${RESET}\n\n"
    printf "${WHITE}Usage:${RESET} %s [options]\n\n" "$(basename "$0")"
    printf "${WHITE}Options:${RESET}\n"
    printf "  ${CYAN}-n, --dry-run${RESET}          Show what would be installed\n"
    printf "  ${CYAN}-y, --yes${RESET}              Skip confirmation prompts\n"
    printf "  ${CYAN}-h, --help${RESET}             Show this help\n"
    printf '\n'
}

confirm_install() {
    if [[ "$INTERACTIVE" == false ]]; then
        return 0
    fi

    printf "${WHITE}  Install SilkCircuit for ${#DETECTED[@]} detected apps? ${RESET}"
    printf "${GRAY}[Y/n]${RESET} "
    read -r answer
    case "$answer" in
        [nN]*) printf "\n${GRAY}  Aborted.${RESET}\n"; exit 0 ;;
    esac
    printf '\n'
}

main() {
    # Parse args
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -n|--dry-run) DRY_RUN=true; shift ;;
            -y|--yes)     INTERACTIVE=false; shift ;;
            -h|--help)    usage; exit 0 ;;
            *)            warn "Unknown option: $1"; shift ;;
        esac
    done

    banner
    detect_all
    confirm_install

    if [[ ${#DETECTED[@]} -eq 0 ]]; then
        warn "No supported apps detected"
        exit 0
    fi

    if [[ "$DRY_RUN" == true ]]; then
        printf "${YELLOW}${BOLD}  DRY RUN MODE${RESET}${GRAY} - no files will be modified${RESET}\n\n"
    fi

    run_installs
    summary
}

main "$@"
