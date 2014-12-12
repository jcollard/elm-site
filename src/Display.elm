module Display where

import Html(Html)
import Html
import Html.Attributes as Attr
import Side
import Graphics.Element (flow, right, down, spacer, Element)
import Signal (Signal)
import Signal
import Window

render : Html -> (Int, Int) -> Element
render content (w, h) = 
    Html.toElement 800 h <|
        Html.div []
                 [ Html.node "style" [] [styles w h]
                 , page content
                 ]

page : Html -> Html
page content = 
    wrap "background" [ wrap "page" [ wrap "sidebar" [Side.content]
                                    , wrap "content" [content] 
                                    ]
                      ]

wrap : String -> List Html -> Html
wrap id content = Html.div [ Attr.id id ] content

style w h = """
h1 { font-size: 18px; }

h2 { 
     font-size: 14px;
     text-decoration: underline;
   }

p { font-size: 14px; }

a { text-decoration: none; }

a:hover { font-weight: bold; }

#background { width: """ ++ toString w ++ """px;
              height: """ ++ toString h ++ """px;
              overflow: auto;
              background: #f0e2d3;
            }

#page { width: 800px;
        margin-left: auto;
        margin-right: auto;
        background: #fff;
        height: 100%;
        overflow: auto;
        border-left: 1px solid black;
        border-right: 1px solid black;
      }

#content { 
           margin: 0px 5px 0px 5px;
         }

#sidebar { float: left; 
           width: 220px;
           padding: 10px;
           margin: 10px;
           background: #d3e1f0;
           border: 1px solid black;
           border-right: 1px solid black;
           border-bottom: 1px solid black;
         }

#sidebar h1 { margin: 0px; 
            }

#sidebar h2 { margin: 10px 0 0 0;
              padding: 0 0 0 0;
            }

#sidebar ul,li { font-size: 14px;
                 list-style-type: none;
                 margin: 0px 0px 0px 0px;                 
                 padding: 0px 0px 0px 0px;
                 width: 100%;
               }

#sidebar li:hover {
               background: #bbd3ed;
             }

#sidebar a { display: block;
             color: #000;
             margin-left: 10px; 
           }

#sidebar a:hover { font-weight: normal;
                   text-decoration: none;
                 }
"""

styles : Int -> Int -> Html
styles w h = Html.text (style w h)

withContent : Html -> Signal Element
withContent content = Signal.map (render content) Window.dimensions