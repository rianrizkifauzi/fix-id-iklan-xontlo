# Fix ID Iklan - Xontlo Edition

Fix ID Iklan (Advertising ID) untuk **Device Emulator Xontlo** dengan package name `com.google.android.reborn`

## Original
Script asli dari [firmantsani/fix-id-iklan](https://github.com/firmantsani/fix-id-iklan) yang menggunakan SHC obfuscation. Script tersebut dibuat untuk `com.google.android.gms` (Google Play Services standar).

## Modifikasi
- ✅ Deobfuscated dari SHC encryption
- ✅ Path diganti ke `com.google.android.reborn` (Xontlo)
- ✅ Auto-detect file `adid_settings.xml`
- ✅ File existence check
- ✅ Force stop app setelah ganti ID

## File
| File | Keterangan |
|------|-----------|
| `FixAd_xontlo.sh` | Script utama untuk Xontlo |
| `FixAd_clean.sh` | Script original yang sudah di-deobfuscate |
| `FixAd_original.sh` | Script original (obfuscated) |
| `deobfuscate.py` | Tool untuk deobfuscate SHC script |

## Cara Pakai
```bash
# Push ke device
adb push FixAd_xontlo.sh /data/local/tmp/

# Jalankan di device (via adb shell)
adb shell
su
sh /data/local/tmp/FixAd_xontlo.sh
```

## Credits
- Original script: [NoLifeNet/firmantsani](https://t.me/firmantsani)
- Deobfuscated & Modified: rianrizkifauzi
