### Project Name

This will cover: *Pointers, Sequence Processing*

###### Instructions:

Given a singly linked list where a node is either null for the empty list or a pair of the payload and next pointer, Write a function that reverses the list in place by manipulating the next pointers



````
<?php
class Node {
    // this is the core of a singly linked list
    public $data;
    public $next;

    // this is a goofy counter thats nice for print_r() style debugging
    static $id = 0;
    public function __construct() {
        $this->data = self::$id++;
    }

    // the meat. huge variety, this is the good/easy one
    static public function reverse($node) {
        // often there is a temptation to set this to $node because "it should be the new end of the list",
        // but the new end of the list should be null
        $back = null;
        // while there is still more list
        // base case the list is empty and we skip the loop
        while ($node !== null) {
            // recursive step we move one node from the original list to the reversed list
            // save the rest of the list
            $next = $node->next;
            // point this node's next at the reversed part of the list
            $node->next = $back;
            // its the new back now
            $back = $node;
            // and remember to process the remaining original list
            $node = $next;
        }
        // we've reversed into $back
        return $back;
    }
}

class RevListTest extends PHPUnit_Framework_TestCase {
    public function testEmpty() {
        $this->assertEquals(null, Node::reverse(null));
    }
    public function test1() {
        $node = new Node;
        $this->assertEquals($node, Node::reverse($node));
        $this->assertEquals(null, $node->next);
    }
    public function test3() {
        $tail = new Node;
        $mid = new Node;
        $mid->next = $tail;
        $head = new Node;
        $head->next = $mid;
        $rev = Node::reverse($head);
        $this->assertEquals($rev, $tail);
        $this->assertEquals($rev->next, $mid);
        $this->assertEquals($rev->next->next, $head);
        $this->assertEquals($rev->next->next->next, null);
    }
    public function testCircle() {
        $tail = new Node;
        $mid = new Node;
        $mid->next = $tail;
        $head = new Node;
        $head->next = $mid;
        $tail->next = $head;
        $rev = Node::reverse($head);
        $this->assertEquals($rev, $head);
        $this->assertEquals($rev->next, $tail);
        $this->assertEquals($rev->next->next, $mid);
        $this->assertEquals($rev->next->next->next, $head);
    }
    public function testLasso() {
        $tail = new Node;
        $mid1 = new Node;
        $mid1->next = $tail;
        $mid2 = new Node;
        $mid2->next = $mid1;
        $tail->next = $mid2;
        $head = new Node;
        $head->next = $mid2;
        $rev = Node::reverse($head);
        // so it doesn't loop forever
        // but it happens to reverse the loop of the lasso and give you
        // back the whole same node you passed in
 }
}
````
