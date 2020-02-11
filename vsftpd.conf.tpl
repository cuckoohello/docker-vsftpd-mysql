anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=NO
chown_uploads=YES
chown_username=vsftp
nopriv_user=vsftp
ascii_upload_enable=YES
ascii_download_enable=YES
ftpd_banner=Welcome to blah FTP service.
chroot_local_user=YES
allow_writeable_chroot=YES
listen=YES

guest_enable=YES
guest_username=vsftp
pam_service_name=vsftpd.mysql
# session_support=NO
user_sub_token=$USER
local_root=/home/$USER
passwd_chroot_enable=YES
virtual_use_local_privs=YES

# pasv
listen_port=${LISTEN_PORT:=21}
pasv_enable=${PASV_ENABLE:=YES}
pasv_address=${PASV_ADDRESS}
pasv_max_port=${PASV_MAX_PORT:=0}
pasv_min_port=${PASV_MIN_PORT:=0}

# tcp_wrappers=NO
seccomp_sandbox=NO
