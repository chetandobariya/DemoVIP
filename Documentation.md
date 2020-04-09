#  Documentation

Documantation consist of two parts

[Reference:] (https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


## 1. Markdown Files

 - All markdown files should also add to project structure to be seen on Xcode but not to Target.
 - In project file structure every folder can have a Readme.md file. Readme file is documentation entrance for that folder. Most of the tools can recognize this file.
 - Folders also can have different named md files. This md files should be referenced from Readme.md.
 - MD files should mention about general purpose of its folder elements
 - MD files should not mention specific classes, functions...

## 2. Class Documentation

 - Class documentation should be on top class code as Comment
 - `///` or `/** */` should be used as documentation comment. This style of comment recognized by Xcode.
 - Class documentation should be in markdown format. Xcode supports markdown rendering.
 - Function names should be self explanatory. Documentation for function should be only in exceptional cases.

# Maintenance

- All links constructed with relative paths. Because of this, in every path change in MD files relative links should be checked and updated
