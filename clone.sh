#!/bin/bash

#
#  Created by Yaroslav Arsenkin.
#  Copyright (c) 2015 Iaroslav Arsenkin.
#  Website: http://arsenkin.com
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.
#


# Getting the name of the foder the project is going to be cloned to
gitURL=$1
project=$(basename $gitURL .git)
currentDir=$(pwd)/$project/

# Generating files' names and paths
podfile=$currentDir"Podfile"
workspaceExt=".xcworkspace"
xcprojectExt=".xcodeproj"
workspaceFile=$currentDir$project$workspaceExt
projectFile=$currentDir$project$xcprojectExt

# Cloning repository
git clone --recursive $gitURL && cd $project

# Looking for files
if [[ -e $podfile ]]; then
	pod install

	if [[ -e $workspaceFile ]]; then
	open $workspaceFile
	elif [[ -e $projectFile ]]; then
		open $projectFile
	else
		open .
	fi
	
elif [[ -e $workspaceFile ]]; then
	open $workspaceFile
elif [[ -e $projectFile ]]; then
	open $projectFile
else
	open .
fi
