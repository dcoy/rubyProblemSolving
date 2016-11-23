### Shape Finding

This will cover: *Graphs, Search, Sets*

###### Instructions:

Write a function at takes a rectangular grid of integers and counts the shapes. A shape is a set of nonzero cells in the grid that are adjacent (no diagonals)


````
<?php
class ShapesText extends PHPUnit_Framework_Testcase
{
 public static function countShapes($grid)
 {
  $seen = array();
  $count = 0;
  foreach ($grid as $i => $row) {
   foreach ($row as $j => $v) {
    if ($v && self::buildShape($seen, $grid, $i, $j)) {
     $count++;
    }
   }
  }
  return $count;
 }
public static function buildShape(&$seen, $grid, $i, $j)
{
   if (isset($seen[$i][$j]) or !isset($grid[$i][$j]) or !$grid[$i][$j]) {
     return false;
   }
   $seen[$i][$j] = 1;
   self::buildShape($seen, $grid, $i + 1, $j);
   self::buildShape($seen, $grid, $i - 1, $j);
   self::buildShape($seen, $grid, $i, $j + 1);
   self::buildShape($seen, $grid, $i, $j - 1);
   return true;
}
public static function toGrid($str)
{
 $grid = array();
 foreach (explode("\n", $str) as $line) {
  $grid[] = explode(' ', $line);
 }
 return $grid;
}
public function testToGrid()
{
 $gridstr = <<<grid
1 0
0 1
grid;
 $grid = self::toGrid($gridstr);
 $ex = array(array(1, 0), array(0, 1));
 $this->assertEquals($ex, $grid);
}
public function test1()
 {
 $gridstr = <<<grid
1 0 0 1
1 0 0 1
0 1 1 1
grid;
 $grid = self::toGrid($gridstr);
 $this->assertEquals(2, self::countShapes($grid));
 }
public function test2()
 {
 $gridstr = <<<grid
1 0 0 1
1 1 0 1
0 1 1 1
grid;
 $grid = self::toGrid($gridstr);
 $this->assertEquals(1, self::countShapes($grid));
 }
} ?>
````
