{def $displayed_tags = array()}
{foreach $tag_cloud as $index => $tag}
{if and( $tag['tag']|contains( $tag_cloud_exclude_strings[0] )|not, $tag['tag']|contains( $tag_cloud_exclude_strings[1] )|not, $tag['tag']|contains( $tag_cloud_exclude_strings[2] )|not, $tag_cloud_exclude|contains( $tag['tag'] )|not, $displayed_tags|contains( $tag['tag'] )|not )}<li><a href={concat( "/content2/keyword/", $tag['tag']|rawurlencode, '/(limit)/90' )|ezurl()} class="tag{$tag['font_size']}" {* style="font-size: {$tag['font_size']}%" *}title="{$tag['count']} objects tagged with '{$tag['tag']|wash()}'">{$tag['tag']|explode('-')|implode('&#8209;')}</a></li>{set $displayed_tags=$displayed_tags|append( $tag['tag'] )}{/if}
{/foreach}