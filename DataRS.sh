#!/bin/bash
admin=$(zenity --forms --title="Login" --text="Masukkan akun administrator" \
				--add-entry="Nama Pengguna" \
				--add-password="Kata Sandi")
IFS="|" read -r user pwod <<< "$admin" ;
if [ $? -eq 1 ];then
exit 0;
fi
if [[ $pwod == "sehat" || $pwod == "waras" && $user != "" ]];then
(
echo "10" ; sleep 0.5
echo "# Verifikasi akun" ; sleep 1
echo "35" ; sleep 1
echo "# Mengupdate data" ; sleep 1
echo "75" ; sleep 2
echo "# Proses berhasil" ; sleep 0.5
echo "100" ; sleep 1
) | zenity --progress \
--title="Silahkan Tunggu" \
--percentage=0 --auto-close --width=300

if [ $? -eq 1 ];then
zenity --error --width=200 --height=70 \
--text="Proses berhenti!"
exit 0;
fi
let i=1;
let bou=20;
let ala=20;
let ang=20;
let se=30;
let ro=30;
let si=30;
let seme=50;
let wili=50;
let brom=50;
declare -A dokter;
declare -A perawat;
declare -A tensi;
declare -A suhu;
declare -A tglp;
declare -A periksa;
sisa() {
zenity --list --height=260 --width=483 --title="Data Ketersediaan Kamar" --text="Pastikan terdapat kamar kosong untuk pasien" \
			--column="Kelas 1" --column="Kelas 2" --column="Kelas 3" "Bougenville=$bou tersisa" "Sedudo=$se tersisa" "Semeru=$seme tersisa" "Alamanda=$ala tersisa" "Roro Kuning=$ro tersisa" "Wilis=$wili tersisa" "Anggrek=$ang tersisa" "Singokromo=$si tersisa" "Bromo=$brom tersisa"
if [ $? -eq 1 ]; then
	home;
else
	kelas;
fi
}
kelas() {
kelas=$(zenity --list --title="Pilih Kelas Kamar" --text="<b>Tarif kamar :</b> \nKelas 1 = Rp 3.000.000/hari\nKelas 2 = Rp 1.500.000/hari\nKelas 3 = Rp 500.000/hari" \
			--radiolist --hide-header --column "Pilih" --column "Pelayanan" TRUE "Kelas 1" FALSE "Kelas 2" FALSE "Kelas 3")
			if [ $? -eq 1 ]; then
			sisa;
			else kamar;
			fi
}
kamar () {
if [[ $kelas == "Kelas 1" ]]; then
				kmr=$(zenity --list --title="Kamar Kelas 1 Tersedia" --text="Tarif kamar kelas 1 Rp 3000.000/hari" \
				--radiolist --hide-header --column "Pilih" --column "Pelayanan" TRUE "Bougenville" FALSE "Alamanda" FALSE "Anggrek")
				let kali[i]=3000000				
				IFS="|" read -r kamarr[i] <<< "$kmr" ;
				if [[ ${kamarr[i]} == "Bougenville" && $bou > 0 ]];then
					kamar[i]=${kamarr[i]}$bou					
					let bou=$bou-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				elif [[ ${kamarr[i]} == "Alamanda" && $ala > 0 ]];then
					kamar[i]=${kamarr[i]}$ala					
					let ala=$ala-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				elif [[ ${kamarr[i]} == "Anggrek" && $ang > 0 ]];then
					kamar[i]=${kamarr[i]}$ang					
					let ang=$ang-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				else
				kamarr[i]=""
				zenity --error --title="Maaf" --text "Kesalahan! Silahkan lihat kamar yang tersedia" --width=200 --height=70
				sisa;	
				fi
				elif [[ $kelas == "Kelas 2" ]]; then
				kmr=$(zenity --list --title="Kamar Kelas 2 Tersedia" --text="Tarif kamar kelas 2 Rp 1.500.000/hari" \
				--radiolist --hide-header --column "Pilih" --column "Pelayanan" TRUE "Sedudo" FALSE "Roro Kuning" FALSE "Singokromo")
				let kali[i]=1500000				
				IFS="|" read -r kamarr[i] <<< "$kmr" ;
				if [[ ${kamarr[i]} == "Sedudo" && $se > 0 ]];then
					kamar[i]=${kamarr[i]}$se					
					let se=$se-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				elif [[ ${kamarr[i]} == "Roro Kuning" && $ro > 0 ]];then
					kamar[i]=${kamarr[i]}$ro					
					let ro=$ro-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				elif [[ ${kamarr[i]} == "Singokromo" && $si > 0 ]];then
					kamar[i]=${kamarr[i]}$si					
					let si=$si-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				else
				kamarr[i]=""
				zenity --error --title="Maaf" --text "Kesalahan! Silahkan lihat kamar yang tersedia" --width=200 --height=70
				fi
				elif [[ $kelas == "Kelas 3" ]]; then
				kmr=$(zenity --list --title="Kamar Kelas 3 Tersedia" --text="Tarif kamar kelas 3 Rp 500.000/hari" \
				--radiolist --hide-header --column "Pilih" --column "Pelayanan" TRUE "Semeru" FALSE "Wilis" FALSE "Bromo")
				let kali[i]=500000				
				IFS="|" read -r kamarr[i] <<< "$kmr" ;
				if [[ ${kamarr[i]} == "Semeru" && $seme > 0 ]];then
					kamar[i]=${kamarr[i]}$seme					
					let seme=$seme-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				elif [[ ${kamarr[i]} == "Wilis" && $wili > 0 ]];then
					kamar[i]=${kamarr[i]}$wili					
					let wili=$wili-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				elif [[ ${kamarr[i]} == "Bromo" && $brom > 0 ]];then
					kamar[i]=${kamarr[i]}$brom					
					let brom=$brom-1
					zenity --info --title="Sukses" --text "Data pasien telah tersimpan" --width=200 --height=70
				else
				kamarr[i]=""
				zenity --error --title="Maaf" --text "Kesalahan! Silahkan lihat kamar yang tersedia" --width=200 --height=70	
				fi
				fi
}
main() {
	if [[ $fitur == "Pelayanan" ]]; then
		pasien=$(zenity --list --title="Jenis Pelayanan" --text="Pilih jenis pelayanan pada pasien" \
			--radiolist --hide-header --column "Pilih" --column "Pelayanan" TRUE "Menginap" FALSE "Merawat" FALSE "Membayar")
		if [ $pasien == "Menginap" ]; then
			datapasien=$(zenity --forms --title="Data Pasien" --text="Masukkan data pasien" \
				--add-entry="Nama Pasien" \
				--add-combo="Jenis Kelamin" --combo-values="Laki-Laki|Perempuan"\
				--add-entry="Usia" \
				--add-entry="Alamat" \
				--add-entry="Keluhan" \
				--add-calendar="Tanggal")
			IFS="|" read -r nama[i] jenis[i] usia[i] alamat[i] keluhan[i] d <<< "$datapasien" ;
			tanggal[i]="20${d:6:2}-${d:3:2}-${d:0:2}"
			no[i]=$i;
			dok[i]=0
			per[i]=0
			status[i]="Dirawat"
			x[i]=0
		if [[ ${nama[i]} != "" ]]; then
		sisa;
		
		else
		zenity --error --title="Galat" --text "Lengkapi data pasien!" --width=200 --height=70
		fi
		elif [ $pasien == "Merawat" ]; then
			rekampasien=$(zenity --forms --title="Data Pasien" --text="Masukkan data pasien" \
				--add-entry="Nomor Urut Pasien" \
				--add-calendar="Tanggal Periksa" \
				--add-entry="Dokter"\
				--add-entry="Perawat"\
				--add-entry="Tekanan Darah"\
				--add-entry="Suhu Badan")
			IFS="|" read -r noo1 d dokter1 perawat1 tensi1 suhu1 <<< "$rekampasien" ;
			tglp1="20${d:6:2}-${d:3:2}-${d:0:2}"
			if [ $noo1 == ${no[$noo1]} ]; then
			x[$noo1]=$((x[$noo1]+1))
				if [[ $dokter1 != "" ]]; then
				noo[$noo1]=$noo1 dokter[$noo1,${x[$noo1]}]=$dokter1 perawat[$noo1,${x[$noo1]}]=$perawat1 tglp[$noo1,${x[$noo1]}]=$tglp1 tensi[$noo1,${x[$noo1]}]=$tensi1 suhu[$noo1,${x[$noo1]}]=$suhu1
				dok[$noo1]=$((dok[$noo1]+500000))
				periksa[$noo1,${x[$noo1]}]="Ke ${x[$noo1]}"
				zenity --info --title="Sukses" --text "Rekam medik pasien oleh dokter telah tersimpan" --width=200 --height=70
				elif [[ $perawat1 != "" ]]; then
				noo[$noo1]=$noo1 dokter[$noo1,${x[$noo1]}]=$dokter1 perawat[$noo1,${x[$noo1]}]=$perawat1 tglp[$noo1,${x[$noo1]}]=$tglp1 tensi[$noo1,${x[$noo1]}]=$tensi1 suhu[$noo1,${x[$noo1]}]=$suhu1
				per[$noo1]=$((per[$noo1]+250000))
				periksa[$noo1,${x[$noo1]}]="Ke ${x[$noo1]}"
				zenity --info --title="Sukses" --text "Rekam medik pasien oleh perawat telah tersimpan" --width=200 --height=70	
				fi
			else
				zenity --error --title="Galat" --text "Data pasien tidak ditemukan" --width=200 --height=70
			fi
		elif [ $pasien == "Membayar" ]; then
			biayapasien=$(zenity --forms --title="Pembayaran Tagihan" --text="Masukkan data pasien" \
				--add-entry="Nomor Urut Pasien" \
				--add-calendar="Tanggal Keluar" )
			IFS="|" read -r noo1 d <<< "$biayapasien" ;
			tglk[$noo1]="20${d:6:2}-${d:3:2}-${d:0:2}"		
			if [ $noo1 == ${no[$noo1]} ]; then
			keluar=$(date -d "${tglk[$noo1]}" "+%s")
			masuk=$(date -d "${tanggal[$noo1]}" "+%s")
			let hari=($(( ( $keluar/86400 ) - ( $masuk/86400) ))+1)
			let kamar=(${kali[$noo1]}*$hari)
			let penanganan=(${dok[$noo1]}+${per[$noo1]})
			let biaya=($kamar+$penanganan)
					zenity --info --title="Total Bayar" --text "<b>Rincian biaya :</b>\nKamar = $kamar \nPenanganan = $penanganan\n<b>Total yang harus dibayar = $biaya</b>" --width=500 --height=70
					no[$noo1]=""
					status[$noo1]="Keluar"
if [[ ${kamarr[$noo1]} == "Bougenville" ]];then
let bou=$bou+1;
elif [[ ${kamarr[$noo1]} == "Alamanda" ]];then
let ala=$ala+1;
elif [[ ${kamarr[$noo1]} == "Anggrek" ]];then
let ang=$ang+1;
elif [[ ${kamarr[$noo1]} == "Sedudo" ]];then
let se=$se+1;
elif [[ ${kamarr[$noo1]} == "Roro Kuning" ]];then
let ro=$ro+1;
elif [[ ${kamarr[$noo1]} == "Singokromo" ]];then
let si=$si+1;
elif [[ ${kamarr[$noo1]} == "Semeru" ]];then
let seme=$seme+1;
elif [[ ${kamarr[$noo1]} == "Wilis" ]];then
let wili=$wili+1;
elif [[ ${kamarr[$noo1]} == "Bromo" ]];then
let brom=$brom+1;
fi
					echo "${no[$noo1]} ${nama[$noo1]}|${jenis[$noo1]}|${usia[$noo1]}|${alamat[$noo1]}|${keluhan[$noo1]}|${tanggal[$noo1]}|${tglk[$noo1]}|$hari|$biaya" >> $HOME/dataHistory
			else
					zenity --error --title="Galat" --text "Pasien tidak terdaftar" --width=200 --height=70
			fi
		fi
	elif [[ $fitur == "Rekam Medik" ]]; then
		for o in $(seq 1 $i)
		do
			for v in $(seq 1 ${x[o]})
			do
				if [ ${noo[o]} != "" ]; then
					if [ ${noo[o]} == ${no[o]} ];then
					echo ${noo[o]}
					echo ${nama[o]}
					echo ${tglp[$o,$v]}
					echo ${dokter[$o,$v]}
					echo ${perawat[$o,$v]}
					echo ${tensi[$o,$v]}
					echo ${suhu[$o,$v]}	
					echo ${kamar[o]}
					echo ${periksa[$o,$v]}
					fi
				fi
			done
		done | zenity --list --height=720 --width=1366 --title="Data Pasien Rumah Sakit" --text="Data pasien menginap Rumah Sakit"\
			--column="No." --column="Nama" --column="Tanggal Periksa" --column="Dokter" --column="Perawat" --column="Tekanan Darah" --column="Suhu Badan" --column="Kamar  Pasien" --column="Periksa"
	elif [ $fitur == "Database" ]; then
		for o in $(seq 1 $i)
		do
		if [[ ${nama[o]} != "" && ${kamar[o]} != "" ]]; then
			masuk=$(date -d "${tanggal[o]}" "+%s")
			now=$(date "+%s")
			let hari=($(( ( $now/86400 ) - ( $masuk/86400) )) )
			let penanganan[o]=${dok[o]}+${per[o]}
			let biaya[o]=(${kali[o]}*$hari+${penanganan[o]})
			echo ${no[o]}
			echo ${nama[o]}
			echo ${jenis[o]}
			echo ${usia[o]}
			echo ${alamat[o]}
			echo ${keluhan[o]}
			echo ${tanggal[o]}
			echo ${kamar[o]}
			echo ${biaya[o]}
			echo ${status[o]}
		fi
		done | zenity --list --height=720 --width=1366 --title="Data Pasien Rumah Sakit" --text="Data pasien menginap Rumah Sakit"\
			--column="No." --column="Nama" --column="Jenis Kelamin" --column="Usia" --column="Alamat" --column="Keluhan" --column="Tanggal menginap" --column="Kamar Pasien" --column="Tagihan" --column="Status"
	elif [[ $fitur == "Edit Database" ]]; then
	datapasien=$(zenity --forms --title="Data Pasien" --text="Masukkan data pasien" \
				--add-entry="Nomor Urut Pasien" \
				--add-entry="Nama Pasien" \
				--add-combo="Jenis Kelamin" --combo-values="Laki-Laki|Perempuan"\
				--add-entry="Usia" \
				--add-entry="Alamat" \
				--add-entry="Keluhan" \
				--add-calendar="Tanggal")
			IFS="|" read -r noo1 nama1 jenis1 usia1 alamat1 keluhan1 d <<< "$datapasien" ;
			tanggal="20${d:6:2}-${d:3:2}-${d:0:2}"
		if [[ $noo1 == ${no[$noo1]} && $noo1 != "" ]];then
			no[$noo1]=$noo1 nama[$noo1]=${nama1} jenis[$noo1]=${jenis1} usia[$noo1]=${usia1} alamat[$noo1]=${alamat1} keluhan[$noo1]=${keluhan1} tanggal[$noo1]=${tanggal} 
				zenity --info --title="Sukses" --text "Data pasien telah diperbaiki" --width=200 --height=70
		elif [ $? -eq 1 ];then
				zenity --error --title="Galat" --text "Tidak ada data yang berubah" --width=200 --height=70		
		else
				zenity --error --title="Galat" --text "Data pasien tidak ditemukan" --width=200 --height=70
		fi
elif [ $fitur == "History" ]; then
cat "$HOME/dataHistory" | \
awk -F '|' '{
print NR;
for(i=1;i<=NF;i++){
print $i;
}
}' | \
zenity --list --height=720 --width=1366 --title="History Rawat Inap" --text="Data pasien yang pernah menginap di Rumah Sakit"\
			--column="No." --column="Nama" --column="Jenis Kelamin" --column="Usia" --column="Alamat" --column="Keluhan" --column="Tanggal Masuk" --column="Tanggal Keluar" --column="Lama Menginap" --column="Biaya"
elif [ $fitur == "Logout" ]; then
zenity --question --text="Apakah anda yakin ingin logout?" --default-cancel --width=200 --height=70
if [ $? -eq 0 ];then
pwod2=$(zenity --forms --width=350  --title="Masukkan Password" --text="Masukkan password untuk melanjutkan" \
				--add-password="Kata Sandi")
if [[ $pwod2 == $pwod ]];then
zenity --info --title="OK" --text "Akun dengan username $user telah logout!" --width=200 --height=70
exit 0;
else zenity --error --title="Galat" --text "Masukkan password dengan benar!" --width=200 --height=70
fi
fi
fi
}
home() {
	fitur=$(zenity --forms --title="Pilih Fitur" --text="Ini adalah fitur dari aplikasi"\
		--add-combo="Fitur Aplikasi" --combo-values="Pelayanan|Rekam Medik|Database|Edit Database|History|Logout")
if [ $? -eq 1 ]; then
	zenity --info --title="Jangan Keluar!!!" --text "Sistem harus selalu dalam kondisi aktif 24 jam" --width=200 --height=70
fi
main;
}
while 1>0
do
home;
	if [[ ${nama[i]} != "" && ${kamarr[i]} != "" ]]; then
	let i=$i+1;
	fi
done
else zenity --error --title="Gagal Login" --text "Masukkan akun yang benar!" --width=200 --height=70
exit 0;
fi

