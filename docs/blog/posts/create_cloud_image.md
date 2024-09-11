---
date: 2024-09-11
categories:
  - cloud
  - vps
---

# How to Create a Cloud Image

![Banner](https://media.dev.to/cdn-cgi/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fsg9i2ujknepdkuy7426m.png)

## Step 1: Download Oracle Linux ISO

Download the Oracle Linux ISO from the Oracle website or the Oracle Linux yum server. For example, let's assume you have downloaded the Oracle Linux 8 ISO file and placed it in the /path/to/iso directory.

<!-- more -->

## Step 2: Set Up a Virtual Machine

Assuming you have KVM installed on your system, create a new VM or use an existing VM. Replace <vm_name>, <cpu_cores>, <memory_size>, and <disk_size> with appropriate values.

```bash
virt-install \
  --name <vm_name> \
  --ram <memory_size> \
  --vcpus <cpu_cores> \
  --disk size=<disk_size> \
  --os-variant=oraclelinux8 \
  --cdrom /path/to/iso/oraclelinux-8.x-x86_64-dvd.iso \
  --network bridge=<bridge_interface> \
  --graphics spice \
  --virt-type kvm \
  --import
```

## Step 3: Customize the VM

Start the VM and follow the standard Oracle Linux installation process to customize the system according to your requirements.

## Step 4: Remove Unnecessary Components

Use YUM to remove unnecessary components. For example, to remove the sendmail package:

```bash
sudo yum remove sendmail
```

## Step 5: Configure Networking

Ensure that the network is set up correctly on the VM. Update the network configuration file, usually located at /etc/sysconfig/network-scripts/ifcfg-eth0. Adjust the settings according to your network setup:

```bash
sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0
```

## Step 6: Enable Cloud-Init

Install and enable cloud-init on the Oracle Linux VM:

```bash
sudo yum install cloud-init
sudo systemctl enable cloud-init
sudo systemctl enable cloud-config
sudo systemctl enable cloud-final
```

## Step 7: Prepare Disk for Image Creation

Before creating the image, clean up the VM's disk:

### Clear package manager cache

```bash
sudo yum clean all
```

### Remove old kernel packages (optional)

```bash
sudo package-cleanup --oldkernels --count=1
```

 Zero out free space to reduce image size (optional)

```bash
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
```

## Step 8: Compress the Image

Compress the VM's disk into qcow2 format using qemu-img:

```bash
sudo qemu-img convert -f raw -O qcow2 /path/to/your/vm-disk.img /path/to/your/output_image.qcow2
```

## Step 9: Upload Image to KVM

Transfer the compressed image (qcow2 file) to the KVM host. You can use tools like SCP, SFTP, or any other file transfer method supported by your environment.

After completing these steps, you can then import the custom Oracle Linux image into KVM and create new VM instances based on it. Use KVM's management tools (virsh, Virt-Manager, etc.) to manage these instances.