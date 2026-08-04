#!/bin/bash
# Fix ID Iklan - Modified for Xontlo (com.google.android.reborn)
# Original by NoLifeNet/firmantsani - Deobfuscated & modified

PKG="com.google.android.reborn"
XML_PATH="/data/data/${PKG}/shared_prefs/adid_settings.xml"

echo "=== Fix ID Iklan (Xontlo) ==="
echo ""

# Check if file exists
if ! su -c "test -f ${XML_PATH}"; then
    echo "[!] File tidak ditemukan: ${XML_PATH}"
    echo "[*] Coba cari file adid..."
    su -c "find /data/data/${PKG} -name '*adid*' -o -name '*ad_id*' -o -name '*iklan*' 2>/dev/null"
    echo ""
    echo "[*] List shared_prefs:"
    su -c "ls /data/data/${PKG}/shared_prefs/ 2>/dev/null"
    exit 1
fi

# Get current ad ID
get=$(su -c "cat ${XML_PATH}" | grep -oP '(?<=>)[a-f0-9-]+(?=<)' | head -n1)

if [ -z "$get" ]; then
    echo "[!] Gagal baca ID iklan, coba format lain..."
    get=$(su -c "cat ${XML_PATH}" | cut -d'>' -f 2 | cut -d'<' -f 1 | head -n1)
fi

echo "ID Iklan Lama: ${get}"
echo ""
echo "Masukan ID iklan baru:"
read id_iklan

if [ -z "$id_iklan" ]; then
    echo "[!] ID kosong, abort."
    exit 1
fi

# Replace
su -c "sed -i 's/${get}/${id_iklan}/g' ${XML_PATH}"

echo ""
echo "Done! Restarting app..."
sleep 1

# Verify
got=$(su -c "cat ${XML_PATH}" | grep -oP '(?<=>)[a-f0-9-]+(?=<)' | head -n1)
echo "ID Iklan Baru: ${got}"

# Force stop app to apply
su -c "am force-stop ${PKG}" 2>/dev/null

echo ""
echo "=== Selesai ==="
