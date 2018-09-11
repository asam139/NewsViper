# News Viper

This repository contains a sample app that implements VIPER architecture with tests implementation.
App shows news using public [BCC API](http://feeds.bbci.co.uk/news/world/rss.xml)

The app use these libraries and frameworks:

For app:
* Alamofire
* SWXMLHash
* SDWebImage
* EZLoadingActivity

For tests:
* Nimble
* Quick (replaced directly by XCTest for some bugs)

## Getting Started

### Prerequisites

* CocoaPods

* Xcode 9 o later

### Installing

```
git clone https://github.com/asam139/NewsViper.git
cd NewsViper
pod install
open NewsViper.xcworkspace
```

## Running the tests

In the project exist two targets to separate:

* Unit test

* UI Test

## Coding style guide

[Google Coding style guide](https://google.github.io/swift/)

## Contributing

Just make pull request. You are in!

## Authors

* **Saúl Moreno Abril** - *Initial work* - [asam139](https://github.com/asam139)

See also the list of [contributors](https://github.com/asam139/contributors) who participated in this project.

## License

Copyright 2018 Saúl Moreno Abril

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Acknowledgments

* A job interview request... jajaja :)
