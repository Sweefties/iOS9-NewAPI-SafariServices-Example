![](https://img.shields.io/badge/build-pass-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/platform-iOS9+-ff69b4.svg?style=flat-square)
![](https://img.shields.io/badge/Require-XCode7-lightgrey.svg?style=flat-square)


# iOS 9 - New API - SFSafariViewController - Example
iOS 9~ Experiments - New API Components - Internal Safari Services Browser.

## Example

![](https://raw.githubusercontent.com/Sweefties/iOS9-NewAPI-SafariServices-Example/master/source/iPhone6S_Simulator2x_SFSafariVC.jpg)


## Requirements

- >= XCode 7.0 / 7.1 beta~. (writed with xcode 7.1 beta)
- >= Swift 2.
- >= iOS 9.0.

Tested on iOS 9.0, 9.1 Simulators, iPhone 6.


## Important

Get the master branch for XCode 8 / Swift 3 updated project.


## Usage

To run the example project, download or clone the repo.


### Example Code!

Configure iOS App:

- By example Drag and drop UIButton to ViewController (Storyboard)
- connect your UIButton to your ViewController class
- define your UIButton IBAction and put in the 'Present Safari View Controller Modally' code.


- Add SafariServices Framework

```swift
import SafariServices
```

- SFSafariViewController Protocol example
```swift
class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    //... in lifecycle ..

    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //...
}
```

- Present Safari View Controller Modally
```swift
// set SFSafariViewController with NSURL and options if you needed..
let sfvc = SFSafariViewController(URL: NSURL(string: "https://apple.com")!, entersReaderIfAvailable: true)
// delegate
sfvc.delegate = self
// present browser modally
self.presentViewController(sfvc, animated: true, completion: nil)
```


Build and Run!
