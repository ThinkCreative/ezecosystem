{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{pdf(link, hash( url, concat('content/view/full/',$node.node_id)|ezurl(no),
                 text, $node.name|wash(pdf) ) )}