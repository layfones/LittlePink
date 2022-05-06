//
//  Extensions.swift
//  LittlePink
//
//  Created by Layfones on 2022/5/3.
//

import UIKit

extension UIView {
    @IBInspectable
    var radius: CGFloat {
        get{
            self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIViewController {
    
    // MARK: - 展示加载框和提示框
    
    // MARK: 加载框
    
    // MARK: 提示框
    func showTextHUD(_ title: String, _ subTitle: String? = nil) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
}

extension Bundle {
    var appName: String {
        if let appName = localizedInfoDictionary?["CFBunldeDisplayName"] as? String {
            return appName
        } else {
            return infoDictionary?["CFBunldeDisplayName"] as! String
        }
    }
}
