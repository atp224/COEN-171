datatype tree = empty | node of int * tree * tree

fun insert empty x = node(x, empty, empty)
    |   insert (node(data,left,right)) x =
        if data = x then
            node(data,left,right)
        else if data > x then
            node(data, insert left x, right)
        else 
            node(data, left, insert right x);


fun member empty x = false
    |   member (node(data, left, right)) x =
        if data = x then
            true
        else if x < data then
            member left x
        else
            member right x;