# Thesis Tex Template

Template to write Master thesis and doctoral dissertations, based on a custom class file "UoS-Thesis.cls".
The possible modifications of the thesis template are explained in the following document.

## Class File
The thesis is written based on the class file "UoS-Thesis.cls" inheriting most properties from the class book.
First of all, some custom packages can be added there using "\RequirePackage[myOptions]{my_package}".
Secondly, the section called "PDF setup" contains some document information such as the document title, author and type as well as keywords, these fields can be customised to match the thesis information.
The nomenclature has defined groups as per the "nomenclature" section, organised in alphabetical order.
Finally, the rest of the class file defines renewed behaviour for environments and commands or simply defines new environments and new commands.

## Front Matter

### Title Page
The title page is straight forward and needs to be populated with the relevant thesis and author information.

### Declaration
The declaration is included with a separate tex file.

### Quote
A quote can be included using the separate tex file.

### Abstract
The abstract as well as the keywords are included in this section.

### Acknowledgements
The acknowledgment section comes after the abstract and is included in a separate tex file.

### Glossary
The glossary allows to give the full acronyms used throughout the thesis. An acronym should be marked as "\gls{mpc}" in order to be taken into account in the glossary section. Also, compiling the glossary is done by running the following: ""makeglossaries" %" in the latex quick build.

### Nomenclature
The nomenclature defines all the notations used throughout the thesis and is organised in groups defined in the class file.

## Main Matter

### Chapters
Each chapter is included in a specific tex file, this allows to only compile a subset of chapters when the documents is being drafted.

## Appendix

### Appendixes
The appendix are similar to the chapters, except that they come in the appendix section. Similarly, only a subset of them can be included and compiled.

## Back Matter

### Bibliography
The back matter only includes a bibliography based on the IFAC bibliography style, using the full author name with the publication dates.

