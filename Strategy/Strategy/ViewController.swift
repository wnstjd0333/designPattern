//
//  ViewController.swift
//  Strategy
//
//  Created by kimjunseong on 2020/02/14.
//  Copyright © 2020 kimjunseong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var estimatesControl: EstimatesControl!
    @IBOutlet weak var vehicleOptionsControl: VehicleOptionsControl!
    
    let estimatesViewModel = EstimatesViewModel()
    
    var estimateStrategy: EstimateStrategy?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vehicleOptionsControl.vehicleSelectionDelegate = self
        estimatesControl.configure(withViewModel: estimatesViewModel)
    }
}

extension ViewController: VehicleSelectedDelegate {
    func onTaxiSelected() {
        estimateStrategy = TaxiEstimateStrategy.sharedInstance
        
        updateEstimates(estimateStrategy: estimateStrategy!)
    }
    
    func onBusSelected() {
        estimateStrategy = BusEstimateStrategy.sharedInstance
        
        updateEstimates(estimateStrategy: estimateStrategy!)

    }
    
    func onTrainSelected() {
        estimateStrategy = TrainEstimateStrategy.sharedInstance
        
        updateEstimates(estimateStrategy: estimateStrategy!)

    }
    
    func onFerrySelected() {
         estimateStrategy = FerryEstimateStrategy.sharedInstance
        
        updateEstimates(estimateStrategy: estimateStrategy!)

    }
    
    func updateEstimates(estimateStrategy: EstimateStrategy) -> (Void){
        let estimateModel = estimateStrategy.calculateEstimates()
        
        estimatesViewModel.vehicleTypeValue = estimateModel.vehicleType
        estimatesViewModel.vehicleFareValue = estimateModel.vehicleFare
        estimatesViewModel.estimatedTimeValue = estimateModel.estimatedDuration
        
        estimatesControl.configure(withViewModel: estimatesViewModel)
    }
}

