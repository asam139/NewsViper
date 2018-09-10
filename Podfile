# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

# ignore all warnings from all pods
inhibit_all_warnings!


# Def for testing pods
def testing_pods
    # Note: Use XCTest directly because Quick
    # present some bugs that not showing the
    # errors and creating tests which dont exist
    #pod 'Quick', '~> 1.3'
    
    pod 'Nimble', '~> 7.3'
end


target 'NewsViper' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Pods for NewsViper
    pod 'Alamofire', '~> 4.7'
    pod 'SWXMLHash', '~> 4.7'
  
    pod 'SDWebImage', '~> 4.0'
    pod 'EZLoadingActivity', '~> 1.0'

    target 'NewsViperTests' do
        inherit! :search_paths
        # Pods for testing
        testing_pods
    end
end

target 'NewsViperUITests' do
   
    # Pods for testing
    testing_pods
end
