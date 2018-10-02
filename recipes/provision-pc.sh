#!/usr/bin/env bash

# Base
bash "${RUNR_DIR:-.}"/recipes/shell.sh
bash "${RUNR_DIR:-.}"/recipes/apps.sh

# Desktop
bash "${RUNR_DIR:-.}"/recipes/xfce.sh
bash "${RUNR_DIR:-.}"/recipes/apps-desktop.sh

# System
bash "${RUNR_DIR:-.}"/recipes/fix.sh

# Devel
bash "${RUNR_DIR:-.}"/recipes/dev-stacks.sh
bash "${RUNR_DIR:-.}"/recipes/dev-tools.sh
bash "${RUNR_DIR:-.}"/recipes/dev-fonts.sh
