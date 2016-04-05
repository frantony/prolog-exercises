prolog-exercises
================

```bratko_1.pl``` contains some exercises from [1].
Running queries:

    $ swipl -s bratko_1.pl -g "happy(_)"
    $ swipl -s bratko_1.pl -g "hastwochildren(_)"
    $ swipl -s bratko_1.pl -g "grandchild(_, _)"
    $ swipl -s bratko_1.pl -g "aunt(_, _)"


[1] Ivan Bratko. Prolog Programming for Artificial Intelligence, 1986

    @book{Bratko:1986:PPA:6981,
        author = {Bratko, Ivan},
        title = {Prolog Programming for Artificial Intelligence},
        year = {1986},
        isbn = {0-201-14224-4},
        publisher = {Addison-Wesley Longman Publishing Co., Inc.},
        address = {Boston, MA, USA},
    }
