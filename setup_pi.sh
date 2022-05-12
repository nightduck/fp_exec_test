# This script is based on ROS2 setup instructions and follows the same flow as our Dockerfiles

if [[ "$(lsb_release -cs)" != "focal" ]]
  then echo "This script only works on a Pi with Ubuntu Focal"
  exit
fi

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

ROS_DISTRO=rolling
DEBIAN_FRONTEND=noninteractive
apt-get update

apt-get install -y \
  locales \
  && locale-gen en_US.UTF-8 \
  && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ln -fs /usr/share/zoneinfo/UTC /etc/localtime \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get install -y tzdata \
  && dpkg-reconfigure --frontend noninteractive tzdata

apt-get update && apt-get install -y \
  curl \
  gnupg2 \
  lsb-release \
  sudo

curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=arm64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu focal main" > /etc/apt/sources.list.d/ros2.list

apt-get update && apt-get install -y \
bash-completion \
  build-essential \
  cmake \
  gdb \
  git \
  pylint3 \
  python3-argcomplete \
  python3-colcon-common-extensions \
  python3-pip \
  python3-rosdep \
  python3-vcstool \
  vim \
  wget \
  python3-autopep8 \
  python3-argcomplete \
  ros-$ROS_DISTRO-ros-base \
  ros-$ROS_DISTRO-ament-lint \
  ros-$ROS_DISTRO-ament-cmake-mypy \
  ros-$ROS_DISTRO-ament-cmake-google-benchmark \
  ros-$ROS_DISTRO-ament-mypy \
  ros-$ROS_DISTRO-launch-testing \
  ros-$ROS_DISTRO-launch-testing-ament-cmake \
  ros-$ROS_DISTRO-launch-testing-ros \
  ros-$ROS_DISTRO-mimick-vendor \
  ros-$ROS_DISTRO-performance-test-fixture \
  ros-$ROS_DISTRO-ros-testing \
  ros-$ROS_DISTRO-test-msgs \
  ros-$ROS_DISTRO-tracetools-analysis

pip3 install psrecord bokeh networkx numpy pandas

vcs < import src/ros2.repos src