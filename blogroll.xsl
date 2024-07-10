<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method = "html" version = "4.0" encoding="UTF-8" indent = "yes" />


<xsl:template match="/opml">
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><xsl:value-of select="head/title" /></title>
    <link rel="stylesheet" href="blogroll.css" />
    <link rel="stylesheet" href="https://s3.amazonaws.com/scripting.com/code/fontawesome/css/all.css" />
    <!-- Override some style elements -->
    <style>
.divBlogrollContainer, #idBlogrollContainer {
  width: 600px;
}
.divBlogroll {
  width: 580px;
}
.trBlogrollFeed .tdBlogrollFeedTitle .spTitleString {
	max-width: 500px;
}
.raaHeader {
  margin-bottom: 40px;
}
.raaTopMessage {
  padding: 12px;
  font-size: 15px;
}
    </style>
  </head>
  <body>
    <div class="raaHeader divBlogrollContainerContainer">
      <div class="divBlogrollContainer" id="idBlogrollContainer" tabindex="1">
        <div class="divBlogroll raaTopMessage">
          This is a FeedLand OPML subscription list.
          Subscribe by copying the URL from the address bar into your newsreader.
          Visit <a href="https://feedland.com">FeedLand</a> to learn more and get started.
        </div>
      </div>
    </div>

    <div class="divBlogrollContainerContainer">
      <div class="divBlogrollContainer" id="idBlogrollContainer" tabindex="0">
      <!--
          <div class="dropdown divBlogrollMenu"><a class="dropdown-toggle" hrefx="javascript:void(0);" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <li><a class="dropdown-item" href="#">Blogroll home..</a></li>
                  <li><a class="dropdown-item" href="#">How to use..</a></li>
                  <li class="divider"></li>
                  <li><a class="dropdown-item" href="#">View this list in OPML..</a></li>
                  <li><a class="dropdown-item" href="#">View list in FeedLand...</a></li>
                  <li class="divider"></li>
                  <li><a class="dropdown-item" href="#">Developer info..</a></li>
              </ul>
          </div>
      -->

      <div class="divBlogroll">
        <div class="divBlogrollTitle">
          <div class="divTitleText" title="{head/description}">
            <xsl:value-of select="head/title" />
          </div>
        </div>

        <div class="divBlogrollSortLinks">
          <span class="spTitleLink selected">Title</span>
          <span class="spWhenLink">Feed</span>
          </div>
          <table class="divBlogrollTable">
            <tbody>
              <xsl:apply-templates select="body"/>
            </tbody>
          </table>
          <div class="divBlogrollFooter"><a href="https://feedland.com/" target="_blank">Powered by FeedLand.</a></div>
        </div>
      </div>
    </div>
  </body>
</html>
</xsl:template>


<xsl:template match = "outline" >
<tr class="trBlogrollFeed" data-feedurl="{@xmlUrl}">
  <td class="tdBlogrollWedge">
    <!--
    <i class="fa fa-caret-right darkCaretColor"></i>
    -->
  </td>
  <td class="tdBlogrollFeedTitle">
    <a href="{@xmlUrl}">
    <span class="spTimeContainer"><span class="spWhenUpdated">
      <i class="fa fa-rss"></i>
    </span></span>
    </a>
    <a href="https://feedland.com/?feedurl={@xmlUrl}">
    <span class="spTitleString" data-container=".divBlogrollContainer" data-toggle="tooltip" data-placement="right" data-original-title="" title="">
      <xsl:value-of select="@text" />
    </span>
    </a>
    <div class="divNewsPod"></div>
  </td>
</tr>
</xsl:template>


</xsl:stylesheet> 
