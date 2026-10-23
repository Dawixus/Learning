package cz.cuni.mff.kvetond.toolkit;

import java.util.ArrayDeque;
import java.util.Iterator;
import java.util.NoSuchElementException;

public class SearchTree implements Iterable<Integer> {
    Node root;

    public void add(int value)
    {
        Node node = new Node(value);

        if (root == null)
        {
            root = node;
            return;
        }

        Node parent = root;
        Node child = root;

        while (child != null)
        {
            parent = child;

            if (child.getvalue() > value)
            {
                child = child.getLeftNode();
            }
            else if (child.getvalue() < value)
            {
                child = child.getRightNode();
            }
            else
            {
                return;
            }
        }

        if (parent.getvalue() > value)
        {
            parent.setLeftNode(node);
        }
        else
        {
            parent.setRightNode(node);
        }
    }

    public Node find(int value) {
        Node actual_node = root;

        while (actual_node != null) {
            if (actual_node.value == value) {
                return actual_node;
            }

            if (value < actual_node.value) {
                actual_node = actual_node.getLeftNode();
            } else {
                actual_node = actual_node.getRightNode();
            }
        }

        return null;
    }

    @Override
    public Iterator<Integer> iterator() {
        return new Iterator<Integer>() {
            private final ArrayDeque<Node> stack = new ArrayDeque<>();

            {
                pushLeft(root);
            }

            private void pushLeft(Node node) {
                while (node != null) {
                    stack.push(node);
                    node = node.getLeftNode();
                }
            }

            @Override
            public boolean hasNext() {
                return !stack.isEmpty();
            }

            @Override
            public Integer next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                Node node = stack.pop();
                int value = node.getvalue();

                pushLeft(node.getRightNode());

                return value;
            }
        };
    }

    public static class Node {
        private final int value;
        private Node leftNode = null;
        private Node rightNode = null;

        public Node(int value)
        {
            this.value = value;
        }

        public int getvalue()
        {
            return value;
        }

        public void setLeftNode(Node node)
        {
            leftNode = node;
        }

        public void setRightNode(Node node)
        {
            rightNode = node;
        }

        public Node getLeftNode()
        {
            return leftNode;
        }

        public Node getRightNode()
        {
            return rightNode;
        }
    }

}
