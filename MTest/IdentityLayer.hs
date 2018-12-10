module MTest.IdentityLayer where

import qualified Layer.Layer as Layer
import qualified SDR.SDR as SDR

data IdentityLayer = IdentityLayer

instance Layer.Layer IdentityLayer where
    run sdr _ _ = sdr

