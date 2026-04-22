# Scenario
# The server has unmounted partitions that are not being used and could be utilized for additional storage.

# Task
# Identify unmounted partitions that are safe to use (avoiding system-critical partitions like /, /boot, /boot/efi, or swap), create an ext4 filesystem on one with a label data_extra, mount it at /mnt/test, and verify it's accessible.

#list block devices(hardrives)
lsblk 

#List the file system type of block devices 
lsblk -f

#Create file system. File system is basically formatted partition of block devices or a block device. All block devices in linux are under /dev directory
mkfs.ext4 -L data_extra /dev/loop0p2

#mount it to a folder to make it usable
mount -m /dev/loop0p2 /mnt/test
