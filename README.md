# Snapdragon-profiler-docker
Docker and setup files for snapdragon profiler

## Usage

* Create image using dockerfile
* Run launch container as follows
```
./launch-container.sh <Image Name> <Full path to host workspace directory>
```
* Inside docker
```
sudo chmod +x /usr/local/bin/setup-profiler.sh
./usr/local/bin/setup-profiler.sh
```

### Download Snapdragon profiler
Download snapdragon profiler from [here](https://developer.qualcomm.com/downloads/snapdragon-profiler-v20222-linux-installer)

Note:

ADB server should be running in host machine
