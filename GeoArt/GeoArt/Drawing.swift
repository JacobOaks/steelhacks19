

import UIKit

class Drawing: UIView {
    
    //data
    var path: UIBezierPath! //drawing path
    var long: Double = 0 //longitude
    var lat: Double = 0 //latitude
    var context = UIGraphicsGetCurrentContext() //global reference to context
    
    //init functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    ///set local position variables
    func setPos(_ long: Double, _ lat: Double) {
        self.long = long
        self.lat = lat
    }
    
    //draw function
    override func draw(_ rect: CGRect) {
        
        //return if context invalid
        while (context == nil) {
           context = UIGraphicsGetCurrentContext()
        }
        
        //actual drawing
        context?.setStrokeColor(UIColor.purple.cgColor)
        UIColor.purple.setStroke()
        createShape(with: 0, of: 0, at: 0, at: 0) //circle
        createShape(with: 4, of: 0, at: 0, at: 0) //square
        createShape(with: 3, of: 0, at: 0, at: 0) //triangle
    }
    
    //a general function for creating a shape
    func createShape(with n:Int, of size: Int, at x: Int, at y: Int) {
        
        //switch on amount of sides
        switch (n) {
        case 0: //circle
            createCircle()
            break
        case 1: //line
            createLine()
            break
        case 2: //star
            createStar()
            break
        case 3: //triangle
            createTriangle()
            break
        case 4: //square
            createSquare()
            break
        case 5: //pentagon
            createPentagon()
            break
        case 6: //hexagon
            createHexagon()
            break
        case 7: //heptagon
            createHeptagon()
            break
        case 8: //octagon
            createOctagon()
            break
        case 9: //ellipse
            createEllipse()
            break
        default: //invalid number
            break
        }
    }

    func createCircle() {
        
        // Set the circle outerline-width
        context!.setLineWidth(5.0);
        
        // Set the circle outerline-colour
        UIColor(displayP3Red: 90/225, green: 70/225, blue: 23/225, alpha: 1).set()
        
        // Create Circle
        for i in 0...10 {
            let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
            let radius = (frame.size.width - 10)/CGFloat(i)
            context!.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
            context!.strokePath()
        }
    }

    func createLine() {
        context!.setLineWidth(3.0)
        UIColor(displayP3Red: 0, green: 0, blue: 23/225, alpha: 1).set()
        context!.move(to: CGPoint(x:80, y:80))
        context!.addLine(to: CGPoint(x:400, y:500))
        context!.strokePath()
    }
    
    func createStar() {}
    
    func createTriangle() {
        path = UIBezierPath()
        path.lineWidth = 5.0
        path.move(to: CGPoint(x: (self.frame.width/2) - 25.0, y: 25.0))
        path.addLine(to: CGPoint(x: 25.0, y: self.frame.size.height - 25))
        path.addLine(to: CGPoint(x: self.frame.size.width - 25.0, y: self.frame.size.height - 25.0))
        path.close()
        path.stroke()
    }
    
    func createSquare() {
        var path: UIBezierPath!
        path = UIBezierPath()
        path.move(to: CGPoint(x: 5.0, y: 5.0))
        path.addLine(to: CGPoint(x: 5.0, y: self.frame.size.height - 5))
        path.addLine(to: CGPoint(x: self.frame.size.width - 5, y: self.frame.size.height - 5))
        path.addLine(to: CGPoint(x: self.frame.size.width - 5, y: 5.0))
        path.close()
        path.stroke()
    }
    
    func createPentagon() {}
    
    func createHexagon() {}
    
    func createHeptagon() {}
    
    func createOctagon() {}
    
    func createEllipse() {}
}
//let view = Drawing(frame: CGRect(x: 0, y: 0, width: 300, height: 300))


