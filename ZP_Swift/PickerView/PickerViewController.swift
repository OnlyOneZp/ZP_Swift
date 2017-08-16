//
//  PickerViewController.swift
//  ZP_Swift
//
//  Created by eims on 2017/8/15.
//  Copyright © 2017年 zp. All rights reserved.
//

////用PickerView实现的时间选择器。熟悉PickerView的使用

import UIKit

let PickerViewRect = CGRect(x: 0, y: ScreenHeight/3, width: ScreenWidth, height: ScreenHeight/3)
let LabelRect = CGRect(x: 0, y: 20, width: ScreenWidth, height: ScreenHeight/3-20)
let BtnRect = CGRect(x: 40, y: PickerViewRect.origin.y+PickerViewRect.size.height+30, width: ScreenWidth-80, height: 30)

class PickerViewController: UIViewController {

    let pickerView = UIPickerView(frame: PickerViewRect)
    let showLabel = UILabel(frame: LabelRect)
    let btn = UIButton(frame: BtnRect)
    let hours = 0...23
    let mins = 0...59
    let secs = 0...59
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        changLabelTiel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        
        showLabel.textColor = UIColor.orange
        showLabel.textAlignment = .center
        showLabel.font = UIFont.systemFont(ofSize: 30, weight: 5)
        
        btn.setTitle("随机选择", for: .normal)
        btn.setTitleColor(UIColor.orange, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: 5)
        btn.addTarget(self, action: #selector(randomTime), for: .touchUpInside)
        
        view.addSubview(pickerView)
        view.addSubview(showLabel)
        view.addSubview(btn)
    }
    
    func randomTime() {
        pickerView.selectRow(Int(arc4random())%hours.count, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random())%mins.count, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random())%secs.count, inComponent: 2, animated: true)
        
        changLabelTiel()
    }
    
    func changLabelTiel() {
        showLabel.text = "\(pickerView.selectedRow(inComponent: 0))时 \(pickerView.selectedRow(inComponent: 1))分 \(pickerView.selectedRow(inComponent: 2))秒"
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

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return mins.count
        default:
            return secs.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return ScreenWidth/3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 25
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        changLabelTiel()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        switch component {
        case 0:
            pickerLabel.text = String(Array(hours)[row])+"时"
        case 1:
            pickerLabel.text = String(Array(mins)[row])+"分"
        default:
            pickerLabel.text = String(Array(secs)[row])+"秒"
        }
        
        pickerLabel.textColor = UIColor.green
        pickerLabel.font = UIFont.systemFont(ofSize: 18, weight: 5)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }
//使用系统的cell
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch component {
//        case 0:
//            return String(Array(hours)[row])+"时"
//        case 1:
//            return String(Array(mins)[row])+"分"
//        default:
//            return String(Array(secs)[row])+"秒"
//        }
//    }
}

