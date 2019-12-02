---
layout: default
date: 2019-12-02
title: ptAsciiDoc Paragraphs
layout: page
---
<div id="preamble">
<div class="sectionbody">
<div class="paragraph">
<p><span class="small"><a href="../../../index.html">Home/</a></span>
<span class="small"><a href="../../index.html">Computing/</a></span>
<span class="small"><a href="../index.html">Formatting/</a></span>
<span class="small"><a href="index.html">Asciidoc/</a></span></p>
</div>
<div class="paragraph">
<p><span class="small">
foo={foo}<br>
title={title}
</span></p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_asciidoc_paragraphs">AsciiDoc Paragraphs</h2>
<div class="sectionbody">
<div class="paragraph">
<p>There are several kinds of paragraphs.</p>
</div>
<div class="sect2">
<h3 id="_normal_paragraphs">Normal Paragraphs</h3>
<div class="ulist">
<ul>
<li>
<p>The Default.</p>
</li>
<li>
<p>No formatting needed.</p>
</li>
<li>
<p>Begin against left margin.</p>
</li>
</ul>
</div>
</div>
<div class="sect2">
<h3 id="_literal_paragraphs">Literal Paragraphs</h3>
<div class="ulist">
<ul>
<li>
<p>Rendered as monospaced text with the same background and no border.</p>
</li>
<li>
<p>No formatting or substitutions are made to the text..</p>
</li>
<li>
<p>Get it with:</p>
</li>
<li>
<p>Indented text. Only the to indent the first line, and that can be done with a single space.</p>
</li>
<li>
<p>put a <code>[literal]</code> line before the paragraph</p>
</li>
<li>
<p>surround the paragraph with dotted <code>&#8230;&#8203;.</code> lines.</p>
</li>
</ul>
</div>
</div>
<div class="sect2">
<h3 id="_listing_paragraphs_dashes">Listing Paragraphs (Dashes)</h3>
<div class="paragraph">
<p>Render the text with xxx.</p>
</div>
<div class="listingblock">
<div class="content">
<pre>Get it with containing dashes '----'.</pre>
</div>
</div>
</div>
<div class="sect2">
<h3 id="_text_quote_and_verse_quote_paragraphs">Text Quote and Verse Quote Paragraphs</h3>
<div class="paragraph">
<p>Text quotes flow the text; verse quotes keep line breaks.</p>
</div>
<div class="listingblock">
<div class="content">
<pre>[quote, Josephus, Antiquities]
The quote on piety and righteousness.</pre>
</div>
</div>
<div class="listingblock">
<div class="content">
<pre>[verse, Blake, Oh Rose]
Oh rose thou art sick,
In the withering light.</pre>
</div>
</div>
</div>
<div class="sect2">
<h3 id="_admonition_paragraphs">Admonition Paragraphs</h3>
<div class="paragraph">
<p>Add a single quote to: TIP, NOTE, IMPORTANT, WARNING, CAUTION at the beginning of the paragraph.</p>
</div>
<div class="literalblock">
<div class="content">
<pre>NOTE: This is a note paragraph.</pre>
</div>
</div>
<div class="paragraph">
<p>Or use the [NOTE] notation.</p>
</div>
<div class="admonitionblock note">
<table>
<tr>
<td class="icon">
<div class="title">Note</div>
</td>
<td class="content">
This is a note paragraph.
</td>
</tr>
</table>
</div>
<div class="paragraph">
<p>You can specify the icon to be used, with [icon="./images/icons/note.png:].</p>
</div>
</div>
<div class="sect2">
<h3 id="_delimited_blocks">Delimited Blocks</h3>
<div class="literalblock">
<div class="content">
<pre>//// comment
++++ Passthrough Block
---- Listing Block
.... Literal Block
**** Sidebar Block
____ Quote Block</pre>
</div>
</div>
<div class="sect3">
<h4 id="_example_block">Example Block</h4>
<div class="paragraph">
<p>&#8201;&#8212;&#8201;  Open Block</p>
</div>
</div>
</div>
</div>
</div>
