# -*- coding: utf-8 -*-

from __future__ import print_function
from pyswip import Prolog, Functor, Variable, call


def main():
    prolog = Prolog()
    prolog.consult("bratko_1.pl")

    for i in prolog.query("happy(X)"):
        print(i["X"], "is happy")

    for i in prolog.query("hastwochildren(X)"):
        print(i["X"], "has two children")

    for i in prolog.query("grandchild(X, Y)"):
        print(i["X"], "is a grandchild for", i["Y"])

    for i in prolog.query("aunt(X, Y)"):
        print(i["X"], "is an aunt for", i["Y"])


if __name__ == "__main__":
    main()
