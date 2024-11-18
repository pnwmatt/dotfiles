#!/usr/bin/env bash

set -o nounset
set -o errexit

# Check if the "--run" flag is provided
if [[ "$1" != "--run" ]]; then
    echo "This script does nothing unless run with '--run'."
    exit 0
fi

NFS_SERVER_IP="192.168.9.10"
SHARE_PREFIX="/var/mnt/vol1"
MOUNTPOINT_PREFIX="/var/mnt/storage.feisar.ovh"
OPTS="soft,timeo=150,retrans=10,_netdev,nofail,x-systemd.automount,rw"

should_backup=true

echo -e "\033[0;32m>>>>> Configure NFS Mounts <<<<<\033[0m"

# Function to add an entry to /etc/fstab if it does not already exists based on share name
add_fstab_entry() {
    local share=$1
    local mount_point=$2
    local options=$3
    local dump_freq=$4
    local pass_num=$5

    local new_entry="${share} ${mount_point} nfs ${options} ${dump_freq} ${pass_num}"

    # Check if the entry's share name already exists in the file
    if grep -qwF "${mount_point}" /etc/fstab; then
        echo "An fstab entry for the share '${share}' already exists."
    else
        if ${should_backup}; then
            date=$(date +%Y%m%d-%H%M%S)
            local backup_file="/etc/fstab.${date}"
            sudo cp -p /etc/fstab "${backup_file}"
            echo "Backup of fstab created at ${backup_file}."
            should_backup=false
        fi

        sudo mkdir -p "${mount_point}"
        echo "Adding new fstab entry for the share '${share}'.'"
        echo "${new_entry}" | sudo tee -a /etc/fstab >/dev/null
    fi
}

add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/apps/frigate" "${MOUNTPOINT_PREFIX}/apps-frigate" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/photo" "${MOUNTPOINT_PREFIX}/photo" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/video" "${MOUNTPOINT_PREFIX}/video" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/shared-documents" "${MOUNTPOINT_PREFIX}/shared-documents" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/backups" "${MOUNTPOINT_PREFIX}/backups" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/music_transcoded" "${MOUNTPOINT_PREFIX}/music_transcoded" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/downloads" "${MOUNTPOINT_PREFIX}/downloads" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/home/helene" "${MOUNTPOINT_PREFIX}/home-helene" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/home/claude" "${MOUNTPOINT_PREFIX}/home-claude" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/music" "${MOUNTPOINT_PREFIX}/music" "${OPTS}" 0 0
add_fstab_entry "${NFS_SERVER_IP}:${SHARE_PREFIX}/piracy" "${MOUNTPOINT_PREFIX}/piracy" "${OPTS}" 0 0

if ! ${should_backup}; then
    systemctl daemon-reload
    sudo mount -a
fi
