module General where

import Display
import Markdown
import Html (..)
import Html.Attributes as Attr

page : Html
page = Markdown.toHtml """
# General Information

I am a graduate student in the school of Computer Science at the University of 
Massachusetts. My research interests are focused around Computer Science 
Eductation and Programming Languages.
"""

content : Html
content = div [] [ page
                 , iframe [ Attr.style 
                             [ ("width", "400px")
                             , ("height", "400px")
                             , ("border", "0px")
                             , ("margin", "0 auto")
                             , ("display", "block")
                             ]
                          , Attr.src "circle.html"
                          ]
                          []
                 ]
                       

main = Display.withContent content