<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- 
		This template is intended to be inluded in 
		/WebUI/Controls/FormatArea/XSLTs/OnPaste.xslt
		And can not be used stanalone.
	-->

	<xsl:template match="text()[not(ancestor::script)]">
		<xsl:call-template name="process-double-minus-to-dashes">
			<xsl:with-param name="string" select="." />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="process-double-minus-to-dashes">
		<xsl:param name="string" />
		<xsl:choose>
			<xsl:when test="contains($string, '--')">
				<xsl:value-of select="substring-before($string, '--')" />
				<xsl:value-of select="string('&#8212;')"/>
				<xsl:call-template name="process-double-minus-to-dashes">
					<xsl:with-param name="string" select="substring-after($string, '--')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$string"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 
		End of UIBeardcore Extension Inclusion.		
	-->
</xsl:stylesheet>
