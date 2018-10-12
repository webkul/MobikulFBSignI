# MobikulFBSignI

[![CI Status](https://img.shields.io/travis/bhavuk11/MobikulFBSignI.svg?style=flat)](https://travis-ci.org/bhavuk11/MobikulFBSignI)
[![Version](https://img.shields.io/cocoapods/v/MobikulFBSignI.svg?style=flat)](https://cocoapods.org/pods/MobikulFBSignI)
[![License](https://img.shields.io/cocoapods/l/MobikulFBSignI.svg?style=flat)](https://cocoapods.org/pods/MobikulFBSignI)
[![Platform](https://img.shields.io/cocoapods/p/MobikulFBSignI.svg?style=flat)](https://cocoapods.org/pods/MobikulFBSignI)

MobikulFBSignI is a simple library to implement facebook login in your application for saving your time, and efforts to write the code of Facebook login and also if you remove this library from your project then no need to change the code it doesn't effect your applicationand also you don't need to define or add facebook dependencies  MobikulFBSignI automatically manages. 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
    iOS 9+

## Installation

MobikulFBSignI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MobikulFBSignI'
```

## Usage

On click event of facebook button 
```ruby
if let myclass = stringClassFromString("MobikulFBSignIn") as? NSObject.Type {
    _ = myclass.init()
    NotificationCenter.default.addObserver(self, selector: #selector(SignInDataViewController.responseFromSocialLogin), name: NSNotification.Name(rawValue: "MobikulFBSignIn"), object: nil)
}

func stringClassFromString(_ className: String) -> AnyClass? {
    var namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
    namespace = "MobikulFBSignI".replacingOccurrences(of: " ", with: "_")
    return NSClassFromString("\(namespace).\(className)");
}
```

Get Response after sign with facebook done
```ruby
@objc func responseFromSocialLogin(data: Any) {
    if let x = data as? NSNotification , let fbData = x.userInfo as? [String: Any] {
        print(fbData["email"] as? String)
        print(fbData["first_name"] as? String)
        print(fbData["last_name"] as? String)
    }
}
```

## Author

bhavuk11, bhavuk.chawla546@webkul.com

## License

MobikulFBSignI is available under the MIT license. See the LICENSE file for more info.
