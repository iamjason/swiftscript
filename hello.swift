#!/usr/bin/env xcrun swift

//let name = "BOOOMM!"
//let name = Process.arguments[1]
//println("Hello, \(name)!")
 
import Foundation
 
let task = NSTask()
task.launchPath = "/bin/echo"
task.arguments = ["first-argument", "second-argument"]
 
let pipe = NSPipe()
task.standardOutput = pipe
task.launch()
 
let data = pipe.fileHandleForReading.readDataToEndOfFile()
let output: NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
 
print(output)
assert(output == "first-argument second-argument\n")