//
//  KWTabBarController1.swift
//  KW
//
//  Created by 渴望 on 2023/6/13.
//

import UIKit
import Foundation


@objcMembers public class KWTabBarController: UITabBarController {
    
    var vcArr:[UIViewController] = []
    var titleArr:[String] = []
    var normalImageArr:[String] = []
    var selectedImageArr:[String] = []
    
    var humpType:NSInteger = 0;
    var humpAddress:[NSInteger] = [];
    
    var backGroundColor:UIColor = .white
    /*
     vcArr titleArr normalImageArr selectedImageArr 必传
     humpType：凸起类型：0=默认无凸起  1=全部Tabbar选中后凸起 2=部分Tabbar选中后凸起 3=部分Tabbar选中非选中全都凸起
     humpAddress: 凸起位置：humpType=2 或3时 传入此设置
     
     backGroundColor: 背景色
     */
    
    init(_ vcArr:[UIViewController] ,
         _ titleArr:[String] ,
         _ normalImageArr:[String] ,
         _ selectedImageArr:[String] ,
         humpType: Int = 0 ,
         humpAddress:[Int] = [] ,
         backGroundColor:UIColor = .white) {
        
        self.vcArr = vcArr
        self.titleArr = titleArr
        self.normalImageArr = normalImageArr
        self.selectedImageArr = selectedImageArr
        self.humpType = humpType
        self.humpAddress = humpAddress
        self.backGroundColor = backGroundColor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = self.backGroundColor
        kw_initialize()
        
        self.delegate = self
        
        for i in 0..<vcArr.count {
            let vc = vcArr[i]
            let item = UITabBarItem(title: titleArr[i],
                                    image: UIImage(named: normalImageArr[i])?.withRenderingMode(.alwaysOriginal),
                                    selectedImage: UIImage(named: selectedImageArr[i])?.withRenderingMode(.alwaysOriginal))
            vc.tabBarItem = item
            addChild(vc)
        }
        
        
        //代码修改selectedIndex 监听
        self.addObserver(self, forKeyPath: #keyPath(UITabBarController.selectedIndex), options: [.new, .old], context: &myContext)
    }
    private var myContext = 99999999990
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &myContext {
            if keyPath == #keyPath(UITabBarController.selectedIndex) {
                if let tabBarController = object as? UITabBarController {
                    let newTabIndex = tabBarController.selectedIndex
                    print("Selected Tab Index Changed to: \(newTabIndex)")
                    
                    if (self.humpType == 0) { //不需要绘制
                        return
                    } else if (self.humpType == 3) { //固定圆弧样式 只绘制一次
                        
                        let item = self.children[newTabIndex].tabBarItem ?? UITabBarItem()
                        self.setTabBarImageInsetsWithItem(item: item ,index: newTabIndex)
                        
                        var centerArr:[CGPoint] = [];
                        for idx in self.humpAddress {
                            let itemWidth = KScreenWidth / CGFloat(vcArr.count)
                            let centerX = itemWidth * CGFloat(idx) + itemWidth/2
                            centerArr.append(CGPointMake(centerX, 10))
                        }
                        self.setTabBarShadowWith(centerArr: centerArr, radius: 28 ,index: newTabIndex)
                        
                    }else{
                        self.setUpTabbarHump(index: newTabIndex)
                    }
                    
                }
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: #keyPath(UITabBarController.selectedIndex), context: &myContext)
    }
    
    private func kw_initialize() -> Void {
        let tabbarAppearance: UITabBar = UITabBar.appearance()
        tabbarAppearance.isTranslucent = false
        tabbarAppearance.barTintColor = .white
        
        
        if self.humpType == 0 {
            self.setTabBarShadowWith(centerArr: [], radius: 0, index: 0)
        }
//        self.tabBar.layer.shadowColor = UIColor(red: 78/255, green: 112/255, blue: 145/255, alpha: 0.19).cgColor
//        self.tabBar.layer.shadowOffset = CGSizeMake(0, -1.5)
//        self.tabBar.layer.shadowOpacity = 1;
//        self.tabBar.layer.shadowColor = UIColor.black.cgColor
//        self.tabBar.layer.shadowOffset = CGSizeMake(0, -1)
//        self.tabBar.layer.shadowOpacity = 1
//        if (self.humpType == 0) {
//            let view = UIView(frame: CGRectMake(0, -0.5, KScreenWidth, 0.5))
//            view.backgroundColor = .black
//            tabbarAppearance.insertSubview(view, at: 0)
//        }
        
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: KScreenWidth, height: 0.5), false, 0)
//        let path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: 0.5))
//        UIColor.red.setFill()// 自定义TabBar分割线颜色
//        path.fill()
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        tabBar.backgroundImage = UIImage()
//        tabBar.shadowImage = image
        
        
        
        var normalAttributes = [NSAttributedString.Key: Any]()
        normalAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 12)
        normalAttributes[NSAttributedString.Key.foregroundColor] = UIColor.black
        
        var selectedAttributes = [NSAttributedString.Key: Any]()
        selectedAttributes[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 12)
        selectedAttributes[NSAttributedString.Key.foregroundColor] = UIColor.red
        
        let item: UITabBarItem = UITabBarItem.appearance()
        item.setTitleTextAttributes(normalAttributes, for: .normal)
        item.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        
        //隐藏分割线🫥
        if #available(iOS 13.0, *) {
            let appearance:UITabBarAppearance = self.tabBar.standardAppearance.copy()
            appearance.backgroundImage = UIImage()
            appearance.shadowImage = UIImage()
            appearance.configureWithTransparentBackground()
            self.tabBar.standardAppearance = appearance
        }else{
            self.tabBar.backgroundImage = UIImage()
            self.tabBar.shadowImage = UIImage()
        }
        
    }
    
}

extension KWTabBarController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) ?? 0 //点击位置
        print("点击Tabbar %d",selectedIndex as Int)
        
        self.setUpTabbarHump(index: selectedIndex)
        
        return true
    }
    
    public override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
//MARK: -------
    func setUpTabbarHump(index:Int) {
        
        if (self.humpType == 0 || self.humpType == 3) {
            return
        }
        
        let item = self.children[index].tabBarItem ?? UITabBarItem()
        self.setTabBarImageInsetsWithItem(item: item ,index: index)
        
        let itemWidth = KScreenWidth / CGFloat(vcArr.count)
        let centerX = itemWidth * CGFloat(index) + itemWidth/2
        self.setTabBarShadowWith(centerArr: [CGPointMake(centerX, 10)], radius: 28 ,index: index)
        
        
    }
    
//MARK: 根据图片大小 修改位置
    func setTabBarImageInsetsWithItem(item:UITabBarItem ,index:Int) {
        for vc in self.children {
            
            if (self.humpType == 1) {
                if (item == vc.tabBarItem) {
                    vc.tabBarItem.imageInsets = UIEdgeInsets(top: -15, left: 0, bottom: 0, right: 0)
                }else{
                    vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
            }else if (self.humpType == 2) {
                if (item == vc.tabBarItem && self.humpAddress.contains(index)) {
                    vc.tabBarItem.imageInsets = UIEdgeInsets(top: -15, left: 0, bottom: 0, right: 0)
                }else{
                    vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
            }else if (self.humpType == 3) {
                let humpArrContain_index = self.children.firstIndex(of: vc) ?? 0
                if (self.humpAddress.contains(humpArrContain_index)) {
                    vc.tabBarItem.imageInsets = UIEdgeInsets(top: -15, left: 0, bottom: 0, right: 0)
                }else{
                    vc.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                }
            }
            
            
        }
    }
//MARK: 绘制凸起弧线 阴影
    func setTabBarShadowWith(centerArr:[CGPoint], radius:CGFloat ,index:Int) {
        //center 圆弧中心 radius 圆弧半径
        
        
        let layer = CAShapeLayer()
        //背景填充色
        layer.fillColor = self.backGroundColor.cgColor;
        //阴影设置
        layer.shadowColor = UIColor(red: 78/255, green: 112/255, blue: 145/255, alpha: 0.19).cgColor
        layer.shadowOffset = CGSizeMake(0, -1.5)
        layer.shadowOpacity = 1;
        
        let path = UIBezierPath()
        path.lineCapStyle = .round
        for center in centerArr {
            let a:CGFloat = center.y
            let angle:CGFloat = asin(a/radius)
            path.move(to: CGPointMake(0, 0))
            path.addArc(withCenter: center, radius: radius, startAngle: angle+Double.pi, endAngle: 2*Double.pi - angle, clockwise: true)
        }
        path.addLine(to: CGPointMake(KScreenWidth, 0))
        path.addLine(to: CGPointMake(KScreenWidth, KTabBarHeight))
        path.addLine(to: CGPointMake(0, KTabBarHeight))
        
        if (self.humpType == 2 && !self.humpAddress.contains(index) ||
            self.humpType == 0 ) {
            //只设置阴影
            let shadowSize: CGFloat = 0
            let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2, y: -shadowSize / 2, width: tabBar.bounds.width + shadowSize, height: tabBar.bounds.height + shadowSize))
            layer.path = shadowPath.cgPath

        }else {
            //设置阴影和凸起弧线
            layer.path = path.cgPath
            path.close()
            layer.shadowPath = path.cgPath
        }
        
        //删除重复添加的 CAShapeLayer
        if let subLayers = self.tabBar.layer.sublayers {
            let removedLayers = subLayers.filter { $0 is CAShapeLayer }
            removedLayers.forEach { $0.removeFromSuperlayer() }
        }
        self.tabBar.layer.insertSublayer(layer, at: 0)
        
    }
    
}

