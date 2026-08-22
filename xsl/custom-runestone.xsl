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

</xsl:stylesheet>
