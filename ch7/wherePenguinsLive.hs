module WherePenguinsLive where

data WherePenguinsLive =
    Galapagos
  | Antarctica
  | Australia
  | SouthAfrica
  | SouthAmerica
  deriving (Eq, Show)

data Penguin =
  Peng WherePenguinsLive
  deriving (Eq, Show)

isSouthAfrica :: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _           = False

gimmeWhereTheyLive :: Penguin
                   -> WherePenguinsLive

gimmeWhereTheyLive (Peng whereItLives) =
  whereItLives

galapagosPeng :: Penguin -> Bool
galapagosPeng (Peng Galapagos) = True
galapagosPeng _                = False

antarcticPeng :: Penguin -> Bool
antarcticPeng (Peng Antarctica) = True
antarcticPeng _                 = False

-- multiple pattern matching!
-- We unpack the Penguin datatype AND specify which WherePenguinsLive we match
-- on.
antarcticOrGalapagos :: Penguin -> Bool
antarcticOrGalapagos p =
  (galapagosPeng p)
  || (antarcticPeng p)
