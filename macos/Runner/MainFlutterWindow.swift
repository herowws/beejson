// import Cocoa
// import FlutterMacOS

// class MainFlutterWindow: NSWindow {
//   override func awakeFromNib() {
//     let flutterViewController = FlutterViewController()
//     let windowFrame = self.frame
//     self.contentViewController = flutterViewController
//     self.setFrame(windowFrame, display: true)

//     RegisterGeneratedPlugins(registry: flutterViewController)

//     super.awakeFromNib()
//   }
// }

import Cocoa
import FlutterMacOS
 
class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
 
    // The background color of the window and `FlutterViewController`
    // are retained separately.
    //
    // In this example, both the MainFlutterWindow and FlutterViewController's
    // FlutterView's backgroundColor are set to clear to achieve a fully
    // transparent effect.
    //
    // If the window's background color is not set, it will use the system
    // default.
    //
    // If the `FlutterView`'s color is not set via `FlutterViewController.setBackgroundColor`
    // it's default will be black.
    self.backgroundColor = NSColor.white
    flutterViewController.backgroundColor = NSColor.white
 
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
 
    RegisterGeneratedPlugins(registry: flutterViewController)
 
    super.awakeFromNib()
  }
}