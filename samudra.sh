#!/bin/bash
# SAMUDRA.sh - Termux Master Script by SAMUDRA

clear

# === INSTALASI DEPENDENSI ===
pkg install -y figlet toilet curl neofetch cmatrix termux-api git
gem install lolcat

# === Fungsi Loading ===
function SAMUDRA_loading() {
    for i in {1..3}; do
        echo -e "\e[1;32mSAMUDRA MODE BOOTING$(printf ' %.0s.' $(seq 1 $i))\e[0m"
        sleep 0.5
        clear
    done
}

# === Fungsi Menu Utama ===
function SAMUDRA_main_menu() {
    clear
    toilet -f pagga "SAMUDRA" | lolcat
    echo -e "\e[1;36m>> Ethical Hacker Terminal - by SAMUDRA <<\e[0m" | lolcat
    echo
    echo -e "\e[1;32m[1] Info Sistem & IP"
    echo -e "[2] Port Scan Lokal"
    echo -e "[3] Scan Jaringan Wi-Fi (SSID)"
    echo -e "[4] Simulasi Brute Force"
    echo -e "[5] Jalankan Efek Matrix"
    echo -e "[6] Periksa Pembaruan Script"
    echo -e "[0] Keluar\n\e[0m"
    read -p "Pilih Menu: " pilihan
    case $pilihan in
        1) SAMUDRA_sysinfo ;;
        2) SAMUDRA_portscan ;;
        3) SAMUDRA_wifiscan ;;
        4) SAMUDRA_bruteforce ;;
        5) cmatrix -C green ;;
        6) SAMUDRA_update ;;
        0) exit ;;
        *) echo "Pilihan tidak valid!" && sleep 1 && SAMUDRA_main_menu ;;
    esac
}

# === Fungsi Info Sistem ===
function SAMUDRA_sysinfo() {
    clear
    echo -e "\n\e[1;34m[ SAMUDRA SYSTEM INFO ]\e[0m" | lolcat
    neofetch --disable uptime memory --stdout | lolcat
    echo
    echo -e "\e[1;36mIP Publik:\e[0m $(curl -s https://ipinfo.io/ip)" | lolcat
    curl -s ipinfo.io | lolcat
    read -p "Tekan Enter untuk kembali..." enter
    SAMUDRA_main_menu
}

# === Fungsi Port Scan Lokal ===
function SAMUDRA_portscan() {
    clear
    echo -e "\n\e[1;33m[ SAMUDRA PORT SCAN - localhost ]\e[0m" | lolcat
    for SAMUDRA_port in 22 23 80 443 8080; do
      (echo > /dev/tcp/127.0.0.1/$SAMUDRA_port) >/dev/null 2>&1 && \
      echo -e "\e[1;32m[OPEN] Port $SAMUDRA_port\e[0m" || \
      echo -e "\e[1;31m[CLOSED] Port $SAMUDRA_port\e[0m"
    done
    read -p "Tekan Enter untuk kembali..." enter
    SAMUDRA_main_menu
}

# === Fungsi Scan Jaringan Wi-Fi ===
function SAMUDRA_wifiscan() {
    clear
    echo -e "\n\e[1;36m[ SAMUDRA WIFI SCAN ]\e[0m" | lolcat
    termux-wifi-scaninfo | lolcat
    read -p "Tekan Enter untuk kembali..." enter
    SAMUDRA_main_menu
}

# === Fungsi Simulasi Brute Force ===
function SAMUDRA_bruteforce() {
    clear
    echo -e "\n\e[1;31m[ SIMULASI BRUTE FORCE - UNTUK EDUKASI ]\e[0m" | lolcat
    read -p "Target IP/Host: " target
    read -p "Username: " user
    echo -e "Menyerang $target dengan username $user...\n" | lolcat
    for i in {1..10}; do
        echo -e "Mencoba password: pass$i..." | lolcat
        sleep 0.3
    done
    echo -e "\n\e[1;32mSimulasi selesai. Target $target tidak dapat dibobol (ETIKA DIUTAMAKAN).\e[0m" | lolcat
    read -p "Tekan Enter untuk kembali..." enter
    SAMUDRA_main_menu
}

# === Fungsi Pembaruan Script ===
function SAMUDRA_update() {
    clear
    echo -e "\n\e[1;36m[ SAMUDRA AUTO-UPDATER ]\e[0m" | lolcat
    echo -e "Memeriksa pembaruan dari GitHub..." | lolcat
    sleep 1
    echo -e "Fitur pembaruan otomatis belum diaktifkan. Hubungi SAMUDRA untuk pembaruan manual.\n" | lolcat
    read -p "Tekan Enter untuk kembali..." enter
    SAMUDRA_main_menu
}

# === MULAI PROGRAM ===
SAMUDRA_loading

# Ucapan Sambutan (jika termux-api tersedia)
termux-tts-speak "Selamat datang, Hacker SAMUDRA. Sistem siap."

SAMUDRA_main_menu