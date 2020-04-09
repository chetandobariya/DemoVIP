# Guidelines and Standards

Documentation of this project starts with this file. Read the documents by following links and references.

> For contributing documentation look at [Documentation Rules](Documentation.md)

## Building the Project

1. Clone the repo:

> git clone https://github.com/chetandobariya/DemoVIP.git

2. Install dependencies with [Cocoapods](https://cocoapods.org/):

> pod install

3. Open the project from "DemoVIP.xcworkspace" file  with latest Xcode version 11.3.1, support langauge swift 5.1 and build

4. Select target and device on top and click on play button (project is required minimum iOS version 13.0 and compatible with iPhone and iPad)


## Targets

### DemoVIP APP

* DemoVIP folder contains all application code and resources
* [For app architecture](DemoVIP/Readme.md)

### DemoVIP Unit Tests

* DemoVIPTests folder contains all unit tests
* [For Unit Test Architecture](DemoVIP/Readme.md)

### DemoVIP UI Tests

* DemoVIPUITests folder contains all UI tests 
* [For UI Test Architecture](DemoVIP/Readme.md)


## Dependency manager

### Cocoapods

* We are using cocoapods as depedency manger in our project. 
* Currently we have Alamofire networking and AlamofireImage for image caching dependency implmeneted in our project.
* Podfile is responisble to add, update, delete dependecy in project.


## Best practices

### Limiting the scope

* Every property being used should have the smallest scope possible. 
* Therefore, `IBOutlets` should be `private` to the ViewController or View they belong. Exceptions should be documented and limited.
* Methods should be declared as private as a rule and the exposed interface should be either definied through a protocol or as limited as possible.
* Internal variables should not be exposed - if updating them from the outside is necessary, consider adding a method for enabling that functionality.

### Delegation

* Delegates should always be declared as `weak` to prevent memory leaks.
* Protocol method naming should follow Apple's convention: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingMethods.html
* When possible protocol implementation should be done in a separate extension.


## Branch ownership

* the creator of a feature branch is the owner of it. He/She is the only one to push, rebase or merge the feature branch
* `git push -f` is not *allowed* on shared branches (e.g. `master` or `development`) 
* the only way to add new commits to `development` branch is through a PR, after the CI ran through and someone approved it.


