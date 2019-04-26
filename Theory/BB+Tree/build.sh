# pip install imgcat
# sudo apt-get install graphviz || brew install graphviz
g++ btree.cpp jsoncpp.cpp -std=c++11 -o btree
g++ bplustree.cpp jsoncpp.cpp -std=c++11 -o bplustree
echo "To Run BTree : ./btree and To Run B+Tree: ./bplustree"