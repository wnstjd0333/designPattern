//
//  VehicleOptionsControl.swift
//  Strategy
//
//  Created by kimjunseong on 2020/02/14.
//  Copyright © 2020 kimjunseong. All rights reserved.
//

import UIKit

protocol VehicleSelectedDelegate: class {
    func onTaxiSelected() -> ()
    func onBusSelected() -> ()
    func onTrainSelected() -> ()
    func onFerrySelected() -> ()
}

class VehicleOptionsControl: UIControl {

    var view: UIView!
    
    @IBOutlet weak var btnBus: UIButton!
    @IBOutlet weak var btnTaxi: UIButton!
    @IBOutlet weak var btnFerry: UIButton!
    @IBOutlet weak var btnTrain: UIButton!
    
    weak var vehicleSelectionDelegate: VehicleSelectedDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "VehicleOptionsControl", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        layer.masksToBounds = true
        return view
    }

    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    @IBAction func busSelected(_ sender: UIButton) {
        deselectAll()
        sender.isSelected = true
        guard let vehicleSelectionDelegate = vehicleSelectionDelegate else {
            print("No subscription to vehicle selection!")
            return
        }
        vehicleSelectionDelegate.onBusSelected()
    }
    @IBAction func taxiSelected(_ sender: UIButton) {
        deselectAll()
        sender.isSelected = true
        guard let vehicleSelectionDelegate = vehicleSelectionDelegate else {
            print("No subscription to vehicle selection!")
            return
        }
        vehicleSelectionDelegate.onTaxiSelected()
    }
    @IBAction func ferrySelected(_ sender: UIButton) {
        deselectAll()
        sender.isSelected = true
        guard let vehicleSelectionDelegate = vehicleSelectionDelegate else {
            print("No subscription to vehicle selection!")
            return
        }
        vehicleSelectionDelegate.onFerrySelected()
    }
    @IBAction func trainSelected(_ sender: UIButton) {
        deselectAll()
        sender.isSelected = true
        guard let vehicleSelectionDelegate = vehicleSelectionDelegate else {
            print("No subscription to vehicle selection!")
            return
        }
        vehicleSelectionDelegate.onTrainSelected()
    }
    
    func deselectAll() -> (Void){
        btnBus.isSelected = false
        btnTaxi.isSelected = false
        btnFerry.isSelected = false
        btnTrain.isSelected = false
    }
    
}
