---
layout: default
date: 2019-12-02
title: ptSVG
header: Svg
---
<div id="preamble">
<div class="sectionbody">
<div class="paragraph">
<p><span class="small"><a href="../../../index.html">Home/</a></span>
<span class="small"><a href="../../index.html">Computing/</a></span>
<span class="small"><a href="../index.html">Web/</a></span>
<span class="small">Svg/</span></p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_svg_scalar_vector_graphics">SVG (Scalar Vector Graphics)</h2>
<div class="sectionbody">
<div class="paragraph">
<p>SVG(1999) is an XML image format for two dimensional images that uses vectors to describe shapes.
SVG is well integrated into HTML;
It is now recognized by most web browsers.</p>
</div>
<div class="paragraph">
<p>SVG documents can be styled with CSS.
(See the style element in the example below. )</p>
</div>
<div class="paragraph">
<p>SVG images can be placed within other SVG images ( SVG images are <em>composable</em> ) and within html documents.</p>
</div>
<div class="paragraph">
<p>Jon Ferraiolo was one of the designers of SVG.
There is an interesting interview with him about the design of SVG at the Adobe web site.
( <a href="https://www.adobe.com/devnet/svg/articles/svg-jon-ferraiolo-interview.html">Jon Ferraiolo Interview, Oct 2012</a> )</p>
</div>
<div class="sect2">
<h3 id="_example">Example</h3>
<div class="listingblock">
<div class="content">
<pre>&lt;svg width=100 height=100 viewBox="0 0 100 100" &gt;
&lt;rect x=00 y=00 width=100 height=080 style="fill:red;" /&gt;
&lt;rect x=00 y=80 width=100 height=100 style="fill:darkred;" /&gt;
&lt;circle cx=50 cy=50 r=25 style="fill:blue;" /&gt;
&lt;circle cx=50 cy=50 r=05 style="fill:black;" /&gt;
&lt;ellipse x=50 y=100 rx=35 ry=25 style="fill:green;" /&gt;
&lt;/svg&gt;</pre>
</div>
</div>
<br>

<svg width=100 height=100 viewBox="0 0 100 100" > +
<rect x=00 y=00 width=100 height=080 style="fill:red;" />
<rect x=00 y=80 width=100 height=100 style="fill:darkred;" />
<rect y=80 width=100 height=100 style="fill:darkred;" />
<circle cx=50 cy=50 r=25 style="fill:blue;" />
<circle cx=50 cy=50 r=05 style="fill:black;" />
<ellipse cx=50 cy=100 rx=35 ry=25 style="fill:darkgreen;" />
</svg>
<div class="sect3">
<h4 id="_notes">Notes</h4>
<div class="ulist">
<ul>
<li>
<p>All images fit within rectangles.</p>
</li>
<li>
<p>Numbers are supposed to be enclosed in double quotes. "50" and not 50, but it often works without the quotes.</p>
</li>
<li>
<p>Rectangle is abbreviated to 'rect', but none of the other shapes are abbreviated.</p>
</li>
<li>
<p>The rect element ends with a '/&gt;' and not a '&gt;'.</p>
</li>
<li>
<p>The y axis points down ( Like Java 2D ). Angles go clockwise.</p>
</li>
<li>
<p>The svg declaration specifies the width and height of the image that will be inserted into the html context.
The lines enclosed by the &lt;svg&gt; &#8230;&#8203; &lt;/svg&gt; create the image, which may be bigger or smaller than the region of the inserted image.</p>
<div class="paragraph">
<p>First the image is created, and then a slice taken and resized according to the viewBox, and inserted into the reserved image area.
The viewBox specifies the x, y points, width and height of the slice taken from the created image.</p>
</div>
</li>
</ul>
</div>
</div>
</div>
<div class="sect2">
<h3 id="_composability">Composability</h3>
<div class="listingblock">
<div class="content">
<pre>&lt;svg&gt;
&lt;defs&gt;
&lt;hatWoman&gt;
&lt;/hatWoman&gt;
&lt;xlink href="#hatWoman" /&gt;
&lt;/defs&gt;
&lt;hatwoman1&gt;
&lt;hatwoman2&gt;
&lt;hatwoman3&gt;
&lt;/svg&gt;</pre>
</div>
</div>
</div>
</div>
</div>
