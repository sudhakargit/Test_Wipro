//
//  MainParserObject.swift
//  someCreation
//
//  Created by Amit Chakraborty on 30/04/18.
//  Copyright © 2018 Amit Chakraborty. All rights reserved.
//

import UIKit

class MainParserObject: NSObject {

    class func callVerifyEmailidWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/Company/verifyEmail"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    
    class func callCompanyIdsWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ result: [BranchDetails]) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: "api/GetBranches/"), arrValues: arrVal, isloader: true) { (status, result) in
            
            if status
            {
                let arrList = try! JSONDecoder().decode([BranchDetails].self, from: result)
                Completionhandeler(arrList.count > 0 ? true : false,arrList.count > 0 ? "Data Comming" : "No data found",arrList)
            }
        }
    }
//api/Employee
    class func callNewRegistrationWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/Employee"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .appJson) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    class func callNewLoginWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/UserLoginV2"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    //api/AddEmployeeLoginDetails
    class func callAddEmployeeDetailsWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/AddEmployeeLoginDetails"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    
    class func callEmployeeDetailsWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ result: BesicDetails) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: "api/Employee/"), arrValues: arrVal, isloader: true) { (status, result) in
            
            if status
            {
                let arrList = try! JSONDecoder().decode(BesicDetails.self, from: result)
                EmpBesic = arrList
                Completionhandeler(arrList.Success!,arrList.Message!,arrList)
            }
        }
    }
    //api/EmployeeOtherBasicDetails
    class func callEmployeeBesicDetailsWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: "api/EmployeeOtherBasicDetails/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                let arrList = try! JSONDecoder().decode(EmployeeBasicDetails.self, from: result)
                EmpBesicDEtails = arrList
                Completionhandeler(true,"arrList.Message")
            }
        }
    }
    
    class func callAddressListWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: "api/GetAllStopsV2/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                let arrList = try! JSONDecoder().decode(AddressList.self, from: result)
                kAddressList = arrList
                Completionhandeler(true,"arrList.Message")
            }
        }
    }
    
    
    //api/ModifyEmployeeMobileNo
    
    class func callModifyEmployeeMobileNoWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/ModifyEmployeeMobileNo"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    //VerifyEmployeeMobileNo
    class func callVerifyEmployeeMobileNoWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/VerifyEmployeeMobileNo"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    //https://fleetmanagement.astiinfotech.com/api/ModifyOfficeLocationEmployeeId=16214&NewOfficeLocationId=87&EffectiveFrom=07-09-2018
    class func callModifyOfficeLocationWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/ModifyOfficeLocation"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
  
    class func callUpdateAddressWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/UpdateAddress"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    class func callEmergencyContactWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ arrList: [EmergencyContact]) -> Void )
    {
        BaseParser.callGetWebserviceJson(serviceUrl: APP_SERVICE(str: "api/EmergencyContact/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                let dictResult = result as? [String : Any] ?? [:]
                let status = dictResult["Success"] as? Bool ?? false
                let mesg = dictResult["Message"] as? String ?? "No Mesg"
                let arrRes = dictResult["res_Obj"] as? [Dictionary<String, AnyHashable>] ?? []
                var arrEmergency = [EmergencyContact]()
                for data in arrRes{
                    let obj = EmergencyContact(EmergencyNumber: data["EmergencyNumber"] as? String ?? "", IsVerified: data["IsVerified"] as? Bool ?? false)
                    arrEmergency.append(obj)
                }
                Completionhandeler(status,mesg, arrEmergency)
            }
        }
    }
    class func callAddEmergencyContactWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/EmergencyContact"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    class func callDeleteEmergencyContactWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/DeleteEmergencyContact"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    class func callVerifyEmergencyContactWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ dictResult: [String: Any]) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/VerifyEmergencyContact"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "",resultDict)
            }
        }
    }
    class func callManagerListWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: "api/ReportTo/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                let arrList = try! JSONDecoder().decode(ManagerList.self, from: result)
                kManagerList = arrList
                Completionhandeler(true,"arrList.Message")
            }
        }
    }
    //UpdateBasicDetails
    class func callUpdateBasicDetailsWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/UpdateBasicDetails"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "")
            }
        }
    }
    class func callModifyManagerWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/ModifyManager"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "")
            }
        }
    }
    class func callodifyEmployeeStopWebservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/ModifyEmployeeStop"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "")
            }
        }
    }
    
    class func callCompanyModuleWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: "api/CompanyModule/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                let arrList = try! JSONDecoder().decode(CompanyModule.self, from: result)
                kCompanyModule = arrList
                Completionhandeler(true,"arrList.Message")
            }
        }
    }
    //api/GetShifts
    class func callSiftTimingsWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ arrTimings: [ShiftTimings]) -> Void )
    {
        BaseParser.callGetWebserviceJson(serviceUrl: APP_SERVICE(str: "api/GetShifts/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                let resultList = result as? [Dictionary<String,Any>] ?? []
                if resultList.count > 0 {
                    var arrlist = [ShiftTimings]()
                    for data in resultList{
                        
                        let dictConfiguration = data["Configuration"] as? [String: Any] ?? [:]
                        var obj = ShiftTimings()
                        obj.dropNodal = dictConfiguration["DropConsiderNodalPoint"] as? Int ?? 0
                        obj.pickupNodal = dictConfiguration["ConsiderNodalPoint"] as? Int ?? 0
                        obj.shiftID = data["StopId"] as? Int ?? 0
                        obj.time = data[""] as? String ?? ""
                        obj.strrtTime = data["StartTime"] as? String ?? ""
                        obj.endTime = data["EndTime"] as? String ?? ""
                        obj.shiftID = data["ShiftId"] as? Int ?? 0
                        arrlist.append(obj)
                    }
                     Completionhandeler(true,"arrList.Message", arrlist)
                }
            }
        }
    }
//api/CabRequestV2
    class func callCabRequestV2Webservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/CabRequestV2"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "")
            }
        }
    }
    //api/CabRequest
    class func callCabRequestListWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ arrresult: [ObjCabRequest]) -> Void )
    {
        BaseParser.callGetWebserviceJson(serviceUrl: APP_SERVICE(str: "api/CabRequest/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                var arrResultFinal = [ObjCabRequest]()
                let arrResult: Array = result as? [Any] ?? []
                for dict in arrResult{
                    let data = dict as? [String : Any] ?? [:]
                    var arrCabRequests = ObjCabRequest()
                    arrCabRequests.Direction = data["Direction"] as? Int ?? 0
                    arrCabRequests.RequestId = data["RequestId"] as? Int ?? 0
                    arrCabRequests.ShiftId = data["ShiftId"] as? Int ?? 0
                    arrCabRequests.EndDate = data["EndDate"] as? String ?? "0"
                    arrCabRequests.StartDate = data["StartDate"] as? String ?? "0"
                    arrCabRequests.ShiftTime = data["ShiftTime"] as? String ?? "0"
                    arrResultFinal.append(arrCabRequests)
                }
                Completionhandeler(true,"arrList.Message", arrResultFinal)
            }
        }
    }
    //GetAdHocSlots/14
    class func callGetAdHocSlotsWebservice( _ arrVal: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ arrresult: [CabSlots]) -> Void )
    {
        BaseParser.callGetWebserviceJson(serviceUrl: APP_SERVICE(str: "api/GetAdHocSlots/"), arrValues: arrVal, isloader: true) { (status, result) in
            if status
            {
                var arrResultFinal = [CabSlots]()
                let dictResult = result as? [String : Any] ?? [:]
                let status = dictResult["Success"] as? Bool ?? false
                let mesg = dictResult["Message"] as? String ?? "No Mesg"
                let arrRes = dictResult["res_Obj"] as? [Dictionary<String, AnyHashable>] ?? []
                for dict in arrRes{
                    let data = dict
                    var obj = CabSlots()
                    obj.SlotID = data["SlotID"] as? Int ?? 0
                    obj.SlotName = data["SlotName"] as? String ?? ""
                    obj.SlotStartTIme = data["SlotStartTIme"] as? String ?? ""
                    arrResultFinal.append(obj)
                }
                Completionhandeler(status,mesg, arrResultFinal)
            }
        }
    }
    // api/HocCabRequestV2
    class func callHocCabRequestV2Webservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/HocCabRequestV2"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "")
            }
        }
    }
    class func callGetMetroSchedulesV2Webservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/GetMetroSchedulesV2"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "")
            }
        }
    }
    class func callGetSchedulesV2Webservice( _ dict: [String: Any], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String) -> Void )
    {
        BaseParser.callWebservice(serviceUrl: APP_SERVICE(str: "api/GetSchedulesV2"), postValues: dict as [String : AnyObject], methodname: "POST", isloader: true, headerType: .urlEncoded) { (status, result) in
            if status
            {
                let resultDict = result as? [String: AnyHashable] ?? [:]
                Completionhandeler(resultDict["Success"] as? Bool ?? false,resultDict["Message"] as? String ?? "")
            }
        }
    }
    
    class func callEmployeeCalendarWebservice( _ dict: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ arrResult: [EmpHolidays]) -> Void )
    {
        BaseParser.callGetWebserviceJson(serviceUrl: APP_SERVICE(str: "api/EmployeeCalendar/"), arrValues: dict, isloader: false) { (status, result) in
            if status
            {
                let dictResult = result as? [String : Any] ?? [:]
                let status = dictResult["Success"] as? Bool ?? false
                let mesg = dictResult["Message"] as? String ?? "No Mesg"
                let arrRes = dictResult["res_Obj"] as? [Dictionary<String, AnyHashable>] ?? []
                var arrEmergency = [EmpHolidays]()
                for data in arrRes{
                    var obj = EmpHolidays()
                    obj.Reason = data["Reason"] as? String ?? ""
                    obj.StartDate = convertdFromStringToDate(strPreConvertedDate: data["StartDate"] as? String ?? "", strPreConvertedDatetimeFormat: "dd-MM-yyyy HH:mm:ss")
                    obj.EndDate = convertdFromStringToDate(strPreConvertedDate: data["EndDate"] as? String ?? "", strPreConvertedDatetimeFormat: "dd-MM-yyyy HH:mm:ss")
                    obj.Day = data["Day"] as? Int ?? 0
                    obj.IsHoliday = data["IsHoliday"] as? Bool ?? false
                    obj.IsNonWorking = data["IsNonWorking"] as? Bool ?? false
                    arrEmergency.append(obj)
                }
                Completionhandeler(status,mesg, arrEmergency)
            }
        }
    }
    class func callCabRequestV2Webservice( _ dict: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ arrResult: [CabRequest]) -> Void )
    {
        BaseParser.callGetWebservice(serviceUrl: APP_SERVICE(str: "api/CabRequestV2/"), arrValues: dict, isloader: false) { (status, result) in
            if status
            {
                var arr = [CabRequest]()
                let arrList = try! JSONDecoder().decode([CabRequest].self, from: result)
                arr = arrList
                Completionhandeler(true,"Success", arr)
            }
        }
    }
    class func callLeavesByEmployeeIdWebservice( _ dict: [String], handaler Completionhandeler: @escaping(_ status: Bool, _ strMesg: String, _ arrResult: [Leaves]) -> Void )
    {
        BaseParser.callGetWebserviceJson(serviceUrl: APP_SERVICE(str: "api/LeavesByEmployeeId/"), arrValues: dict, isloader: false) { (status, result) in
            if status
            {
                let dictResult = result as? [String : Any] ?? [:]
                let status = dictResult["Success"] as? Bool ?? false
                let mesg = dictResult["Message"] as? String ?? "No Mesg"
                let arrRes = dictResult["res_Obj"] as? [Dictionary<String, AnyHashable>] ?? []
                var arrEmergency = [Leaves]()
                for data in arrRes{
                    var obj = Leaves()
                    obj.RequestId = data["Reason"] as? Int ?? 0
                    let list = data["leaveDates"] as? [String] ?? []
                    obj.leaveDates = [Date]()
                    for data in list{
                        let dateNew = convertdFromStringToDate(strPreConvertedDate: data, strPreConvertedDatetimeFormat: "dd-MM-yyyy HH:mm:ss")
                        obj.leaveDates?.append(dateNew)
                    }
                    arrEmergency.append(obj)
                }
                Completionhandeler(status,mesg, arrEmergency)
            }
        }
    }
    
}

enum ContentTypeHeader: String {
    typealias RawValue = String 
    case urlEncoded = "application/x-www-form-urlencoded"
    case appJson = "application/json"
}

