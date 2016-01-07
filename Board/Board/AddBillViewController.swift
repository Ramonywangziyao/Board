//
//  AddBillViewController.swift
//  Board
//
//  Created by Wang Yu on 12/31/15.
//  Copyright © 2015 Wang Yu. All rights reserved.
//

import UIKit
import ReactiveCocoa
import TextFieldEffects

class AddBillViewController: UIViewController {
    
    @IBOutlet weak var billTitleTextField: JiroTextField!
    @IBOutlet weak var billAmountTextField: JiroTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.rac_textSignal()
            .toSignalProducer()
            .map { $0 as! String }
            .map { $0.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "0123456789.").invertedSet) }
            .map { return $0 == "" ? "0" : $0 }
            .startWithNext {
                print($0)
                self.billAmountTextField.text = $0 == "0" ? "" : $0
        }
    }

}
