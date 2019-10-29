//
//  TeethView.swift
//  DentalAssessment
//
//  Created by student on 29/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Eureka

public class TeethView: Cell<NSDictionary>, CellType {
    var cellPressed: ((UIButton) -> Void) = { button in
        button.setTitle("_", for: .normal)
    }
    public override func setup() {
        super.setup()
    }
    public override func update() {
        super.update()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func onCellPressed(_ sender: UIButton) {
        self.cellPressed(sender)
    }
}

public final class TeethViewRow: Row<TeethView>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        // We set the cellProvider to load the .xib corresponding to our cell
        cellProvider = CellProvider<TeethView>(nibName: "TeethView")
    }
}
