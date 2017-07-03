//
//  CurrentLocationController.swift
//  ZP_Swift
//
//  Created by eims on 2017/7/3.
//  Copyright © 2017年 zp. All rights reserved.
//

//简单的定位。主要是熟悉iPhone定位的使用，位置的解析

//定位需要在info.plist中请求开启定位权限

/*使用定位的步骤：
 1.general->Linked Frameworks and Libraries导入CoreLocation.framework框架
 2.import CoreLocation
 3.然后就可以开始使用了
 */

import UIKit
import CoreLocation

class CurrentLocationController: UIViewController, CLLocationManagerDelegate {

    let button = UIButton(frame: CGRect(x: 30, y: ScreenHeight-100, width: ScreenWidth-60, height: 80))
    let label = UILabel(frame: CGRect(x: 10, y: 60, width: ScreenWidth-20, height: 100))
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupView()
        
        locationManager.delegate = self
        //精准度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }
    
    func setupView() {
        //将图片用作当前view的背景
        /*
         SWIFT
         view.layer.contents = UIImage(named:"Image_Name").CGImage
         Objective-C
         view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"Image_Name"].CGImage);
         */
        view.layer.contents = UIImage(named: "bg")?.cgImage
        
        //添加毛玻璃效果
        let visual = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        visual.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        
        label.numberOfLines = 0
        label.text = "未定位"
        label.textColor = .white
        label.textAlignment = .center
        
        button.setTitle("点击定位", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "Find my location"), for: .normal)
        button.addTarget(self, action: #selector(findLoaction), for: .touchUpInside)
        
        
        view.addSubview(visual)
        view.addSubview(label)
        view.addSubview(button)
    }
    
    func findLoaction() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }else{
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        label.text = "Error:" + error.localizedDescription
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocal = locations.first {
            CLGeocoder().reverseGeocodeLocation(newLocal, completionHandler: { (pms, err) in
                if (pms?.last?.location?.coordinate) != nil {
                    manager.stopUpdatingLocation()
                    
                    //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
                    let placemark:CLPlacemark = (pms?.last)!
                    
                    let country: String? = placemark.country
                    let locality: String? = placemark.locality
                    let name: String? = placemark.name
                    
                    self.label.text = String(country ?? "-") + String(locality ?? "-") + String(name ?? "-")
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
