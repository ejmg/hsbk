module PatMatch where

tupFn :: (Int, [a]) 
      -> (Int, [a])
      -> (Int, [a])

tupFn (a, b) (c, d) =
  ((a + c), (b ++ d))

main :: IO ()
main = do
  putStrLn ("(1, \"foo\")")
  putStrLn ("(2, \" bar\")")
  print (tupFn (1, "foo") (2, " bar"))
        
