# F-OH Data

## 项目介绍

F-OH 所有应用程序的元数据，开发者可以在这里提交自己的开源应用（自建Git服务）

- F-OH的元数据服务器目前是自购自建，配置较低不太稳定
- 如果有人愿意赞助服务器的话，请转到主仓库查看说明：[F-OH赞助](https://gitee.com/ohos-dev/f-oh#%E8%B5%9E%E5%8A%A9%E6%89%93%E8%B5%8F)

## 如何提交你自己的应用？

> F-OH仅收录自由开源软件，“自由软件必定开源，开源软件未必自由，有些开源许可证对用户过于苛刻，它们就没有被列为自由软件”，引用自由GNU，FSF创始人——Richard Stallman编写的回答：[为什么开源错失了自由软件的重点？](https://www.gnu.org/philosophy/open-source-misses-the-point.zh-cn.html)

- 加入Q群：752399947，有问题方便及时沟通
- 注册一个账号（右上角）
- 派生（Fork）此仓库
- 新增文件
   - /data/你的应用包名/icon.png
   - /data/你的应用包名/应用名-版本号.hap
- 修改文件 `allAppList.json` 追加一段，下面示例json改为自己的应用信息，所有属性均为必填
  - id: 自增人工查看修改
  - version: 暂时不考虑历史版本问题，保持最的版本信息即可
  - type: 只能填写 `app` 或者 `game`
  - tag: 标签如果有多个，用中文逗号分隔
  - releaseTime: 发布时间为首次发布时间，后续不必修改
  - 如果你已经操作到这里，我相信其他的属性没有必要去一一说明了！
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
- 最后一步，发起合并请求（PR），等待测试通过后合并
- 后续更新应用版本，先从主仓库拉取最新代码，添加新的安装包，改下json元数据，再提交合并请求（PR）
