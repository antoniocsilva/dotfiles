#!/usr/bin/env bash

echo
echo "################################################################################"
echo "Setup Anki flashcards..."

# #############################################################################
# Checks

if !(uname -a | grep -i -q linux) ; then
  echo "SKIP: Only Linux is supported." 1>&2
  exit
fi

# Check for idempotency
if type anki >/dev/null 2>&1 ; then
  echo "SKIP: Already installed." 1>&2
  exit
fi

# #############################################################################
# Globals

ANKI_INSTALLER=$(mktemp)
ANKI_VERSION=2.0.47
WORK_DIR=/tmp

# #############################################################################
# Install

curl -LSfs \
  "https://apps.ankiweb.net/downloads/current/anki-${ANKI_VERSION}-amd64.tar.bz2" \
  > "${WORK_DIR}/anki-${ANKI_VERSION}-amd64.tar.bz2" \
  && cd "${WORK_DIR}" \
  && tar xjf "${WORK_DIR}/anki-${ANKI_VERSION}-amd64.tar.bz2" \
  && cd "anki-${ANKI_VERSION}" \
  && sudo make install

# #############################################################################
# Verification

which anki

# #############################################################################
# Finish

echo "FINISHED Anki setup"
echo
