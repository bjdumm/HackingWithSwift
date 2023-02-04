//
//  ViewController.swift
//  18_Debugging
//
//  Created by Brennan Dumm on 2/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Im inside the viewdidLoad MEthod")
        
        //Variatic , Separator, terminator
        print(1,1,2,3,5, separator: "-")
        
        //terminator
        print("Some message", terminator: "")
        print(" with no line break")
        
        //Assertions - Force app to crash if assertion not met
        //Assertions only execute on local runs -Disabled automatically on release
        //Only run on test builds, code is removed when building for app store
        //Use these often
        
       // assert(myReallySlowMethod() == true, "The slow method returned false, which is bad.")
       // assert(1 == 1, "Math failure!")
      //  assert(1 == 2, "Math failure from 1 == 2")
        
        for i in 1...100 {
            print("number \(i).")
        }
        
        //Fn + F6 steps line by line
        //Continue (Run until next breakpoint) Ctrl-Cmd-Y
        
        //COMMANDS in (lldb)
        //Print variable value -> p [variable name]
        
        //Cmd . -> stop running
        
        //Conditional breakpoint
        //Right click edit breakpoint
        
        //Debug view hierarchy : click overlapping rectangels in debug view
        
        
        
    }


}

