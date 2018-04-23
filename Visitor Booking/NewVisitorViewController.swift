//
//  NewVisitorViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 13/04/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import WWCalendarTimeSelector
import DropDown
import JSONParserSwift
import SwiftyJSON
import Alamofire
import Toast_Swift
import RxSwift
import RxCocoa

class NewVisitorViewController: UIViewController, UITextFieldDelegate, WWCalendarTimeSelectorProtocol {
    
    
    @IBOutlet weak var selectCountryCode: SkyFloatingLabelTextField!
    

    
    @IBOutlet weak var datePicker: SkyFloatingLabelTextField!
    
    fileprivate var singleDate: Date = Date()
    
        static func createView() -> NewVisitorViewController {
      return NewVisitorViewController.instantiate(fromAppStoryboard: .Main)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        

        
        
        
        onClick(clickView: self.selectCountryCode, clickIndex: ACTION_COUNTRY_CODE)
        
        datePicker.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
           getAccessToken()
    }
    
    
    
    //Calendar delegate begins
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let selector = WWCalendarTimeSelector.instantiate()
        selector.delegate = self
        
        selector.optionTintColor = ConstData.PRIMARY_COLOR_HEX

        present(selector, animated: true, completion: nil)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    }


    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, date: Date) {
        print("Selected \n\(date)\n---")
        singleDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        datePicker.text = dateFormatter.string(from: date)
    }

    func WWCalendarTimeSelectorDone(selector: WWCalendarTimeSelector, date: Date) {
        print(date)
    }
    
    //Calendar delegate ends
    
    
   
     //User OnClick Methodg Start

    let disposeBag: DisposeBag = DisposeBag()
    let ACTION_COUNTRY_CODE = 0
   
    func onClick(clickView: UIView, clickIndex: Int){
        clickView.rx.tapGesture().when(.recognized).subscribe({ _ in
            self.handleTap(tapIndex: clickIndex)
        })
            .addDisposableTo(self.disposeBag)
    }
    
    //User OnClick Method Ends
    
    
    
    //handleTap Method Starts
    
    func handleTap(tapIndex: Int) {
        switch tapIndex {
        case ACTION_COUNTRY_CODE:
            self.selectCountryCode.resignFirstResponder()
            
            if ConstData.countriesList?.count == 0{
                self.view.makeToast("Country List not available", duration: 3.0, position: .bottom)
                return
            }
            
            let dropDown = DropDown()
            
            // The view to which the drop down will appear on
            dropDown.anchorView = self.selectCountryCode // UIView or UIBarButtonItem
            
            // The list of items to display. Can be changed dynamically
            var tmp = [String]()
            for (index, element) in (ConstData.countriesList?.enumerated())! {
                //                                                           print(index, " >> ", element.name)
                if (element.phone_prefix != nil){
                    tmp.append("\(element.name!) (\(element.phone_prefix != nil ? element.phone_prefix! : ""))")
                }
            } 
            dropDown.direction = .bottom
            dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
            dropDown.dataSource = tmp
            dropDown.show()
            //self.selectCountryCode.isUserInteractionEnabled = false
            
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index); \(ConstData.countriesList![index].phone_prefix!)")
                
                
                self.selectCountryCode.text = "\(ConstData.countriesList![index].phone_prefix!)"
//                self.selectCountryCode.isUserInteractionEnabled = false
                
            }
            
            break
            
        default:
            break
            
        }
            
        }
    
    
    
    //getAccessToken Request starts
    
    func getAccessToken(){
        
        
        var reqData: [String: String] = [:]
        reqData["grant_type"] = "password"
        reqData["username"] = ConstData.API_USERNAME
        reqData["password"] = ConstData.API_PWD
        reqData["client_id"] = ConstData.CLIENT_id
        reqData["client_secret"] = ConstData.CLIENT_SECRET
        
        //let accessToken = "abcdefg"
        var headers: [String: String] = [:]
        //headers["Authorization"] = "Bearer \(accessToken)"
        
        
        self.showLoading()
        
        APIRequest.postJSONReq(reqUrl: ConstData.GET_TOKEN, headerParams: headers, inputParams: reqData, success: { (result: JSON) in
            self.dismissLoading{
                print("Get Token Server Output \(result)")
                
                do {
                    // print("Get Token Server Output \(result)")
                    let responseData: ResponseData = try JSONParserSwift.parse(string: "\(result)")
                    // Use base response object here
                    
                    print("Server Output GSON like Parser: \(responseData.access_token!)")
                    
                    DataHelper.saveData(key: defaultsKeys.access_token, value: responseData.access_token!)
                    self.loadCountryList()
                    print("read stored data \(DataHelper.loadData(key: defaultsKeys.access_token))");
                    
                    
                } catch {
                    print(error)
                }
                
                //               let jsonResponse = JSON("\(result)")
                
                //   print("Server Output Parser Token: \(result["access_token"])")
                
                // print("Server Output Parser: \(jsonResponse["access_token"])")
                
            }
        }, failure: { (msg: String) in
            self.dismissLoading{
                print("Server Error \(msg)")
            }
            
        }, debug: true)
        
    }
    
    //getAccessToken Request ends

    //loadCountryList Request Start
    
    func loadCountryList(){
        
        
        var reqData: [String: String] = [:]
        //        reqData["grant_type"] = "password"
        //        reqData["username"] = ConstData.API_USERNAME
        //        reqData["password"] = ConstData.API_PWD
        //        reqData["client_id"] = ConstData.CLIENT_id
        //        reqData["client_secret"] = ConstData.CLIENT_SECRET
        
        //let accessToken = "abcdefg"
        var headers: [String: String] = [:]
        headers["Authorization"] = "Bearer \(DataHelper.loadData(key: defaultsKeys.access_token))"
        
        
        self.showLoading()
        
        APIRequest.JSONReq(reqUrl: ConstData.GET_COUNTRIES, method:HTTPMethod.get, headerParams: headers, inputParams: reqData, success: { (result: JSON) in
            self.dismissLoading{
                //print("Get Token Server Output \(result)")
                
                do {
                    // print("Get Token Server Output \(result)")
                    let responseData: ResponseData = try JSONParserSwift.parse(string: "\(result)")
                    // Use base response object here
                    
                    //                    print("Server Output GSON like Parser: \(responseData.access_token!)")
                    
                    ConstData.countriesList=responseData.data
                    
                    for (index, element) in (responseData.data?.enumerated())! {
                        print(index, ":", element.name)
                    }
                    
                    
               //disabled Datahelper
                    
                    
                    
//                           DataHelper.saveData(key: defaultsKeys.access_token, value: responseData.access_token!)
                    
                    
                    
                    
                    
                    
              //disabled Datahelper
                    
                    
   
                    print("read stored data \(DataHelper.loadData(key: defaultsKeys.access_token))");
                    
              //self.loadProvince()
                    
                    
                } catch {
                    print(error)
                }
                
                //               let jsonResponse = JSON("\(result)")
                
                //   print("Server Output Parser Token: \(result["access_token"])")
                
                // print("Server Output Parser: \(jsonResponse["access_token"])")
                
            }
        }, failure: { (msg: String) in
            self.dismissLoading{
                print("Server Error \(msg)")
            }
            
        }, debug: true)
        
    }
    
    //loadCountryList Request Ends
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    }
    
    
    

