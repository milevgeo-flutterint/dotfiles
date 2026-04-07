#!/bin/bash
# block_internal_keyboard.sh
# Usage:
#   ./block_internal_keyboard.sh        — block internal keyboard
#   ./block_internal_keyboard.sh reset  — restore everything
if [[ "${1}" == "reset" ]]; then
  echo "Resetting all key mappings..."
  hidutil property --set '{"UserKeyMapping":[]}'
  echo "Done. Internal keyboard restored."
  exit 0
fi

# Fix § and ~ swap on external keyboard
echo "Applying § / ~ fix for external keyboard..."
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'

# Build the JSON mapping
MAPPING=$(python3 -c "
import json
NULL = 0xffffffffffffffff
BASE = 0x700000000
keys = list(range(0x04, 0xA5)) + list(range(0xE0, 0xE8))
mapping = [{'HIDKeyboardModifierMappingSrc': BASE+k, 'HIDKeyboardModifierMappingDst': NULL} for k in keys]
print(json.dumps({'UserKeyMapping': mapping}, separators=(',',':')))
")

# Find LocationID for the internal keyboard (VendorID and ProductID are 0x0)
echo "Scanning for internal keyboard by LocationID..."
LOCATION_ID=$(hidutil list 2>/dev/null | awk '
  tolower($0) ~ /apple internal keyboard/ {
    if ($3 ~ /^0x[1-9a-fA-F]/) { print $3; exit }
  }
')

if [[ -z "$LOCATION_ID" ]]; then
  echo "❌ Could not detect LocationID. Run 'hidutil list' and look for 'Apple Internal Keyboard' row."
  exit 1
fi

echo "Found internal keyboard LocationID: $LOCATION_ID"
MATCH="{\"LocationID\":${LOCATION_ID}}"
echo "Applying block with matching: $MATCH"
hidutil property --matching "$MATCH" --set "$MAPPING"

echo ""
echo "✅ Done. Internal keyboard blocked + § / ~ fix applied."
echo "   To restore: ./block_internal_keyboard.sh reset"