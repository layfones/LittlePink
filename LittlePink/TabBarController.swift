//
//  TabBarController.swift
//  
//
//  Created by Layfones on 2022/5/3.
//

import UIKit
import YPImagePicker

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC {
            
            var config = YPImagePickerConfiguration()
            
            // MARK: 通用配置
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.albumName = Bundle.main.appName
            config.startOnScreen = .library
            config.screens = [.library, .video, .photo]
            config.showsCrop = .none
            config.targetImageSize = YPImageSize.original
            config.hidesStatusBar = false
            config.hidesBottomBar = false
            config.hidesCancelButton = false
            config.maxCameraZoomFactor = 5.0
            
            // MARK: 相册配置
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.spacingBetweenItems = 2.0
            
            // MARK: 视频配置
            config.video.fileType = .mov
            config.video.recordingTimeLimit = 60.0
            config.video.libraryTimeLimit = 60.0
            config.video.minimumTimeLimit = 3.0
            config.video.trimmerMaxDuration = 60.0
            config.video.trimmerMinDuration = 3.0
            
            // MARK: 画廊配置
            config.gallery.hidesRemoveButton = false
            
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled {
                    
                }
//                for <#item#> in <#items#> {
//
//                }
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
            
            
            return false
        }
        return true
    }

}
