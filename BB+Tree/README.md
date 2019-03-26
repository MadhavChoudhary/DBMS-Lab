## B/B+ Tree Implementation in C++ with Graphviz Visualisation

### How to Install
`chmod +x build.sh` will handle everything.  
Then run `./btree` for btree or `./bplustree` for bplustree.  

### Requirements (In case `build.sh` fails)
```
imgcat (for displaying images in terminal)
graphviz (for drawing graphs)
```
### Usage
```
search <value>
insert <value>
remove <value>
print //to print the graph diagram in terminal (fontcolor white is being used by default, to use it as black, change all whites in convertJson2Dot to black)
```