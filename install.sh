#!/bin/sh
DOWNLOAD_URL="https://raw.githubusercontent.com/x1unix/plymouth-manager/master/plym.sh"
TMP_FILE="/tmp/plym"
DEST="/usr/local/bin/plym"
echo "Downloading plym..."
curl "${DOWNLOAD_URL}" -o "${TMP_FILE}"
local curl_result=$?
if [ $curl_result -ne 0 ]; then
	echo "ERROR: failed to download Plym (${curl_result})"
	exit 1
fi
chmod +x "${TMP_FILE}"
echo "Plym downloaded, copying to '${DEST}"
sudo mv "${TMP_FILE}" ${DEST}
echo "Done"
