---
date: 2024-09-11
categories:
  - cloud
  - vps
---

# Setting Up OpenZFS on Rocky Linux

![Banner](https://repository-images.githubusercontent.com/437011/9b105700-57c3-11ea-98bb-79fbe7aa1db6)

The RHEL distribution of OpenZFS has two main implementations of ZFS, outlined below:

1. DKIMS (Dynamic Kernel Module Support)
This implementation is built on the premise that; the system should automatically recompile all DKMS modules if a new kernel version is installed. This allows drivers and devices outside the mainline kernel to continue working after a Linux kernel upgrade.

2. kABI-tracking kmod packages
The Kernel Application Binary Interface (kABI) is a set of in-kernel symbols used by drivers and other kernel modules. Each major and minor RHEL kernel release has a bunch of in-kernel symbols that are whitelisted. A kABI-tracking kmod package contains a kernel module that is compatible with a given kABI, that is, for a given major and minor release of the EL kernel.

<!-- more -->

The RHEL OpenZFS packages are provided by the following repository:

For EL7:

```bash
yum install https://zfsonlinux.org/epel/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm
```

and for EL8 and 9:

```
dnf install https://zfsonlinux.org/epel/zfs-release-2-3$(rpm --eval "%{dist}").noarch.rpm
```

After adding that repository, update your repository cache with either;

EL7

```bash
yum update -y
```

EL8 And above

```bash
dnf update -y
```

After that, you have the option to install either the DKMS or kABI-tracking kmod style packages.
I have not had any luck using the DKMS style package (which is the default) and as such, my personal preference is the kABI-tracking.

The commands that follow will only show how to install OpenZFS using EL 8 and above if you need to do this for EL 7 and below; replace `dnf` with `yum` and `dnf config-manager` with `yum-config-manager`

DKMS

Installing the DKMS style, requires the following three (3) commands:

```bash
dnf install -y epel-release
dnf install -y kernel-devel
dnf install -y zfs
```

kABI Style

Installing the kABI-Tracking kmod, disable the default DKMS style and then install zfs with the following commands.

```bash
dnf config-manager --disable zfs
dnf config-manager --enable zfs-kmod
dnf install zfs
```

By default, the OpenZFS kernel modules are automatically loaded when a ZFS pool is detected. If you would prefer to always load the modules at boot time you can create such configuration in `/etc/modules-load.d`:

Below is a helper command:

```bash
echo zfs >/etc/modules-load.d/zfs.conf
```

After that, you can confirm if zfs is properly set by using modprobe, as shown below:

```bash
/sbin/modprobe zfs
```

If you get an empty response, then all is well. Otherwise, get a cup of coffee and have fun debugging the issue.