echo "Script by NoLifeNet"
echo "https://t.me/firmantsani\n"
get=$(su -c grep -o ".*data/data/com.google.android.gms/shared_prefs/adid_settings.xml | cut -d-f 2 | cut -d -f 1 | head -n1)
echo "ID Iklan Lama ${get}"
echo "Masukan ID iklan DE"
read id_iklan
su -c sed -i "s/${get}/${id_iklan}/" /data/data/com.google.android.gms/shared_prefs/adid_settings.xml
echo "Done"
sleep 3
got=$(su -c grep -o ".*data/data/com.google.android.gms/shared_prefs/adid_settings.xml | cut -d-f 2 | cut -d -f 1 | head -n1)
echo "ID Iklan Baru ${got}"
sleep 1