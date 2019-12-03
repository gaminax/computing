---
layout: default
date: 2019-12-02
title: AsciiDoc Paragraphs
layout: page
liquid:
---
<div id="preamble">
<div class="sectionbody">
<div class="paragraph">
<p><span class="small"><a href="../../../index.html">Home/</a></span>
<span class="small"><a href="../../index.html">Computing/</a></span>
<span class="small"><a href="../index.html">Formatting/</a></span>
<span class="small"><a href="index.html">Asciidoc/</a></span></p>
</div>
<h1> {{ page.title }} </h1>
<div class="paragraph">
<p>There are several kinds of paragraphs, and each is rendered differently.
It is easy to make text noisy.</p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_normal_paragraphs">Normal Paragraphs</h2>
<div class="sectionbody">
<div class="paragraph">
<p>These are the default and need no formatting.
The must begin against the left margin.</p>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_literal_paragraphs_dots">Literal Paragraphs ( Dots )</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Rendered as monospaced text with the same background and no border.
No formatting or substitutions are made to the text.
Get them by:</p>
</div>
<div class="listingblock">
<div class="content">
<pre> Indenting the first line slightly.

[literal]
Putting a literal header line before the paragraph

....
Surrounding the paragraph with lines of four dots.
....</pre>
</div>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_listing_paragraphs_dashes">Listing Paragraphs (Dashes)</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Render the text with more backgound.</p>
</div>
<div class="literalblock">
<div class="content">
<pre>----
Get listing paragrpahs with surrounding dashes '----' or a [listing] header.
----</pre>
</div>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_text_quote_and_verse_quote_paragraphs">Text Quote and Verse Quote Paragraphs</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Text quotes flow the text; verse quotes keep line breaks.</p>
</div>
<div class="listingblock">
<div class="content">
<pre>[quote, Josephus, Antiquities]
The quote on piety and righteousness.

[verse, Blake, Oh Rose]
Oh rose thou art sick,
In the withering light.</pre>
</div>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_admonition_paragraphs">Admonition Paragraphs</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Add a TIP:, NOTE:, IMPORTANT:, WARNING:, CAUTION: at the beginning of the paragraph.</p>
</div>
<div class="listingblock">
<div class="content">
<pre>TIP: This is a tip paragraph.

NOTE: This is a note paragraph.</pre>
</div>
</div>
<div class="paragraph">
<p>Or use the [NOTE] notation.</p>
</div>
<div class="listingblock">
<div class="content">
<pre>[NOTE]
This is a note paragraph.</pre>
</div>
</div>
<div class="paragraph">
<p>You can specify the icon to be used in the admonition, with</p>
</div>
<div class="listingblock">
<div class="content">
<pre>[NOTE,icon="./images/icons/note.png"].</pre>
</div>
</div>
</div>
</div>
<div class="sect1">
<h2 id="_delimited_blocks">Delimited Blocks</h2>
<div class="sectionbody">
<div class="paragraph">
<p>Surround the text (one or more paragraphs) with a header and footer.</p>
</div>
<div class="literalblock">
<div class="content">
<pre>//// Comment
++++ Passthrough Block
---- Listing Block
.... Literal Block
**** Sidebar Block
____ Quote Block ( with word wrapping )
==== Example Block
--   Open Block</pre>
</div>
</div>
</div>
</div>
