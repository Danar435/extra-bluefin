ln -sf libfprint-2.so.2.0.0 /usr/lib64/libfprint-2.so.2
ln -sf libfprint-2.so.2 /usr/lib64/libfprint-2.so

ldconfig
systemd-hwdb update

dnf5 -y install fprintd

authselect enable-feature with-fingerprint