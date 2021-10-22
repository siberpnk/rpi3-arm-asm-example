#!/bin/bash

fasmarm ./kernel.asm ./kernel.img
sudo mount /dev/mmcblk0 /media/cyberminotaur/asm
sudo cp ./kernel.img /media/cyberminotaur/asm
sudo umount /media/cyberminotaur/asm
