//
//  EstimatesControl.swift
//  Strategy
//
//  Created by kimjunseong on 2020/02/14.
//  Copyright © 2020 kimjunseong. All rights reserved.
//

import UIKit

protocol EstimatesViewPresentable {
    var vehicleTypeValue: String? {get}
    var vehicleFareValue: String? {get}
    var estimatedTimeValue: String? {get}
}

class EstimatesViewModel: EstimatesViewPresentable {
    var vehicleFareValue: String? = "None"
    var vehicleTypeValue: String? = "¥0.0"
    var estimatedTimeValue: String? = "0hr 0min"
}

class EstimatesControl: UIControl {
    
    var view: UIView!

    @IBOutlet weak var lblVehicleType: UILabel!
    @IBOutlet weak var lblVehicleFare: UILabel!
    @IBOutlet weak var lblEstimatedTime: UILabel!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func loadViewFromNib() -> UIView {
        let nib = UINib(nibName: "EstimatesControl", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    func xibSetup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func configure(withViewModel viewModel: EstimatesViewPresentable) {
        lblVehicleType.text = viewModel.vehicleTypeValue!
        lblVehicleFare.text = viewModel.vehicleFareValue!
        lblEstimatedTime.text = viewModel.estimatedTimeValue!
        
        layer.masksToBounds = true
    }
    
}
