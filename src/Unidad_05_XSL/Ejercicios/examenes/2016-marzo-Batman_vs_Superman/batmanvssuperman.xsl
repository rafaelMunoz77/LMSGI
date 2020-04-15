<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" />
  <xsl:template match="/cine">
    <html>
      <head>
        <META http-equiv="Content-Type"
					content="text/html; charset=iso-8859-1" />
        <title></title>
        <xsl:call-template name="css" />
      </head>
      <body>

        <div style="width: 1000px; margin: 0 auto;">
          <h1>
            <xsl:value-of select="@nombre" />
          </h1>
          <xsl:apply-templates select="titulo" />
          <xsl:call-template name="pintarSesiones" />
        </div>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="titulo">
    <img src="{/cine/titulo/imagen}" width="500px" />
    <h2>
      <xsl:value-of select="@nombre" />
    </h2>
    <h3>
      Estreno:
      <xsl:value-of select="@estreno" />
    </h3>
    <p></p>
  </xsl:template>

  <xsl:template name="pintarSesiones">
    <table border="1" width="100%">
      <xsl:for-each select="sesiones/sesion">
        <xsl:choose>
          <xsl:when test="position() mod 2 = 1">
            <xsl:call-template name="pintaSesion">
              <xsl:with-param name="color">#dbf7ff</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="pintaSesion">
              <xsl:with-param name="color">
                #FFFFFF
              </xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </table>
  </xsl:template>

  <xsl:template name="pintaSesion">
    <xsl:param name="color" />
    <tr>
      <td align="center" style="background:{$color};">
        Sesión:
        <xsl:value-of select="position()" />
        - Hora:
        <xsl:value-of select="@hora" />

        <table border="1" width="50%" align="center">
          <xsl:call-template name="bucleForFila">
            <xsl:with-param name="i">
              1
            </xsl:with-param>
          </xsl:call-template>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="bucleForFila">
    <xsl:param name="i" />
    <xsl:if test="$i &lt;= 4">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i">
            <xsl:value-of select="$i" />
          </xsl:with-param>
          <xsl:with-param name="j">
            1
          </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="bucleForFila">
          <xsl:with-param name="i">
            <xsl:value-of select="$i + 1" />
          </xsl:with-param>
        </xsl:call-template>
      </tr>
    </xsl:if>
  </xsl:template>


  <xsl:template name="bucleForColumna">
    <xsl:param name="i" />
    <xsl:param name="j" />
    <xsl:if test="$j &lt;= 4">
      <xsl:call-template name="celda">
        <xsl:with-param name="x">
          <xsl:value-of select="$j" />
        </xsl:with-param>
        <xsl:with-param name="y">
          <xsl:value-of select="$i" />
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="bucleForColumna">
        <xsl:with-param name="i">
          <xsl:value-of select="$i" />
        </xsl:with-param>
        <xsl:with-param name="j">
          <xsl:value-of select="$j + 1" />
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>


  <xsl:template name="celda" match="ocupado">
    <xsl:param name="x" />
    <xsl:param name="y" />
    <td align="center">
      x: <xsl:value-of select="$x"/> - y <xsl:value-of select="$y"/>
      <xsl:for-each select="ocupado">
        <p>fila: <xsl:value-of select="@fila"/> - asiento: <xsl:value-of select="@asiento"/></p>  
      </xsl:for-each>
<!--      <xsl:choose>
        <xsl:when
					test="ocupado[@fila=$y and @asiento=$x]">
          <img src="{/cine/imagenes/imagen[@id='ocupado']}" />
        </xsl:when>
        <xsl:otherwise>
          <img src="{/cine/imagenes/imagen[@id='libre']}" />
        </xsl:otherwise>
      </xsl:choose>
-->    </td>
  </xsl:template>


  <xsl:template name="pintarImagen">
    <xsl:param name="id" />

    <img src="{/cine/imagenes/imagen[@id=$id]}" width="150px" />
  </xsl:template>

  <xsl:template name="css">
    <style type="text/css">
      body {
      font-family: Arial;
      font-size: 12px;
      }
    </style>
  </xsl:template>
</xsl:stylesheet>