For Developers
============

You can also see [Python](https://github.com/starlangsoftware/TurkishPropBank-Py), [Cython](https://github.com/starlangsoftware/TurkishPropBank-Cy), [C++](https://github.com/starlangsoftware/TurkishPropBank-CPP), [Java](https://github.com/starlangsoftware/TurkishPropBank), or [C#](https://github.com/starlangsoftware/TurkishPropBank-CS) repository.

## Requirements

* Xcode Editor
* [Git](#git)

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called TurkishPropBank-Swift will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/TurkishPropBank-Swift.git

## Open project with XCode

To import projects from Git with version control:

* XCode IDE, select Clone an Existing Project.

* In the Import window, paste github URL.

* Click Clone.

Result: The imported project is listed in the Project Explorer view and files are loaded.


## Compile

**From IDE**

After being done with the downloading and opening project, select **Build** option from **Product** menu. After compilation process, user can run TurkishPropBank-Swift.

Detailed Description
============

+ [FramesetList](#framesetlist)
+ [Frameset](#frameset)

## FramesetList

Frame listesini okumak ve tüm Frameleri hafızada tutmak için

	a = FramesetList()

Framesetleri tek tek gezmek için

	for i in 0..<a.framesetList.size(){
		frameset = a.getFrameset(index: i)
	}

Bir fiile ait olan Frameseti bulmak için

	frameset = a.getFrameSet(synSetId: "TUR10-1234560")

## Frameset

Bir framesetin tüm argümanlarını bulmak için

	func getFramesetArguments() -> [FramesetArgument]
