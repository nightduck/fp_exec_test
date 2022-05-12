# Experiments for FIFO Executor on ROS2

This tests our executor along with default executor strategies. It is intended to be benchmarked on
specific hardware, with setup scripts provided.

## Setup

On a Raspberry Pi 4B, install Ubuntu Focal 64-bit. If you're targetting the rolling release, go ahead and run setup_pi.sh on bootup.

If you're targetting another release, edit the line in `setup.sh` that says `ROS_DISTRO=rolling`, as well as the ros2.repos file. We've provided 2 variants to pull both our work and Zhishan Guo's EDF scheduler.
