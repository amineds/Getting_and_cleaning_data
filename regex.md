REGEX EXPRESSIONS
=================

### Some metacharacters represent the start of a line
`^i think`

##### $ represents the end of a line
`morning$`

##### We can list a set of characters we will accept at a given point in the match
`[Bb][Uu][Ss][Hh`

##### Similarly, you can specify a range of letters [a-z] or [a-zA-Z]; notice that the order doesn't matter
`^[0-9][a-zA-Z]`

##### "." is used to refer to any character. So
`9.11`

##### "or" combines two expressions
`flood|fire`

##### include any number of alternatives...
`flood|earthquake|hurricane|coldfire`

##### The alternatives can be real expressions and not just literals
`^[Gg]ood|[Bb]ad`

##### The question mark indicates that the indicated expression is optional
`[Gg]eorge( [Ww]\.)? [Bb]ush`

##### * means "any number, including none, of the item" and + means "at least one of the item"
`(.*)`
`[0-9]+ (.*)[0-9]+`

##### {and} are referred to as interval quantifiers; specify the min and max number of matches of an expression
`[Bb]ush( +[^ ]+ +){1,5} debate`