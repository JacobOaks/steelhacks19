

import UIKit

class Drawing: UIView {

   
    override func draw(_ rect: CGRect) {
    let context = UIGraphicsGetCurrentContext()
    context!.setLineWidth(3.0)
        context!.setStrokeColor(UIColor.purple.cgColor)
        context!.move(to: CGPoint(x:50, y:60))
        context!.addLine(to: CGPoint(x:250, y:320))
        context!.strokePath()
    }
  

}
