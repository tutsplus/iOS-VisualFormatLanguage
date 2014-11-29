//
//  ViewController.swift
//  VFL_Example
//
//  Created by Jordan Morgan on 11/22/14.
//  Copyright (c) 2014 Jordan Morgan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var vwRed:UIView!
    var vwBlue:UIView!
    var vwGreen:UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initViews()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initViews() -> Void
    {
        //Initialize
        vwRed = UIView()
        vwBlue = UIView()
        vwGreen = UIView()
        
        //Prep auto layout
        vwRed.setTranslatesAutoresizingMaskIntoConstraints(false)
        vwBlue.setTranslatesAutoresizingMaskIntoConstraints(false)
        vwGreen.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        //Coloring
        vwRed.backgroundColor = UIColor.redColor()
        vwBlue.backgroundColor = UIColor.blueColor()
        vwGreen.backgroundColor = UIColor.greenColor()
        
        //Add them to the view
        self.view.addSubview(vwRed)
        self.view.addSubview(vwBlue)
        self.view.addSubview(vwGreen)
        
        createConstraints()
    }
    
    func createConstraints() -> Void
    {
        //Views to add constraints to
        let views = Dictionary(dictionaryLiteral: ("red",vwRed),("blue",vwBlue),("green",vwGreen))
        //Metrics for Visual Format string
        let metrics = Dictionary(dictionaryLiteral: ("spacing", 10),("lowWidth",100),("highWidth",200),("priority",20),("redBlueSpacing",0),("greenHeight",40))
        
        //Horizontal constraints
        let horizontalConstraintsRedBlue = NSLayoutConstraint.constraintsWithVisualFormat("H:|-spacing-[red(>=lowWidth,<=highWidth@priority)]-redBlueSpacing-[blue(==red)]-spacing-|", options: nil, metrics: metrics, views: views)
        self.view.addConstraints(horizontalConstraintsRedBlue)
        let horizontalConstraintsGreen = NSLayoutConstraint.constraintsWithVisualFormat("H:|[green]|", options: nil, metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraintsGreen)
        
        //Vertical constraints
        let verticalConstraintsRed = NSLayoutConstraint.constraintsWithVisualFormat("V:|[red]-spacing-[green(greenHeight)]|", options: nil, metrics: metrics, views: views)
        self.view.addConstraints(verticalConstraintsRed)
        let verticalConstraintsBlue = NSLayoutConstraint.constraintsWithVisualFormat("V:|[blue]-spacing-[green(greenHeight)]|", options: nil, metrics: metrics, views: views)
        self.view.addConstraints(verticalConstraintsBlue)
    }

}

