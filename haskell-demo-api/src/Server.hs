module Server
    ( startApp
    ) where

import Data.Aeson (ToJSON)
import GHC.Generics
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Servant.API

type API = Get '[JSON] Result
      :<|> "transform" :> QueryParam "string" String :> Get '[JSON] Result

data Result = Result { message :: String } deriving (Generic)
instance ToJSON Result

helloWorldHandler :: Handler Result
helloWorldHandler = return $ Result "Hello World!"

transformHandler :: Maybe String -> Handler Result
transformHandler mstring = return . Result $ case mstring of
    Nothing -> "Query parameter \"string\" required"
    Just string -> transform string
    where transform = unwords . map reverse . words

server :: Server API
server = helloWorldHandler
    :<|> transformHandler

api :: Proxy API
api = Proxy

app :: Application
app = serve api server

startApp :: Int -> IO ()
startApp port = do
    putStrLn $ "Listening on port " ++ show port
    run port app
