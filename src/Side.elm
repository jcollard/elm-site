module Side where

import Html (..)
import Html
import Html.Attributes as Attr
import Graphics.Element (Element)
import Markdown
import Window
import Signal

content : Html
content = Markdown.toHtml """

# Joseph Collard

**Email:** jcollard @ cs.umass.edu

**Office:** Computer Science 354

-------------------------------

## About Me
  * [General Information](.)
  * [Calendar](https://www.google.com/calendar/embed?src=josephmcollard%40gmail.com)
  * [My Github](https://github.com/jcollard)

## My Projects
  * [Captain Teach](https://github.com/brownplt/admiral-edu)
  * [unm-hip](https://github.com/jcollard/unm-hip#university-of-new-mexicos-haskell-image-processing-library)
  * [Elmtris](https://github.com/jcollard/elmtris)

## Things I Appreciate
  * [Elm](http://elm-lang.org/)
  * [Haskell](http://www.haskell.org/haskellwiki/Haskell)
  * [Bootstrap](http://www.bootstrapworld.org/)
  * [XKCD](http://www.xkcd.com/)
  * [Reddit](http://www.reddit.com/)
  * [Hacker News](https://news.ycombinator.com/)
  * [Project Euler](http://www.projecteuler.net/)
  * [Github](https://github.com/)
  * [Doraleous and Associates](http://www.youtube.com/watch?v=qk1B8DiIJI8&list=PL68FD0D7F63715384)
  * [Questionable Content](http://questionablecontent.net/)
  * [Free DNS](http://freedns.afraid.org/)
"""
