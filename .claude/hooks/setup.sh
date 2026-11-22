#!/usr/bin/env bash
# Auto-install rea-video at the start of each Claude Code session.
# Skips the install if the CLI is already available.
cd "${CLAUDE_PROJECT_DIR:-$(dirname "$0")/../..}" || exit 0

if ! command -v rea-video >/dev/null 2>&1; then
  bash scripts/install_skill.sh >/tmp/rea-video-install.log 2>&1 \
    || { echo "rea-video install failed; see /tmp/rea-video-install.log"; exit 0; }
fi

# Reports in English by default
rea-video prefs lang en >/dev/null 2>&1 || true
echo "rea-video is ready. Attach a video and ask Claude to break it down."
exit 0
