program treeexample(intput, output);
    type
	tree = ^node;
	node = record
	    data : integer;
	    left : tree;
        right : tree
	end;

    function insert(var head : tree; x :integer) : tree;
        begin
            if head = nil then 
                begin
                new(head);
                head^.left := nil;
                head^.right := nil;
                head^.data := x;
                insert := head;
                end
            else if head^.data < x then 
                head^.right := insert(head^.right, x)
            else if (head^.data > x) then 
                head^.left := insert(head^.left, x);
    end;

    function member(var head : tree; x :integer) : boolean;
        begin
            if (head = nil) then
                member := false
            else if (x < head^.data) then
                member := member(head^.left, x)
            else if (x > head^.data) then
                member := member(head^.right, x)
            else if (x = head^.data) then
                member := true;
    end;

    var head : tree;
    var x : integer;
    begin
        head := nil;
        readln(x);
        repeat 
            insert(head,x);
            readln(x)
        until x = -1;

    readln(x);
    repeat
        begin
        if member (head,x) = true then
            writeln('true');
        if member (head,x) = false then
            writeln('false');
        readln(x);
        end
    until x = -1;
end.



