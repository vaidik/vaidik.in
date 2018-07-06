{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.HTTP.Types.Status (status301)
import Data.Text.Lazy (Text)

permanentlyMove :: RoutePattern -> Text -> ScottyM ()
permanentlyMove src dest = get src $ do
    status status301
    setHeader "Location" dest

routes :: ScottyM ()
routes = do
    permanentlyMove "/blog/vagrant-for-development-in-a-service-oriented-architecture.html" "https://medium.com/vaidikkapoor/vagrant-for-development-in-a-service-oriented-architecture-soa-54ad1f26ff53"
    permanentlyMove "/blog/understanding-non-blocking-io-with-python-part-1.html" "https://medium.com/vaidikkapoor/understanding-non-blocking-i-o-with-python-part-1-ec31a2e2db9b"
    permanentlyMove "/blog/incoming-python-json-validation-framework.html" "https://medium.com/vaidikkapoor/incoming-json-validation-framework-for-python-6da035d81ccc"
    permanentlyMove "/blog/gevent-wsgi-logging-problems.html" "https://medium.com/vaidikkapoor/problems-with-logging-while-using-gevents-wsgi-server-3d19fbca3de1"
    permanentlyMove "/blog/cloud-computing.html" "https://medium.com/vaidikkapoor/what-is-cloud-computing-53c1f514734"
    permanentlyMove "/blog/need-for-personal-expenses-management-app.html" "https://medium.com/vaidikkapoor/need-for-a-good-personal-expenses-management-app-8338e8ea31d9"
    permanentlyMove "/blog/marg.html" "https://medium.com/vaidikkapoor/marg-a-simple-request-router-written-in-php-ee0caba9c239"
    permanentlyMove "/blog/pycon-india-2012.html" "https://medium.com/vaidikkapoor/first-time-at-pycon-india-97ce6a5b8bd1"
    permanentlyMove "/blog/mozilla-rep.html" "https://medium.com/vaidikkapoor/being-a-mozilla-rep-7fbe711544c2"
    permanentlyMove "/blog/the-new-blog.html" "https://medium.com/vaidikkapoor/the-new-blog-ad45028dc774"
    permanentlyMove "/blog/google-summer-of-code.html" "https://medium.com/vaidikkapoor/google-summer-of-code-2012-e19b3ac3eee3"
    permanentlyMove "/blog/password-protect.html" "https://medium.com/vaidikkapoor/passwordprotect-a-firefox-extension-for-web-accounts-security-e36b74b9bfb5"
    permanentlyMove "/blog/firefox-4-launch-party.html" "https://medium.com/vaidikkapoor/firefox-4-launch-party-9d286dfe3f68"
    permanentlyMove "/blog/gsoc-2011.html" "https://medium.com/vaidikkapoor/so-google-summer-of-code-it-is-7d2b2e2e0e80"

main = do
    putStrLn "Starting server on localhost:3000..."
    scotty 3000 routes
