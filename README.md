# KWTabbar
自定义Tabbar，实现各种凸起弧线效果
### 基于swift5实现，也适用于OC
- 实现样式1:
![屏幕录制2023-06-14 14.05.29.gif](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/d9e72d5680ef4a84ba809a99d0d08eca~tplv-k3u1fbpfcp-watermark.image?)

```
        let vcArr = [TabBar1VC(), TabBar2VC(), TabBar3VC(), TabBar4VC(), TabBar5VC()];
        let titleArr = ["tab1", "tab2", "tab3", "tab4", "tab5"];
        let normalImageArr = ["icon_guanli01", "icon_gongzuotai01", "icon_xiaoxi01", "icon_wode01", "icon_wode01"];
        let selectedImageArr = ["icon_guanli02", "icon_gongzuotai02", "icon_xiaoxi02", "icon_wode02", "icon_wode02"];
        
        //let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr)
        let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr ,backGroundColor: .yellow)
        vc.selectedIndex = 0;
        self.changeRootViewController(vc: vc)
```
- 实现样式2:
![屏幕录制2.gif](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6fc3d4e251414271ba38a4b1bbe97427~tplv-k3u1fbpfcp-watermark.image?)

```
        let vcArr = [TabBar1VC(), TabBar2VC(), TabBar3VC(), TabBar4VC(), TabBar5VC()];
        let titleArr = ["tab1", "tab2", "tab3", "tab4", "tab5"];
        let normalImageArr = ["icon_guanli01", "icon_gongzuotai01", "icon_xiaoxi01", "icon_wode01", "icon_wode01"];
        let selectedImageArr = ["icon_fabu", "icon_fabu", "icon_fabu", "icon_fabu", "icon_fabu"];
        
        let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr ,humpType: 1)
        vc.selectedIndex = 2;
        self.changeRootViewController(vc: vc)
```
- 实现样式3:
![屏幕录制3.gif](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/6e13fcdea4b247a69695e8bb22549030~tplv-k3u1fbpfcp-watermark.image?)

```
        let vcArr = [TabBar1VC(), TabBar2VC(), TabBar3VC(), TabBar4VC(), TabBar5VC()];
        let titleArr = ["tab1", "tab2", "tab3", "tab4", "tab5"];
        let normalImageArr = ["icon_guanli01", "icon_gongzuotai01", "icon_xiaoxi01", "icon_wode01", "icon_wode01"];
        let selectedImageArr = ["icon_fabu", "icon_gongzuotai02", "icon_fabu", "icon_wode02", "icon_fabu"];
        
        let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr ,humpType: 2 ,humpAddress: [0,2,4])
        vc.selectedIndex = 2;
        self.changeRootViewController(vc: vc)
```
- 实现样式4:
![屏幕录制4.gif](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a920d043cc664047a33eba21977e0e20~tplv-k3u1fbpfcp-watermark.image?)

```
        let vcArr = [TabBar1VC(), TabBar2VC(), TabBar3VC(), TabBar4VC(), TabBar5VC()];
        let titleArr = ["tab1", "tab2", "tab3", "tab4", "tab5"];
        let normalImageArr = ["icon_guanli01", "icon_gongzuotai01", "icon_xiaoxi01", "icon_wode01", "icon_wode01"];
        let selectedImageArr = ["icon_guanli02", "icon_gongzuotai02", "icon_fabu", "icon_wode02", "icon_wode02"];
        
        let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr ,humpType: 2 ,humpAddress: [2])
        vc.selectedIndex = 2;
        self.changeRootViewController(vc: vc)
```
- 实现样式5:
![屏幕录制5.gif](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e25a03fc9ecd4799b7a629cbe8bd438f~tplv-k3u1fbpfcp-watermark.image?)

```
        let vcArr = [TabBar1VC(), TabBar2VC(), TabBar3VC(), TabBar4VC(), TabBar5VC()];
        let titleArr = ["tab1", "tab2", "tab3", "tab4", "tab5"];
        let normalImageArr = ["icon_fabu", "icon_gongzuotai01", "icon_fabu", "icon_wode01", "icon_fabu"];
        let selectedImageArr = ["icon_fabu", "icon_gongzuotai02", "icon_fabu", "icon_wode02", "icon_fabu"];
        
        //let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr ,humpType: 3 ,humpAddress: [0,2,4])
        let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr ,humpType: 3 ,humpAddress: [0,2,4] ,backGroundColor: .yellow)
        vc.selectedIndex = 2;
        self.changeRootViewController(vc: vc)
```
- 实现样式6:
![屏幕录制6.gif](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3bfbfbd6ef07417bbddbc7cea26a27ab~tplv-k3u1fbpfcp-watermark.image?)

```
        let vcArr = [TabBar1VC(), TabBar2VC(), TabBar3VC(), TabBar4VC(), TabBar5VC()];
        let titleArr = ["tab1", "tab2", "tab3", "tab4", "tab5"];
        let normalImageArr = ["icon_guanli01", "icon_gongzuotai01", "icon_fabu", "icon_wode01", "icon_wode01"];
        let selectedImageArr = ["icon_guanli02", "icon_gongzuotai02", "icon_fabu", "icon_wode02", "icon_wode02"];
        
        let vc = KWTabBarController(vcArr, titleArr, normalImageArr, selectedImageArr ,humpType: 3 ,humpAddress: [2])
        vc.selectedIndex = 2;
        self.changeRootViewController(vc: vc)
```
