//
//  EstimateStrategy.swift
//  Strategy
//
//  Created by kimjunseong on 2020/02/17.
//  Copyright © 2020 kimjunseong. All rights reserved.
//

struct EstimateModel {
    var vehicleType: String?
    var vehicleFare: String?
    var estimatedDuration: String?
}

protocol EstimateStrategy {
    
    func calculateEstimates() -> (EstimateModel)
}
class BusEstimateStrategy: EstimateStrategy {
    
    static let sharedInstance : BusEstimateStrategy = BusEstimateStrategy()
    
    func calculateEstimates() -> (EstimateModel) {
        return EstimateModel(vehicleType: "Bus", vehicleFare: "¥2000", estimatedDuration: "3hr 15min")
    }
}

class TaxiEstimateStrategy: EstimateStrategy {
    
     static let sharedInstance : TaxiEstimateStrategy = TaxiEstimateStrategy()
    
    func calculateEstimates() -> (EstimateModel) {
        return EstimateModel(vehicleType: "Taxi", vehicleFare: "¥15000", estimatedDuration: "45min")
    }
}

class FerryEstimateStrategy: EstimateStrategy {
    
     static let sharedInstance : FerryEstimateStrategy = FerryEstimateStrategy()
    
    func calculateEstimates() -> (EstimateModel) {
        return EstimateModel(vehicleType: "Ferry", vehicleFare: "¥8000", estimatedDuration: "2hr 15min")
    }
}
class TrainEstimateStrategy: EstimateStrategy {
    
     static let sharedInstance : TrainEstimateStrategy = TrainEstimateStrategy()
    
    func calculateEstimates() -> (EstimateModel) {
        return EstimateModel(vehicleType: "Train", vehicleFare: "¥6000", estimatedDuration: "1hr")
    }
}
