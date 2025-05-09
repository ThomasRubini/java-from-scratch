package fr.thomas.myproject;

import fr.thomas.mylib2.Lib2;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");

        Lib lib = new Lib();
        Lib2 lib2 = new Lib2();

        System.out.println("foo(1, 2): "+ lib.foo(1, 2));
        System.out.println("foo2(1, 2): "+ lib2.foo2(1, 2));
    }
}
