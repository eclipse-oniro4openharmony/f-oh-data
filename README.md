> 2023-12-29 [F-OH Server Stop Announcement](https://gitee.com/westinyang/f-oh/blob/master/ServerStopAnnouncement.md)

# F-OH Data

[Program Introduction](#program-introduction)  
[Start the server](#start-the-server)  
[Start the server with Docker](#start-the-server-with-docker)  
[Submit Application](#submit-application)

## Program Introduction

F-OH All application program's metadata，~~Developer can submit their own open source apps~~

- Data sorting start and end time 2023-04-11 ~ 2023-12-29

## Start the server

This repository provided a simple server.

1. Install[Node.js](https://nodejs.org/)and npm（`npm` is always alone with `Node.js`）
2. Type `npm install` in the terminal to Install dependencies
3. Type `npm start` in the terminal to start the server
4. Go to `http://localhost:5000/allAppList.json` and you can find the app list of F-OH

Or

1. Install [Node.js](https://nodejs.org/) and `npm`，if the operating system is Windows，required to install git as well（in order to run `.sh` file）
2. Run `install-and-start.sh`

## Start the server with Docker

### **Build the Docker Image**

Run the following command:

```bash
docker build -t f-oh-data .
```

### **Run the Docker Container**

To start the container:

```bash
docker run -d -p 5000:5000 f-oh-data
```

## Submit Application

> Only free and open source software is included in F-OH，“Free software must be open source, but open source software is not necessarily free. Some open source licenses are too strict on users, so they are not listed as free software.”，Quoting the answer written by Richard Stallman, founder of Free GNU and FSF：[Why open source misses the point of free software?](https://www.gnu.org/philosophy/open-source-misses-the-point.zh-cn.html)

- Register a new account（Top Right Corner）
- Fork this repository
- Add new files
  - /data/Your app's bundle name/icon.png
  - /data/Your app's bundle name/appname-version.hap
- Modify `allAppList.json` with your app data，changing the following json into your own app information，all properties are required to fill.
  - id: Automatically increase manual review and modification
  - version: Not consider historical version，keep the newest version is enough
  - type: Fill only with `app` or `game`
  - tag: If tags are multiple，separate with commas
  - releaseTime: Release time is the time when you release the app，no need to modify in the future
  - If you are watching till here，I believe there is no need to introduce the rest!

```json
{
  "id": 1,
  "name": "device Infomation",
  "desc": "Device information viewing application, the first open source application~",
  "icon": "/data/org.ohosdev.deviceinfo/icon.png",
  "vender": "@westinyang",
  "packageName": "org.ohosdev.deviceinfo",
  "version": "1.0.0",
  "hapUrl": "/data/org.ohosdev.deviceinfo/DeviceInfo-1.0.0.hap",
  "type": "app",
  "tags": "Tool",
  "openSourceAddress": "https://gitee.com/ohos-dev/device-info",
  "releaseTime": "2023-03-22"
}
```

- Last step，make a Pull Request（PR），waiting for the test to pass before merging
- To update the application version later, first pull the latest code from the main repository, add a new installation package, modify the json metadata, and then submit a merge request (PR)
