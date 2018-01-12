-- doesItCompile.hs

module DoesItCompile where

-- bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10 -- will not compile!, there are no arguments left to apply with bigNum!

bigNum x = (^) 5 $ 10 + x
wahoo = bigNum $ 10 -- yay!


x = print
y = print "woohoo!"
z = x "hello world" -- should def all compile

a = (+)
b = 5
-- c = b 10 nope, doing nothing in this assignment so it just throws an error
c = a 10 -- works now, partial application of a, finishes in d
d = c 200


e = 12 + b
-- f = 10000 * c, nope, c is a partially applied operation
f = 10000 * e -- perfectly valid
