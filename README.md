# GitCloner
This is a script, that handles some of the routine code that you perform, when cloning a git repository. It will save you some extra terminal commands.

## How it works
Once you execute command, the script is going to make a `--recursive` clone of the repository, from the link that you provide as an argument to the script.
Afterwards it is going to open directory it was cloned to and look for:
* `Podfile`. In case it finds it - `pod install` command is going to be executed.
* Regardless of the successful look up of the previous file, the script is going to look for `.xcworkspace` file. In case it has been located - it is going to be opened.
* In case `.xcworkspace` has not been located, the script is going to be looking for a regular `.xcodeproj` directory and open it.
* In case none of he above applies - the script is going to simple open the cloned directory in finder, so that you could perform further actions yourself.

## Usage

#### Preparing script for convenient usage
In order to be able to use this script from anywhere you have to copy this script into `/usr/local/bin/` directory. You may need administrative privileges to do this.

#### Actual usage
1. Open Terminal app and navigate to the folder, where you want to clone repository to.
2. Write `clone.sh` and pass argument. Script takes only one argument - url for the git repository to clone. Thus the command is going to look like this.

    $ clone.sh https://github.com/soberman/GreatStuff.git

## License
GitCloner is released under the [MIT license](http://opensource.org/licenses/MIT). See LICENSE for details.
