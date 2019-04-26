#!/bin/bash
python convertJson2Dot.py tree.json > temp.dot
dot -Tpng temp.dot -o out.png
imgcat out.png
# rm out.png temp.dot tree.json