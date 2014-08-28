{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="warning">
<h2>{"Are you sure you want to remove the following translations from object <%1>?"|i18n("design/standard/node",,hash("%1",$object.name))|wash}</h2>
</div>

<form method="post" action={'content/translation'|ezurl}>

<table class="list">
    <tr>
        <th>{"Language"|i18n("design/standard/content/removetranslation")}</th>
    </tr>
    {foreach $languages as $language sequence array( bglight, bgdark ) as $class}
    <tr class="{$class}">
        <td><input type="hidden" name="LanguageID[]" value="{$language.id}" />{$language.name|wash}</td>
    </tr>
    {/foreach}
</table>


<input type="hidden" name="ContentObjectID" value="{$object_id|wash}" />
<input type="hidden" name="ContentNodeID" value="{$node_id|wash}" />
<input type="hidden" name="ContentObjectLanguageCode" value="{$language_code|wash}" />
<input type="hidden" name="ViewMode" value="{$view_mode|wash}" />
<input type="hidden" name="ConfirmRemoval" value="1" />

<div class="buttonblock">
    {include uri="design:gui/button.tpl" name="OK" id_name="RemoveTranslationButton" value="OK"|i18n("design/standard/content/removetranslation")}
    {include uri="design:gui/button.tpl" name="Cancel" id_name="CancelButton" value="Cancel"|i18n("design/standard/content/removetranslation")}
</div>

</form>
