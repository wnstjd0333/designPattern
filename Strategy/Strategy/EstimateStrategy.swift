//
//  EstimateStrategy.swift
//  Strategy
//
//  Created by kimjunseong on 2020/02/17.
//  Copyright © 2020 kimjunseong. All rights reserved.
//
enum Vehicle{
    case bus, taxi, ferry, train
}

struct EstimateModel {
    var vehicleType: String?
    var vehicleFare: String?
    var estimatedDuration: String?
}

protocol EstimateStrategy {
    
    func calculateEstimates() -> (EstimateModel)
}

class FactoryEstimateStrategy: EstimateStrategy {
    var vehicle: Vehicle
    init(_ vehicle: Vehicle){
        self.vehicle = vehicle
    }
        
    func calculateEstimates() -> (EstimateModel) {
        switch vehicle {
        case .bus:
            return EstimateModel(vehicleType: "Bus", vehicleFare: "¥2000", estimatedDuration: "3hr 15min")
        case .taxi:
            return EstimateModel(vehicleType: "Taxi", vehicleFare: "¥15000", estimatedDuration: "45min")
        case .ferry:
            return EstimateModel(vehicleType: "Ferry", vehicleFare: "¥8000", estimatedDuration: "2hr 15min")
        case .train:
            return EstimateModel(vehicleType: "Train", vehicleFare: "¥6000", estimatedDuration: "1hr")
        }
    }
}


