//
//  APIManagerWithActor.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 29/03/24.
//
import Foundation

actor APIManagerWithActor {
    
    static let sharedManager = APIManagerWithActor()
    
    private init() {}
    
    /*
     This method will call api using actor
     */
    
    internal func getListOfPatientList() async -> [PatientDetail]?  {
        do {
            guard let aURL = URL(string: "https://dev-bpor0tauun3lqj3.api.raw-labs.com/api/json") as URL? else {
                return nil
            }
            let (response,_) = try await URLSession.shared.data(from: aURL)
            guard let arrDetail = try JSONDecoder().decode([PatientDetail].self, from: response) as [PatientDetail]? else {
                return nil
            }
           return arrDetail
        } catch {}
        return nil
    }
}
