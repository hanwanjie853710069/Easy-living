//
//  ELMyCellHeardView.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/3.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELMyCellHeardView: UIView ,
    UIActionSheetDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate,
UIApplicationDelegate{

    var headImage: UIButton!
    
    var nameLabel: UILabel!
    
    var backImage: UIImageView!
    
    var myS:UIViewController!
    
    
    
    init(frame: CGRect, nameLabel: String, heardImageUrl: UIImage, backImage: String, mySelf:UIViewController) {
        
        super.init(frame: frame)
        
        myS = mySelf
        
        creatUI(nameLabel,heardImageUrl: heardImageUrl ,backImage: backImage)
        
    }
    
    func creatUI(nameLabel: String, heardImageUrl: UIImage, backImage:String){
    
        self.backImage = UIImageView()
        self.backImage.image = UIImage(named: backImage)
        
        self.headImage = UIButton()
        self.headImage.layer.cornerRadius = (self.frame.size.height - 130)/2
        self.headImage.layer.masksToBounds = true
        self.headImage.layer.borderColor = UIColor.whiteColor().CGColor
        self.headImage.layer.borderWidth = 2
        
        if !NSFileManager.defaultManager().fileExistsAtPath(getHeardPath()) {
            
             self.headImage.setImage(UIImage(named: "heardImage"), forState: .Normal)
            
        }else{
            
            self.headImage.setImage(heardImageUrl,
                                    forState: .Normal)
        }
        
        self.nameLabel = UILabel()
        self.nameLabel.text = nameLabel
        self.nameLabel.textAlignment = .Center
        self.nameLabel.textColor = UIColor.whiteColor()
        
        self.addSubview(self.backImage)
        self.addSubview(self.headImage)
        self.addSubview(self.nameLabel)
        
        self.backImage.autoPinEdgesToSuperviewEdges()
        
        self.headImage.autoAlignAxisToSuperviewAxis(.Vertical)
        self.headImage.autoPinEdgeToSuperviewEdge(.Top, withInset: 50)
        self.headImage.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 80)
        self.headImage.autoSetDimension(.Width,
                                        toSize: self.frame.size.height - 130)
        
        self.nameLabel.autoPinEdgeToSuperviewEdge(.Left)
        self.nameLabel.autoPinEdgeToSuperviewEdge(.Right)
        self.nameLabel.autoSetDimension(.Height, toSize: 30)
        self.nameLabel.autoPinEdge(.Top,
                                   toEdge: .Bottom,
                                   ofView: self.headImage,
                                   withOffset: 20)
        
        headImage.addTarget(self,
                            action: #selector(self.heardImageTouch),
                            forControlEvents: .TouchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func heardImageTouch(){
        
        let sheet = UIActionSheet(title: nil,
                                  delegate: self,
                                  cancelButtonTitle: "取消",
                                  destructiveButtonTitle: nil,
                                  otherButtonTitles: "拍照","从相册中选取")
        
        sheet.showInView(myS.view)
        
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1{//选择照相机
            takePhotos()
        }else if buttonIndex == 2{
            selectedPhotos()//选择相册
        }
    }
    
    func takePhotos(){
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) == false{
            SVProgressHUD.showInfoWithStatus("当前设备不支持相机功能！")
            return
        }
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        cameraPicker.sourceType = .Camera
        myS.navigationController?.presentViewController(cameraPicker, animated: true, completion: { () -> Void in
            print("相机调用成功！")
        })
    }
    
    func selectedPhotos(){
        
        let photosPicker = UIImagePickerController()
        photosPicker.delegate = self
        photosPicker.allowsEditing = true
        photosPicker.sourceType = .PhotoLibrary
        myS.navigationController?.presentViewController(photosPicker, animated: true, completion: { () -> Void in
        })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in })
        if picker.sourceType == .Camera {
            let originalImage: AnyObject? = editingInfo[UIImagePickerControllerOriginalImage]
            UIImageWriteToSavedPhotosAlbum(originalImage! as! UIImage, nil, nil, nil)
        }
        
        let originalImage = editingInfo[UIImagePickerControllerOriginalImage] as? UIImage
        //        let smallImage = UIImageJPEGRepresentation(originalImage!, 0.5)
        headImage.setImage(originalImage, forState: .Normal)
        
        saveHeardImageWithImage(originalImage!)
        
        SVProgressHUD.showInfoWithStatus("头像修改成功")
        
        myS.dismissViewControllerAnimated(true, completion: { () -> Void in})
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        myS.dismissViewControllerAnimated(true, completion: { () -> Void in})
    }

}
