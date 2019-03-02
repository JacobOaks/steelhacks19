

import UIKit

class Drawing: UIView {
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        //let context = UIGraphicsGetCurrentContext()
//        context!.setLineWidth(3.0)
//        //context!.setStrokeColor(UIColor.purple.cgColor)
//        UIColor(displayP3Red: 0, green: 0, blue: 23/225, alpha: 1).set()
//        context!.move(to: CGPoint(x:80, y:80))
//        context!.addLine(to: CGPoint(x:400, y:500))
//        context!.strokePath()
        if let context = UIGraphicsGetCurrentContext() {
            
            // Set the circle outerline-width
            context.setLineWidth(5.0);
            
            // Set the circle outerline-colour
            UIColor(displayP3Red: 90/225, green: 70/225, blue: 23/225, alpha: 1).set()
            
            // Create Circle
            //var i = 0
            for i in 0...10{
            let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
            let radius = (frame.size.width - 10)/CGFloat(i)
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
            context.strokePath()
    
            }
            self.createRectangle()
            UIColor.purple.setStroke()
            //path.stroke()
        }
           
    }
        
    func createRectangle() {
        var path: UIBezierPath!
        // Initialize the path.
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
        
        
    }
    
//    func createTriangle() {
//        path = UIBezierPath()
//        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
//        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
//        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
//        path.close()
//    }
    

}
//let view = Drawing(frame: CGRect(x: 0, y: 0, width: 300, height: 300))


