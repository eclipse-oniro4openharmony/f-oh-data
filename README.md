# F-OH Data

## 项目介绍

F-OH 所有应用程序的元数据，开发者可以在这里提交自己的开源应用（自建Git服务）

- F-OH的元数据服务器目前是自购自建，一个低配且不稳定的国外VPS
- 如果有人愿意赞助服务器的话，请转到主仓库查看说明：[F-OH赞助](https://gitee.com/ohos-dev/f-oh#%E8%B5%9E%E5%8A%A9%E6%89%93%E8%B5%8F)

## 如何提交你自己的应用？

- 注册一个账号（右上角）
- 派生（Fork）此仓库
- 新增文件
   - /data/你的应用包名/icon.png
   - /data/你的应用包名/应用名-版本号.hap
- 修改文件 `allAppList.json` 追加一段，下面示例json改为自己的应用信息
  - ID自增人工查看修改，暂时不考虑历史版本问题，保持最的版本信息即可
  - **重点：type应用类型只能填写app或者game**
  - releaseTime发布时间为首次发布时间，后续不必修改
  - 如果你已经操作到这里，我相信其他的属性没有必要去一一说明了
```json
{
    "id": 1,
    "name": "设备信息",
    "desc": "设备信息查看应用，开源应用第一弹~",
    "icon": "/data/org.ohosdev.deviceinfo/icon.png",
    "vender": "@westinyang",
    "packageName": "org.ohosdev.deviceinfo",
    "version": "1.0.0",
    "hapUrl": "/data/org.ohosdev.deviceinfo/DeviceInfo-1.0.0.hap",
    "type": "app",
    "tags": "工具",
    "openSourceAddress": "https://gitee.com/ohos-dev/device-info",
    "releaseTime": "2023-03-22"
}
```
- 最后一步，到主仓库发起合并请求（PR），等待我来合并即可
- 后续如果更新版本了，同样的操作，添加新的安装包，改下json元数据，提交PR
