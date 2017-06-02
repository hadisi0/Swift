//
//  ViewController.swift
//  swift-GCD
//
//  Created by xiaozhong on 2017/6/2.
//  Copyright © 2017年 xiaozhong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { (result) in
            print("获取数据 \(result)")
        }
        
        
        
        
    }
    //闭包 和 GCD的使用
    
    func loadData(completion:@escaping (_ resut:[String])->()) -> () {
        
        DispatchQueue.global().async {
            
            print("耗时操作 \(Thread.current)")
            
            
            Thread.sleep(forTimeInterval: 2.0)
            
            let json = ["我的","动态","联系人"]
            
            DispatchQueue.main.async(execute: {
                
                print("更新主线程 UI\(Thread.current)")
                
                completion(json)
                
                
                
            })
            
            
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

