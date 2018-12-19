module DontUseIntLOL where
import GHC.Int

main :: IO ()
main = do
  print (127 + 1 :: Int8) -- (-128), *gets punched in face* 
                         -- how could you have done this?

