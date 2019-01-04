defmodule RedBlackTreeTests do
  alias RedBlackTree, as: RBTree
  use ExUnit.Case, async: true

  test "should create a empty tree" do
    rb_tree = %RBTree{}
    assert rb_tree != nil
    assert rb_tree.key == nil
    assert rb_tree.data == nil
    assert rb_tree.left == nil
  end

  test "should create a empty tree using function" do
    rb_tree = RBTree.create()
    assert rb_tree != nil
    assert rb_tree.key == nil
    assert rb_tree.data == nil
    assert rb_tree.left == nil
  end

  test "should create a tree on insert if none is passed" do
    rb_tree = RBTree.insert(%RBTree{key: 15, data: 15})
    assert rb_tree.key == 15
    assert rb_tree.data == 15
    assert rb_tree.color == :red
    assert rb_tree.left == nil
    assert rb_tree.right == nil
  end

  test "should create a tree if nil is passed as a argument for insert" do
    rb_tree = RBTree.insert(nil, %RBTree{key: 15, data: 15})
    assert rb_tree.key == 15
    assert rb_tree.data == 15
    assert rb_tree.color == :red
    assert rb_tree.left == nil
    assert rb_tree.right == nil
  end

  test "should insert multiple nodes in a tree" do
    rb_tree =
      %RBTree{key: 20, data: 20, color: :black} 
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 14, data: 14})

    assert rb_tree.key != nil
    assert rb_tree.data != nil
    assert rb_tree.right != nil
    assert rb_tree.left != nil
    assert rb_tree.left.key == 14
    assert rb_tree.left.data == 14
    assert rb_tree.right.key == 20
    assert rb_tree.right.data == 20
    assert rb_tree.key == 15
    assert rb_tree.data == 15

    rb_tree = rb_tree
      |> RBTree.insert(%RBTree{key: 25, data: 25})
      |> RBTree.insert(%RBTree{key: 30, data: 30})

    assert rb_tree.left.key == 14
    assert rb_tree.left.data == 14
    assert rb_tree.right.key == 25
    assert rb_tree.right.data == 25
    assert rb_tree.key == 15
    assert rb_tree.data == 15
    assert rb_tree.right.right.key == 30
    assert rb_tree.right.right.data == 30
    assert rb_tree.right.left.key == 20
    assert rb_tree.right.left.data == 20

    rb_tree = rb_tree
      |> RBTree.insert(%RBTree{key: 23, data: 23})
      |> RBTree.insert(%RBTree{key: 22, data: 22})
      |> RBTree.insert(%RBTree{key: 19, data: 19})

    assert rb_tree.left.key == 15
    assert rb_tree.left.data == 15
    assert rb_tree.right.key == 25
    assert rb_tree.right.data == 25
    assert rb_tree.key == 22
    assert rb_tree.data == 22
    assert rb_tree.right.right.key == 30
    assert rb_tree.right.right.data == 30
    assert rb_tree.right.left.key == 23
    assert rb_tree.right.left.data == 23
    assert rb_tree.left.right.key == 20
    assert rb_tree.left.right.data == 20
    assert rb_tree.left.left.key == 14
    assert rb_tree.left.left.data == 14
  end

  test "should delete from a tree with just one node" do
    rb_tree = %RBTree{
      color: :black,
      key: 8,
      data: 8,
      left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil},
      right: nil
    }

    rb_tree = RBTree.delete(rb_tree, 10)
    search_node = RBTree.search(rb_tree, 8)
    assert search_node != nil
  end

  test "should delete every node from a tree" do
    rb_tree =
      %RBTree{key: 14, data: 14, color: :black}
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 20, data: 20})
      |> RBTree.insert(%RBTree{key: 22, data: 22})
      |> RBTree.insert(%RBTree{key: 25, data: 25})
      |> RBTree.insert(%RBTree{key: 10, data: 10})
      |> RBTree.insert(%RBTree{key: 18, data: 18})
      |> RBTree.insert(%RBTree{key: 45, data: 45})
      |> RBTree.insert(%RBTree{key: 2, data: 2})
      |> RBTree.insert(%RBTree{key: 1, data: 1})
      |> RBTree.insert(%RBTree{key: 2, data: 2})
      |> RBTree.insert(%RBTree{key: 3, data: 3})
      |> RBTree.insert(%RBTree{key: 4, data: 4})
      |> RBTree.insert(%RBTree{key: 5, data: 5})
      |> RBTree.insert(%RBTree{key: 6, data: 6})
      |> RBTree.insert(%RBTree{key: 7, data: 7})
      |> RBTree.insert(%RBTree{key: 8, data: 8})

    rb_tree = rb_tree 
      |> RBTree.delete(14)
      |> RBTree.delete(15)
      |> RBTree.delete(20)
      |> RBTree.delete(22)
      |> RBTree.delete(25)
      |> RBTree.delete(10)
      |> RBTree.delete(18)
      |> RBTree.delete(45)
      |> RBTree.delete(2)
      |> RBTree.delete(1)
      |> RBTree.delete(2)
      |> RBTree.delete(3)
      |> RBTree.delete(4)
      |> RBTree.delete(5)
      |> RBTree.delete(6)
      |> RBTree.delete(7)
      |> RBTree.delete(8)

    assert rb_tree == :emptyempty
  end

  test "should delete every node from a tree 2" do
    rb_tree =
      %RBTree{key: 14, data: 14, color: :black}
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 20, data: 20})
      |> RBTree.insert(%RBTree{key: 22, data: 22})
      |> RBTree.insert(%RBTree{key: 25, data: 25})
      |> RBTree.insert(%RBTree{key: 10, data: 10})
      |> RBTree.insert(%RBTree{key: 45, data: 45})
      |> RBTree.insert(%RBTree{key: 2, data: 2})
      |> RBTree.insert(%RBTree{key: 1, data: 1})
      |> RBTree.insert(%RBTree{key: 2, data: 2})
      |> RBTree.insert(%RBTree{key: 3, data: 3})
      |> RBTree.insert(%RBTree{key: 4, data: 4})
      |> RBTree.insert(%RBTree{key: 5, data: 5})
      |> RBTree.insert(%RBTree{key: 7, data: 7})
      |> RBTree.insert(%RBTree{key: 48, data: 48})
      |> RBTree.insert(%RBTree{key: 49, data: 49})
      |> RBTree.insert(%RBTree{key: 60, data: 60})
      |> RBTree.insert(%RBTree{key: 65, data: 65})
      |> RBTree.insert(%RBTree{key: 70, data: 70})
      |> RBTree.insert(%RBTree{key: 85, data: 85})
      |> RBTree.insert(%RBTree{key: 90, data: 90})
      |> RBTree.insert(%RBTree{key: 100, data: 100})

    new_rb_tree = RBTree.delete(rb_tree, 15)
    search_node = RBTree.search(new_rb_tree, 15)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 20)
    search_node = RBTree.search(new_rb_tree, 20)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 22)
    search_node = RBTree.search(new_rb_tree, 22)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 25)
    search_node = RBTree.search(new_rb_tree, 25)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 10)
    search_node = RBTree.search(new_rb_tree, 10)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 18)
    search_node = RBTree.search(new_rb_tree, 18)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 45)
    search_node = RBTree.search(new_rb_tree, 45)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 2)
    search_node = RBTree.search(new_rb_tree, 2)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 1)
    search_node = RBTree.search(new_rb_tree, 1)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 2)
    search_node = RBTree.search(new_rb_tree, 2)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 3)
    search_node = RBTree.search(new_rb_tree, 3)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 4)
    search_node = RBTree.search(new_rb_tree, 4)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 5)
    search_node = RBTree.search(new_rb_tree, 5)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 6)
    search_node = RBTree.search(new_rb_tree, 6)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 7)
    search_node = RBTree.search(new_rb_tree, 7)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 8)
    search_node = RBTree.search(new_rb_tree, 8)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 48)
    search_node = RBTree.search(new_rb_tree, 48)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 49)
    search_node = RBTree.search(new_rb_tree, 49)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 60)
    search_node = RBTree.search(new_rb_tree, 60)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 65)
    search_node = RBTree.search(new_rb_tree, 65)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 70)
    search_node = RBTree.search(new_rb_tree, 70)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 85)
    search_node = RBTree.search(new_rb_tree, 85)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 90)
    search_node = RBTree.search(new_rb_tree, 90)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 100)
    search_node = RBTree.search(new_rb_tree, 100)
    assert search_node == nil
  end

  test "should delete every node from a tree 3" do
    rb_tree =
      %RBTree{key: 14, data: 14, color: :black}
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 45, data: 45})
      |> RBTree.insert(%RBTree{key: 2, data: 2})
      |> RBTree.insert(%RBTree{key: 1, data: 1})
      |> RBTree.insert(%RBTree{key: 2, data: 2})
      |> RBTree.insert(%RBTree{key: 3, data: 3})
      |> RBTree.insert(%RBTree{key: 4, data: 4})
      |> RBTree.insert(%RBTree{key: 5, data: 5})
      |> RBTree.insert(%RBTree{key: 7, data: 7})
      |> RBTree.insert(%RBTree{key: 48, data: 48})
      |> RBTree.insert(%RBTree{key: 49, data: 49})
      |> RBTree.insert(%RBTree{key: 60, data: 60})
      |> RBTree.insert(%RBTree{key: 65, data: 65})
      |> RBTree.insert(%RBTree{key: 70, data: 70})
      |> RBTree.insert(%RBTree{key: 85, data: 85})
      |> RBTree.insert(%RBTree{key: 90, data: 90})
      |> RBTree.insert(%RBTree{key: 100, data: 100})

    new_rb_tree = RBTree.delete(rb_tree, 15)
    search_node = RBTree.search(new_rb_tree, 15)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 45)
    search_node = RBTree.search(new_rb_tree, 45)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 2)
    search_node = RBTree.search(new_rb_tree, 2)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 1)
    search_node = RBTree.search(new_rb_tree, 1)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 2)
    search_node = RBTree.search(new_rb_tree, 2)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 3)
    search_node = RBTree.search(new_rb_tree, 3)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 4)
    search_node = RBTree.search(new_rb_tree, 4)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 5)
    search_node = RBTree.search(new_rb_tree, 5)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 7)
    search_node = RBTree.search(new_rb_tree, 7)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 48)
    search_node = RBTree.search(new_rb_tree, 48)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 49)
    search_node = RBTree.search(new_rb_tree, 49)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 60)
    search_node = RBTree.search(new_rb_tree, 60)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 65)
    search_node = RBTree.search(new_rb_tree, 65)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 70)
    search_node = RBTree.search(new_rb_tree, 70)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 85)
    search_node = RBTree.search(new_rb_tree, 85)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 90)
    search_node = RBTree.search(new_rb_tree, 90)
    assert search_node == nil
    new_rb_tree = RBTree.delete(rb_tree, 100)
    search_node = RBTree.search(new_rb_tree, 100)
    assert search_node == nil
  end

  test "should build a tree and delete a left node" do
    rb_tree =
      %RBTree{key: 20, data: 20, color: :black}
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 14, data: 14})
      |> RBTree.insert(%RBTree{key: 25, data: 25})
      |> RBTree.insert(%RBTree{key: 30, data: 30})
      |> RBTree.insert(%RBTree{key: 23, data: 23})
      |> RBTree.insert(%RBTree{key: 22, data: 22})
      |> RBTree.insert(%RBTree{key: 19, data: 19})

    rb_tree = RBTree.delete(rb_tree, 15)
    assert rb_tree.left.key == 19
    assert rb_tree.left.data == 19
    assert rb_tree.right.key == 25
    assert rb_tree.right.data == 25
    assert rb_tree.key == 22
    assert rb_tree.data == 22
    assert rb_tree.right.right.key == 30
    assert rb_tree.right.right.data == 30
    assert rb_tree.right.left.key == 23
    assert rb_tree.right.left.data == 23
    assert rb_tree.left.right.key == 20
    assert rb_tree.left.right.data == 20
    assert rb_tree.left.left.key == 14
    assert rb_tree.left.left.data == 14
  end

  test "should build a tree and delete a left node inner node" do
    rb_tree =
      %RBTree{key: 20, data: 20, color: :black} 
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 14, data: 14})
      |> RBTree.insert(%RBTree{key: 25, data: 25})
      |> RBTree.insert(%RBTree{key: 30, data: 30})
      |> RBTree.insert(%RBTree{key: 23, data: 23})
      |> RBTree.insert(%RBTree{key: 22, data: 22})
      |> RBTree.insert(%RBTree{key: 19, data: 19})

    rb_tree = RBTree.delete(rb_tree, 14)
    assert rb_tree.left.key == 19
    assert rb_tree.left.data == 19
    assert rb_tree.right.key == 25
    assert rb_tree.right.data == 25
    assert rb_tree.key == 22
    assert rb_tree.data == 22
    assert rb_tree.right.right.key == 30
    assert rb_tree.right.right.data == 30
    assert rb_tree.right.left.key == 23
    assert rb_tree.right.left.data == 23
    assert rb_tree.left.right.key == 20
    assert rb_tree.left.right.data == 20
    assert rb_tree.left.left.key == 15
    assert rb_tree.left.left.data == 15
  end

  test "should build a tree and delete a right node" do
    rb_tree = %RBTree{key: 20, data: 20, color: :black}
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 14, data: 14})
      |> RBTree.insert(%RBTree{key: 25, data: 25})
      |> RBTree.insert(%RBTree{key: 30, data: 30})
      |> RBTree.insert(%RBTree{key: 23, data: 23})
      |> RBTree.insert(%RBTree{key: 22, data: 22})
      |> RBTree.insert(%RBTree{key: 19, data: 19})

    rb_tree = RBTree.delete(rb_tree, 25)
    assert rb_tree.left.key == 14
    assert rb_tree.left.data == 14
    assert rb_tree.right.key == 22
    assert rb_tree.right.data == 22
    assert rb_tree.key == 15
    assert rb_tree.data == 15
    assert rb_tree.right.right.key == 23
    assert rb_tree.right.right.data == 23
    assert rb_tree.right.left.key == 20
    assert rb_tree.right.left.data == 20
    assert rb_tree.right.left.left.key == 19
    assert rb_tree.right.left.left.data == 19
    assert rb_tree.right.right.right.key == 30
    assert rb_tree.right.right.right.data == 30
  end

  test "should build a tree and delete a right inner node" do
    rb_tree = %RBTree{key: 20, data: 20, color: :black}
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 14, data: 14})
      |> RBTree.insert(%RBTree{key: 25, data: 25})
      |> RBTree.insert(%RBTree{key: 30, data: 30})
      |> RBTree.insert(%RBTree{key: 23, data: 23})
      |> RBTree.insert(%RBTree{key: 22, data: 22})
      |> RBTree.insert(%RBTree{key: 19, data: 19})

    rb_tree = RBTree.delete(rb_tree, 30)
    assert rb_tree.left.key == 14
    assert rb_tree.left.data == 14
    assert rb_tree.right.key == 22
    assert rb_tree.right.data == 22
    assert rb_tree.key == 15
    assert rb_tree.data == 15
    assert rb_tree.right.right.key == 23
    assert rb_tree.right.right.data == 23
    assert rb_tree.right.left.key == 20
    assert rb_tree.right.left.data == 20
    assert rb_tree.right.left.left.key == 19
    assert rb_tree.right.left.left.data == 19
  end

  test "should delete a corner case left node" do
    rb_tree = %RBTree{
      color: :red,
      key: 20,
      data: 20,
      left: %RBTree{
        color: :black,
        key: 5,
        data: 5,
        left: %RBTree{color: :blackblack, key: 4, data: 4, left: nil, right: nil},
        right: %RBTree{
          color: :red,
          key: 8,
          data: 8,
          left: %RBTree{color: :black, key: 7, data: 7, left: nil, right: nil},
          right: %RBTree{
            color: :black,
            key: 8,
            data: 8,
            left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil},
            right: %RBTree{color: :red, key: 14, data: 14, left: nil, right: nil}
          }
        }
      },
      right: nil
    }

    rb_tree = RBTree.delete(rb_tree, 5)
    search_node = RBTree.search(rb_tree, 5)
    assert search_node == nil
  end

  test "should search in a tree" do
    rb_tree =
      %RBTree{key: 20, data: 20, color: :black} 
      |> RBTree.insert(%RBTree{key: 15, data: 15})
      |> RBTree.insert(%RBTree{key: 14, data: 14})

    search_node = RBTree.search(rb_tree, 20)
    assert search_node.data == 20
    search_node = RBTree.search(rb_tree, 15)
    assert search_node.data == 15
    search_node = RBTree.search(rb_tree, 14)
    assert search_node.data == 14
    search_node = RBTree.search(rb_tree, 45)
    assert search_node == nil
  end
end
