//
//  DetailViewCtrl.swift
//  Passport
//
//  Created by HHH on 2020/10/7.
//  Copyright © 2020 HHH. All rights reserved.
//

import UIKit
import LLCycleScrollView

class DetailViewCtrl: UIViewController {

    var country : String!
    
    @IBOutlet var introduceLab: UILabel!
    @IBOutlet var travelImg: UIImageView!
    @IBOutlet var currentTime: UILabel!
    
    
    @IBOutlet var leftLab1: UILabel!
    @IBOutlet var leftLab2: UILabel!
    @IBOutlet var leftLab3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.leftLab1.font=UIFont.boldSystemFont(ofSize: 20)
        self.leftLab2.font=UIFont.boldSystemFont(ofSize: 20)
        self.leftLab3.font=UIFont.boldSystemFont(ofSize: 20)
        
        let date = Date()

        let dateFormat = DateFormatter()

//        dateFormat.dateFormat="yyyy-MM-dd HH:mm:ss"
        //年-月
         dateFormat.dateFormat="yyyy-MM"
        let year = dateFormat.string(from: date)
        
        //日
        dateFormat.dateFormat="dd"
        let day = dateFormat.string(from: date)
        
        //时
        dateFormat.dateFormat="HH"
        let hour = dateFormat.string(from: date)
        
        //分：秒
        dateFormat.dateFormat="mm:ss"
        let minute = dateFormat.string(from: date)

        
        let ukLocaleFormatter = DateFormatter()
        ukLocaleFormatter.locale = Locale(identifier: "en_GB")
        ukLocaleFormatter.dateStyle = DateFormatter.Style.medium
        ukLocaleFormatter.timeStyle = DateFormatter.Style.medium
        ukLocaleFormatter.string(from: date)
        
        let imagesURLStrings = NSMutableArray()
        
        if self.country == "Italy" {
            self.introduceLab.text = "Most of Italy has a subtropical Mediterranean climate. According to the different topography and geographical location of different parts of Italy, the country is divided into the following three climatic regions: the southern peninsula and islands region, the Matan Plain region and the Alps. Each of the three districts has a different climate"
            
            let current_hour = Int(hour)! - 7;
            
            if current_hour<0 {
                let current_day = Int(day)! - 1;
                self.currentTime.text = year + "-" + String(current_day) + " " + String(current_hour) + ":" + minute
            }else{
                self.currentTime.text = year + "-" + day + " " + String(current_hour) + ":" + minute
            }
            
            imagesURLStrings.add("Italy_01")
            imagesURLStrings.add("Italy_02")
            imagesURLStrings.add("Italy_03")
            imagesURLStrings.add("Italy_04")
            
        }else if (self.country == "England"){
            self.introduceLab.text = "England is a country of unequalled fascination. It is still one of the world's greatest heritage sites. England has been the home of many poets, and it still attracts many inspired artists... England is the most poetic lake in the British Isles."
            self.travelImg.image = UIImage(named: "02")
            let current_hour = Int(hour)! - 7;
            
            if current_hour<0 {
                let current_day = Int(day)! - 1;
                self.currentTime.text = year + "-" + String(current_day) + " " + String(current_hour) + ":" + minute
            }else{
                self.currentTime.text = year + "-" + day + " " + String(current_hour) + ":" + minute
            }
            
            imagesURLStrings.add("England_01")
            imagesURLStrings.add("England_02")
            imagesURLStrings.add("England_03")
            imagesURLStrings.add("England_04")
            
        }else if (self.country == "Norway"){
            self.introduceLab.text = "Norway is a highly developed capitalist country. It is also one of the richest countries in the world and a member of NATO. Its economy is an example of the successful combination of market liberalization and government macro-control"
            self.travelImg.image = UIImage(named: "03")
            
            let current_hour = Int(hour)! - 6;
            
            if current_hour<0 {
                let current_day = Int(day)! - 1;
                self.currentTime.text = year + "-" + String(current_day) + " " + String(current_hour) + ":" + minute
            }else{
                self.currentTime.text = year + "-" + day + " " + String(current_hour) + ":" + minute
            }
            
            imagesURLStrings.add("Norway_01")
            imagesURLStrings.add("Norway_02")
            imagesURLStrings.add("Norway_03")
            imagesURLStrings.add("Norway_04")
            
        }else if (self.country == "Spain"){
            self.introduceLab.text = "Spain is a developed capitalist country and a member of the European Union and NATO. As of December 2019, it is the fifth-largest economy in the eurozone, with the sixth largest GROSS domestic product in Europe and the 13th largest in the world"
            self.travelImg.image = UIImage(named: "04")
            
            let current_hour = Int(hour)! - 6;
            
            if current_hour<0 {
                let current_day = Int(day)! - 1;
                self.currentTime.text = year + "-" + String(current_day) + " " + String(current_hour) + ":" + minute
            }else{
                self.currentTime.text = year + "-" + day + " " + String(current_hour) + ":" + minute
            }
            
            imagesURLStrings.add("Spain_01")
            imagesURLStrings.add("Spain_02")
            imagesURLStrings.add("Spain_03")
            imagesURLStrings.add("Spain_04")
            
        }
        
        let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 0, width: 300, height: 240))
        // 是否自动滚动
        bannerDemo.autoScroll = true

        // 是否无限循环，此属性修改了就不存在轮播的意义了
        bannerDemo.infiniteLoop = true

        // 滚动间隔时间(默认为2秒)
        bannerDemo.autoScrollTimeInterval = 3.0

        // 设置图片显示方式=UIImageView的ContentMode
        bannerDemo.imageViewContentMode = .scaleAspectFill

        // 设置滚动方向（ vertical || horizontal ）
        bannerDemo.scrollDirection = .vertical

        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
        bannerDemo.customPageControlStyle = .system

        // 非.system的状态下，设置PageControl的tintColor
        bannerDemo.customPageControlInActiveTintColor = UIColor.red

        // 设置.system系统的UIPageControl当前显示的颜色
        bannerDemo.pageControlCurrentPageColor = UIColor.white

        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        bannerDemo.customPageControlIndicatorPadding = 8.0

        // 设置PageControl的位置 (.left, .right 默认为.center)
        bannerDemo.pageControlPosition = .center

        // 背景色
//        bannerDemo.collectionViewBackgroundColor

        // 添加到view
        self.travelImg.addSubview(bannerDemo)

        // 模拟网络图片获取
        bannerDemo.imagePaths = imagesURLStrings as! Array<String>
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
