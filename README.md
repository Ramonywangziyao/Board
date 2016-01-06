# Board
Cloud-based Hassle-free bill splitting app

# Installation
1. `git clone git@github.com:yuwang17/Board.git`
2. `cd Board/Board && pod install`
3. `open Board.xcworkspace`

# Notices
1. Initial storyboard is no longer `Main.storyboard` but `Start.storyboard`
2. Please seperate different modules on different storyboards, keeping organized (MVCS)
3. The Entry View Controller is set in `AppDelegate.swift`
4. User data is stored in `NSUserDefault`
