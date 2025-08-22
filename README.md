# 🖥️ x86-multitasking-kernel - Experience Multitasking on Your PC

[![Download Latest Release](https://img.shields.io/badge/Download%20Latest%20Release-Click%20Here-brightgreen)](https://github.com/srushtikapase/x86-multitasking-kernel/releases)

## 🚀 Getting Started

Welcome to the **x86-multitasking-kernel**, a simple and efficient multitasking operating system kernel designed for the x86 architecture. This kernel brings multitasking capabilities to your computer, allowing you to run multiple processes simultaneously. Let’s walk through the steps to get you set up.

## 📋 System Requirements

Before you start, ensure your computer meets these basic requirements:

- **Processor:** Intel or AMD x86 compatible processor.
- **RAM:** Minimum 512 MB of RAM.
- **Storage:** At least 100 MB of free disk space.
- **Virtual Machine:** QEMU installed (recommended for ease of use).

## ⚙️ What is cosmOS?

cosmOS is a 32-bit multitasking operating system kernel created from scratch. It features a custom bootloader, an efficient process scheduler, and a FAT16 filesystem. Built using **C** and **Assembly**, this kernel allows you to explore the workings of an operating system without needing advanced programming skills.

## ⬇️ Download & Install

To get started, visit the Releases page to download the latest version:

[Download Latest Release](https://github.com/srushtikapase/x86-multitasking-kernel/releases)

Once you navigate to the page, follow these steps to download and install cosmOS:

1. **Access the Releases Page:** Click on the provided link above to access the GitHub Releases page.
   
2. **Select the Latest Release:** Look for the latest version listed at the top. It should have a version number (e.g., v1.0).

3. **Download the Kernel:** Click on the downloadable file link (usually a `.zip` or `.img` file). This action will download the kernel to your computer.

4. **Unpack the Download:** Use a file extraction tool (such as WinRAR or 7-Zip) to unpack the downloaded file if it is in a zip format. If it’s an image file, you can skip this step.

5. **Load Using QEMU:**
   - If you haven’t installed QEMU, you’ll need to do that first. Follow the [QEMU Installation Guide](https://www.qemu.org/download/) for your operating system.
   - Once QEMU is installed, open your command line (Command Prompt, Terminal, etc.).
   - Navigate to the directory where you saved the kernel.
   - Run the command: 
     ```
     qemu-system-i386 -hda [your-kernel-file.img] 
     ```
     Replace `[your-kernel-file.img]` with the name of the downloaded file.

6. **Explore cosmOS:** You should see the boot screen of cosmOS. Feel free to explore its features and functionalities.

## 🌐 Features

- **Multitasking:** Run multiple applications at once without system slowdown.
- **Custom Bootloader:** Start your system quickly and efficiently.
- **FAT16 Filesystem:** Reliable data storage format for your files.
- **Lightweight Design:** Optimized for performance with minimal resource overhead.

## 🧑‍🏫 Learning Resources

If you're curious and want to learn more about operating systems, here are some resources you might find helpful:

- **Operating Systems: Three Easy Pieces:** A free textbook available online.
- **Understanding the Linux Kernel:** Offers insights into how kernels operate.
- **YouTube Tutorials on QEMU:** Visual guides on how to use QEMU efficiently.

## 🛠️ Troubleshooting

If you run into issues while downloading or running the kernel, consider the following solutions:

- **QEMU errors:** Ensure that QEMU is correctly installed. Check the official QEMU documentation for help.
- **File not found:** Verify you are in the correct directory where the kernel file is stored.
- **Performance issues:** Make sure your computer meets the minimum hardware requirements listed above.

## 📝 Contribution Guidelines

If you're interested in contributing to this project, please check the Issues section on GitHub for current development requests or ideas. Contributions can include documentation updates, code improvements, or bug fixes.

## 📬 Support

For any support, please reach out via the GitHub Issues page or contact the repository owner directly. Your feedback is valuable for improving this project.

Enjoy using cosmOS! We hope you find it to be a fun and educational experience.