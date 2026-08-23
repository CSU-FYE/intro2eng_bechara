<?xml version="1.0" encoding="UTF-8"?>

<!-- Custom stylesheet for the "runestone" target.                         -->
<!--                                                                      -->
<!-- We host on Runestone for its interactive components, not to track     -->
<!-- individual student progress, so the per-page indicator ("You have     -->
<!-- attempted N of M activities on this page") is not wanted.  Its counts -->
<!-- are computed by the Runestone server from its own question/event      -->
<!-- tables, which can disagree with what is actually on the page.         -->
<!-- Everything else about the Runestone build is unchanged.               -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
>

<xsl:import href="./core/pretext-html.xsl"/>

<!-- Empty override of the template in core's pretext-runestone.xsl.  The  -->
<!-- core template matches a union of division names (priority 0), so this -->
<!-- needs an explicit higher priority to win.                             -->
<xsl:template match="*" mode="runestone-progress-indicator" priority="1"/>

<!-- Core's "css" template, plus a <style> block of our own.  Overriding a -->
<!-- named template means we have to repeat what core does; these are the  -->
<!-- two lines from the "css" template in core's pretext-html.xsl, so      -->
<!-- check them against core after a PreTeXt upgrade.                      -->
<xsl:template name="css">
    <xsl:if test="not($b-debug-react)">
        <link href="{$html.css.dir}/{$html-css-theme-file}" rel="stylesheet" type="text/css"/>
    </xsl:if>
    <xsl:call-template name="css-common"/>
    <xsl:call-template name="css-video-box-fixes"/>
</xsl:template>

<!-- On the Runestone platform a YouTube "video" is not the usual          -->
<!-- responsive iframe.  Core hands Runestone's JS component a fixed pixel -->
<!-- size (the "design-width", 600px) and skips the "padding-top" trick    -->
<!-- that otherwise gives the enclosing "video-box" its height.  Runestone -->
<!-- then wraps the player in ".runestone", whose own stylesheet adds      -->
<!-- 15px of padding and a 1px border.  So a 600px player sits inside a    -->
<!-- 600px box with 32px of chrome around it: the video is nudged down and -->
<!-- right and spills past the bottom-right corner of the figure.          -->
<!--                                                                      -->
<!-- Drop that chrome and let the player scale with the box instead.  The  -->
<!-- 16:9 ratio is core's default for "video" and is what every video in   -->
<!-- this book uses; a video carrying its own @aspect would need more care -->
<!-- here.                                                                 -->
<xsl:template name="css-video-box-fixes">
    <style>
        <xsl:text>
.ptx-content .video-box .ptx-runestone-container .runestone.yt_section {
    padding: 0;
    border: none;
}
.ptx-content .video-box iframe.youtube-video {
    display: block;
    width: 100%;
    height: auto;
    aspect-ratio: 16 / 9;
}
        </xsl:text>
    </style>
</xsl:template>

</xsl:stylesheet>
