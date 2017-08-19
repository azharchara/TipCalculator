# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS. 

Submitted by: Azhar Chara 

Time spent: 5 hours spent in total 

## User Stories 

The following functionality is complete: 

* [ ] User can enter a bill amount, choose a tip percentage, choose the number of person between which the amount has to split and see the tip, total values & split value of each individual. 
* [ ] Settings page to change the default tip percentage & default split. 

The following  features are implemented: 
* [ ] UI animations to some extend 
* [ ] Remembering the bill amount across app restarts
* [ ] Making sure the keyboard is visible when touched in textField and resign when touched elsewhere. Just launch the app touch in textField and start typing. 
* [ ] App is made with a simple design and attractive colours for user friendliness.

## Video Walkthrough Here's a walkthrough of implemented user stories: 

<img src='https://github.com/azharchara/TipCalculator/blob/master/Video_Walkthrough.gif' title='Video_Walkthrough' width='' alt='Video Walkthrough' /> 

GIF created with [LiceCap]
(http://www.cockos.com/licecap/). 

## Project Analysis 

As part of your pre-work submission, please reflect on the app and answer the following questions below: 

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? 
                 Bonus: any idea how they are being implemented under the hood?
**Answer:** I have been in iOS development from a year or so, and its really fun implementing things here then any other platform.The animations and the simplicity that iOS platform provide is much better the other platforms.
            Swift syntax are easy to understand and memorize for further implementation. I am current using xcode 9 beta , no dought contains few bugs ,but is better more user friendly and has more features then previous versions. 
            In a simple language outlets are the connections that are made from the view to its source class that has the code for controlling it. For defining it, Outlets provide a way to reference interface objects—the objects you added to your storyboard—from source code files.
            To create an outlet, Control-drag from a particular object in your storyboard to a view controller file. This operation creates a property for the object in your view controller file,
            which lets you access and manipulate that object from code at runtime.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), 
            which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)" 
**Answer:** According to definition of Strong reference cycle, If two class instances hold a strong reference to each other, such that each instance keeps the other alive. This is known as a strong reference cycle. In swift programmig
			there are 2 ways to resolve the strong reference cycle i.e
			* Weak references 
			* Unowned references.
			
			Weak and unowned references enable one instance in a reference cycle to refer to the other instance without keeping a strong hold on it. The instances can then refer to each other without creating a strong reference cycle.
			In the Apartment example present in the link, it’s appropriate for an apartment to be able to have no tenant at some point in its lifetime, and so a weak reference is an appropriate way to break the reference cycle in this case.
			In contrast, use an unowned reference when the other instance has the same lifetime or a longer lifetime.


## License Copyright [2017] [Azhar Chara] Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, 
software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and limitations under the License.
