
//long/lat interpretations
// long: abc.defghijk
// lat:  lmn.opqrstuv

//digit parsing of each letter
// 0 a
// 1 b - background red
// 2 c - background green
// 3 d - background blue
// 4 e - object 1 n
// 5 f - object 1 x
// 6 g - object 1 y
// 7 h - object 2 n
// 8 i - object 2 size
// 9 j - object 3 n
// 10 k - object 3 x

// 0 l
// 1 m - object 3 thickness
// 2 n - object 4 n
// 3 o - object 4 size
// 4 p - object 4 y
// 5 q - object 5 n
// 6 r - object 5 x
// 7 s - object 5 y
// 8 t - first 3 objects r
// 9 u - first 3 objects g
// 10 v - first 3 objects b

//object 1
// n - e
// size - half of frame width
// thickness - 5.0
// x - f
// y - g

//object 2
// n - h
// size - i
// thickness - 10.0
// x - middle of frame
// y - middle of frame

//object 3
// n - j
// size - 100
// thickness - m
// x - k
// y - k / 2

//object 4
// n - n
// size - o
// thickness - 20 - object3's thickness
// x - object3's x * 2
// y - p

//object 5
// n - q
// object 2's size * 2
// thickness - object 3's thickness / 2
// x - r
// y - s

//object 6
// n - average of all ns
// size - average of all sizes
// thickness - average of all thickness
// x - average of all xs
// y - average of all ys

import UIKit

class Drawing: UIView {
    
    //data
    var path: UIBezierPath! //drawing path
    var long: [Int]! //longitude
    var lat: [Int]! //latitude
    var context = UIGraphicsGetCurrentContext() //global reference to context
    var thickness = 5.0; //thickness
    
    //init function
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
    }
    
    //other init function
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    ///set local position variables
    func setPos(_ long: [Int], _ lat: [Int]) {
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
        createShapes()
    }
    
    func createShapes() {
        
        //print long/lat for debug purposes
        print(self.long)
        print(self.lat)
        
        //create first 3 object colors
        var r:CGFloat = CGFloat(((self.lat?[8] ?? 0) / 9)*225) //convert from int to r
        print(r)
        var g:CGFloat = CGFloat(((self.lat?[6] ?? 0) / 9)*225) //convert from int to g
        print(g)
        var b:CGFloat = CGFloat(((self.lat?[7] ?? 0) / 9)*225) //convert from int to b
        print(b)
    
        //set first 3 object colors
        var color = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        context?.setStrokeColor(color.cgColor)
        color.set()
        
        //object 1
        self.thickness = 5.0
        context!.setLineWidth(5.0)
        var x = ((CGFloat(self.long?[5] ?? 1)) / 9) * self.frame.width
        var y = ((CGFloat(self.long?[6] ?? 1)) / 9) * self.frame.height
        createShape(with: self.long?[4] ?? 1, of: Int(self.frame.width / 2), at: Int(x), at: Int(y))
        
        //object2
        self.thickness = 10.0
        context!.setLineWidth(10.0)
        var size = ((CGFloat(self.long?[8] ?? 1)) / 9) * self.frame.width
        print(size)
        createShape(with: self.long?[7] ?? 0, of: Int(size), at: Int(self.frame.width / 2), at: Int(self.frame.height / 2))
        
        //object3
        self.thickness = ((Double(self.lat?[1] ?? 1)))
        context!.setLineWidth(CGFloat(self.lat?[1] ?? 1))
        x = ((CGFloat(self.long?[10] ?? 1)) / 9) * self.frame.width
        y = x / 2
        createShape(with: self.long?[9] ?? 1, of: 100, at: Int(x), at: Int(y))
        
        //create second 3 object colors
        r = 255 - r
        g = 255 - g
        b = 255 - b
        
        //set first 3 object colors
        color = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        context?.setStrokeColor(color.cgColor)
        color.set()
        
        //object4
        self.thickness = 20.0 - self.thickness
        context!.setLineWidth(CGFloat(20.0 - self.thickness))
        size = ((CGFloat(self.lat?[3] ?? 1)) / 9) * self.frame.width
        y = ((CGFloat(self.long?[4] ?? 1)) / 9) * self.frame.height
        createShape(with: (self.lat?[3] ?? 1), of: Int(size), at: Int(x / 2), at: Int(y))
        
        //object5
        self.thickness = self.thickness / 2
        context!.setLineWidth(CGFloat(self.thickness / 2))
        x = ((CGFloat(self.lat?[9] ?? 1)) / 9) * self.frame.width
        y = ((CGFloat(self.lat?[10] ?? 1)) / 9) * self.frame.height
        createShape(with: self.lat?[5] ?? 1, of: Int(self.frame.width * 3 / 4), at: Int(x), at: Int(y))
    }
    
    //a general function for creating a shape
    func createShape(with n: Int, of size: Int, at x: Int, at y: Int) {
        
        //switch on amount of sides
        switch (n) {
        case 0: //circle
            createCircle(with: size, at: x, at: y)
            break
        case 1: //line
            createLine(from: x, from: x, to: y, to: y)
            break
        case 2: //star
            createStar(at: CGFloat(x), at: CGFloat(y))
            break
        case 3: //triangle
            createTriangle(with: size, at: x, at: y)
            break
        case 4: //square
            createSquare(width: size, at: x, at: y)
            break
        case 5: //pentagon
            createPolygon(x: CGFloat(x), y: CGFloat(y), radius: CGFloat(size), sides: 5, offset: 1)
            break
        case 6: //hexagon
            createPolygon(x: CGFloat(x), y: CGFloat(y), radius: CGFloat(size), sides: 6, offset: 1)
            break
        case 7: //heptagon
            createPolygon(x: CGFloat(x), y: CGFloat(y), radius: CGFloat(size), sides: 7, offset: 1)
            break
        case 8: //octagon
            createPolygon(x: CGFloat(x), y: CGFloat(y), radius: CGFloat(size), sides: 8, offset: 1)
            break
        case 9: //ellipse
            createEllipse(with: size, at: x, at: y)
            break
        default: //invalid number
            break
        }
    }

    //create circle
    func createCircle(with radius: Int, at x: Int, at y: Int) {
        let center = CGPoint(x: x, y: y)
        context!.addArc(center: center, radius: CGFloat(radius), startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
        context!.strokePath()
    }

    //create line
    func createLine(from xS: Int, from yS: Int, to xF: Int, to yF: Int) {
        context!.move(to: CGPoint(x: xS, y: yS))
        context!.addLine(to: CGPoint(x: xF, y: yF))
        context!.strokePath()
    }
    
    //create star
    func createStar(at x: CGFloat, at y: CGFloat) {
        let path = UIBezierPath()
        path.lineWidth = 5.0
        let w = CGFloat(200)
        let r = w / 2.0
        let flip: CGFloat = -1.0 // use this to flip the figure 1.0 or -1.0
        let polySide = CGFloat(5)
        let theta = 2.0 * Double.pi * Double(2.0 / polySide)
        path.move(to: CGPoint(x: x, y: r * flip + y))
        for i in 1..<Int(polySide) {
            let xP: CGFloat = r * CGFloat( sin(Double(i) * theta) )
            let yP: CGFloat = r * CGFloat( cos(Double(i) * theta) )
            path.addLine(to: CGPoint(x: xP + x, y: yP * flip + y))
        }
        path.close()
        path.stroke()
    }
    
    //create triangle
    func createTriangle(with size: Int, at x: Int, at y: Int) {
        path = UIBezierPath()
        path.lineWidth = CGFloat(thickness)
        path.move(to: CGPoint(x: x - size/2, y: y - size/2))
        path.addLine(to: CGPoint(x: x + size/2, y: y - size/2))
        path.addLine(to: CGPoint(x: x, y: y + size/2))
        path.close()
        path.stroke()
    }
    
    //create square
    func createSquare(width size: Int, at x: Int, at y: Int) {
        path = UIBezierPath()
        path.lineWidth = CGFloat(thickness)
        path.move(to: CGPoint(x: x - size/2, y: y - size/2))
        path.addLine(to: CGPoint(x: x + size/2, y: y - size/2))
        path.addLine(to: CGPoint(x: x + size/2, y: y + size/2))
        path.addLine(to: CGPoint(x: x - size/2, y: y + size/2))
        path.close()
        path.stroke()
    }
    
    func createPolygon(x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int, offset: CGFloat) {
        path = UIBezierPath()
        path.lineWidth = CGFloat(thickness)
        let points = polygonPointArray(sides: sides,x: x,y: y,radius: radius, offset: offset)
        let cpg = points[0]
        path.move(to: CGPoint(x: cpg.x, y: cpg.y))
        for p in points {
            path.addLine(to: CGPoint(x: p.x, y: p.y))
        }
        path.close()
        path.stroke()
    }
    
    func polygonPointArray(sides:Int,x:CGFloat,y:CGFloat,radius:CGFloat,offset:CGFloat)->[CGPoint] {
        let angle = (360/CGFloat(sides)) * (.pi / 180)
        let cx = x // x origin
        let cy = y // y origin
        let r = radius // radius of circle
        var i = 0
        var points = [CGPoint]()
        while i <= sides {
            let xpo = cx + r * cos(angle * CGFloat(i) - offset * (.pi / 180))
            let ypo = cy + r * sin(angle * CGFloat(i) - offset * (.pi / 180))
            points.append(CGPoint(x: xpo, y: ypo))
            i = i + 1
        }
        return points
    }
    
    func createHexagon() {}
    
    func createHeptagon() {}
    
    func createOctagon() {}
    
    func createEllipse(with size: Int, at x: Int, at y: Int) {
        let path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: size, height: Int(Double(size) * 1.5)))
        path.lineWidth = CGFloat(thickness)
        path.stroke()
    }
}
