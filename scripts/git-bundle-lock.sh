#!/usr/bin/env bash
#
# git-bundle-lock.sh
#
# Skapar en git bundle och krypterar den med gpg (AES256).
# Kan även dekryptera en tidigare skapad bundle.
#
# usage:
#   Skapa bundle:   git-bundle-lock.sh <path> [outputname] [-a] [-v]
#   Lås upp bundle: git-bundle-lock.sh -unlock <fil.bundle.gpg> [-v]
#
# Flaggor:
#   -a          Auto, hoppar över interaktiva frågor (namn och radering)
#   -v          Verbose loggning
#   -unlock     Dekrypterar en .bundle.gpg fil
#   -h, --help  Visar denna hjälptext

set -euo pipefail

SCRIPT_NAME=$(basename "$0")
VERBOSE=0
AUTO=0
UNLOCK=0
POSITIONAL=()

log() {
  if [ "$VERBOSE" -eq 1 ]; then
    echo "[$(date '+%H:%M:%S')] $*" >&2
  fi
}

usage() {
  cat <<EOF
Användning:
  Skapa bundle:   $SCRIPT_NAME <path> [valkrets] [-a] [-v]
  Lås upp bundle: $SCRIPT_NAME -unlock <fil.bundle.gpg> [-v]

Flaggor:
  -a          Auto, hoppar över interaktiva frågor (namn och radering)
  -v          Verbose loggning
  -unlock     Dekrypterar en .bundle.gpg fil
  -h, --help  Visar denna hjälptext
EOF
}

# ---- Argumentparsning ----
while [ $# -gt 0 ]; do
  case "$1" in
    -a)
      AUTO=1
      shift
      ;;
    -v)
      VERBOSE=1
      shift
      ;;
    -unlock | --unlock)
      UNLOCK=1
      shift
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "Okänd flagga: $1" >&2
      usage
      exit 1
      ;;
    *)
      POSITIONAL+=("$1")
      shift
      ;;
  esac
done

command -v gpg >/dev/null 2>&1 || {
  echo "gpg hittades inte i PATH. Installera gpg (Gpg4win, gnupg via brew/apt/pkg)." >&2
  exit 1
}

# ---- Unlock ----
if [ "$UNLOCK" -eq 1 ]; then
  BUNDLE_GPG="${POSITIONAL[0]:-}"
  if [ -z "$BUNDLE_GPG" ]; then
    echo "Ange sökväg till .bundle.gpg filen." >&2
    usage
    exit 1
  fi
  if [ ! -f "$BUNDLE_GPG" ]; then
    echo "Filen hittades inte: $BUNDLE_GPG" >&2
    exit 1
  fi

  OUT_FILE="${BUNDLE_GPG%.gpg}"
  log "Dekrypterar $BUNDLE_GPG till $OUT_FILE"
  gpg -d -o "$OUT_FILE" "$BUNDLE_GPG"
  echo "Klart. Okrypterad bundle: $OUT_FILE"
  exit 0
fi

# ---- Lock (skapa bundle) ----
REPO_PATH="${POSITIONAL[0]:-}"
if [ -z "$REPO_PATH" ]; then
  echo "Ange sökväg till repot." >&2
  usage
  exit 1
fi

if [ ! -d "$REPO_PATH" ]; then
  echo "Sökvägen finns inte eller är inte en katalog: $REPO_PATH" >&2
  exit 1
fi

if [ ! -d "$REPO_PATH/.git" ] && ! git -C "$REPO_PATH" rev-parse --git-dir >/dev/null 2>&1; then
  echo "Varning: $REPO_PATH ser inte ut att vara ett git repo." >&2
fi

DEFAULT_NAME=$(basename "$(cd "$REPO_PATH" && pwd)")
NAME_OVERRIDE="${POSITIONAL[1]:-}"

if [ -n "$NAME_OVERRIDE" ]; then
  BUNDLE_NAME="$NAME_OVERRIDE"
  log "Använder angivet namn: $BUNDLE_NAME"
elif [ "$AUTO" -eq 1 ]; then
  BUNDLE_NAME="$DEFAULT_NAME"
  log "Auto läge, använder default namn: $BUNDLE_NAME"
else
  read -rp "Valkrets namn [$DEFAULT_NAME]: " INPUT_NAME
  BUNDLE_NAME="${INPUT_NAME:-$DEFAULT_NAME}"
fi

DATE_STR=$(date '+%Y-%m-%d')
BUNDLE_FILE="${BUNDLE_NAME}-${DATE_STR}.bundle"
GPG_FILE="${BUNDLE_FILE}.gpg"

log "Skapar git bundle från $REPO_PATH"
git -C "$REPO_PATH" bundle create "$BUNDLE_FILE" --all
log "Bundle skapad: $BUNDLE_FILE"

log "Krypterar med gpg (AES256), lösenord frågas interaktivt av gpg"
gpg -c --cipher-algo AES256 -o "$GPG_FILE" "$BUNDLE_FILE"
echo "Krypterad bundle skapad: $GPG_FILE"

# ---- Radera okrypterad fil (frågar, om inte auto) ----
if [ "$AUTO" -eq 1 ]; then
  log "Auto läge, raderar okrypterad fil automatiskt"
  rm -f "$BUNDLE_FILE"
  log "Raderad: $BUNDLE_FILE"
else
  read -rp "Radera okrypterad fil '$BUNDLE_FILE'? [y/N]: " DEL_ANSWER
  case "$DEL_ANSWER" in
    [yY] | [yY][eE][sS])
      rm -f "$BUNDLE_FILE"
      echo "Raderad: $BUNDLE_FILE"
      ;;
    *)
      echo "Behåller: $BUNDLE_FILE"
      ;;
  esac
fi
