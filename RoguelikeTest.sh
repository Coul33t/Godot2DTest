#!/bin/sh
echo -ne '\033c\033]0;RoguelikeTest\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/RoguelikeTest.x86_64" "$@"
