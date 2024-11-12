import Cocoa
import FlutterMacOS
import GoogleMaps

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    GMSServices.provideAPIKey("AIzaSyBJjaF1M46Vf7LlRmBmNveXH-0izqXwFbQ")
    return true
  }
}
