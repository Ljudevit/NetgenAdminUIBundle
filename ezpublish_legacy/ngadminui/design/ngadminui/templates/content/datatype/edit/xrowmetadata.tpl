{def $title_max = ezini('EditorInputSettings','MaxTitle','xrowmetadata.ini')
     $descr_max = ezini('EditorInputSettings','MaxDescription','xrowmetadata.ini')
}

{literal}
        <script type="text/javascript">
        jQuery(document).ready(function() {
            jQuery('#more_checkbox').click(function() {
                $('#options_div').toggle();
            });

        });
        </script>
    {/literal}

{* DO NOT EDIT THIS FILE! Use an override template instead. *}

<div class="block">
    <label>{'Title'|i18n( 'design/standard/class/datatype' )}:</label>
    <input maxlength={$title_max} id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute'
    )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_title" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_xrowmetadata_data_array_{$attribute.id}[title]" size="100" maxsize="255" value="{$attribute.content.title|wash()}" />
</div>

<div class="block">
    <label>{'Description'|i18n( 'design/standard/class/datatype' )}:</label>
    <input maxlength="{$descr_max}" id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute'
    )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_description" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_xrowmetadata_data_array_{$attribute.id}[description]" size="100" maxsize="255" value="{$attribute.content.description|wash()}" />
</div>

<div class="block">
    <label>{'Keywords'|i18n( 'design/standard/class/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_keywords" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_xrowmetadata_data_array_{$attribute.id}[keywords]" size="100" maxsize="1055" value="{$attribute.content.keywords|implode( ', ' )|wash()}" />
</div>

<div class="checkbox">
    <label><input id="more_checkbox" type="checkbox" {if or(ne($attribute.content.change,'daily'),ne($attribute.content.priority,'0.5'))}checked="checked"{/if} /> {'More options'|i18n( 'design/standard/class/datatype' )}</label>
</div>

<div class="block">

    <div id="options_div" {if and(eq($attribute.content.change,'daily'),eq($attribute.content.priority,'0.5'))}class="hide"{/if}>

        <div class="element">
            <label>{'Use in sitemap'|i18n( 'design/standard/class/datatype' )}:</label>
            <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_keywords" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_xrowmetadata_data_array_{$attribute.id}[sitemap_use]" size="1">
            <option value="0" {if ne($attribute.content.sitemap_use,'1')}selected{/if}>{'no'|i18n( 'design/standard/class/datatype' )}</option>
            <option value="1" {if eq($attribute.content.sitemap_use,'1')}selected{/if}>{'yes'|i18n( 'design/standard/class/datatype' )}</option>
            </select>
        </div>

        <div class="element">
            <label>{'Change frequence'|i18n( 'design/standard/class/datatype' )}:</label>
            <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_keywords" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_xrowmetadata_data_array_{$attribute.id}[change]" size="1">
                <option value="always" {if eq($attribute.content.change,'always')}selected{/if}>{'always'|i18n( 'design/standard/class/datatype' )}</option>
                <option value="hourly" {if eq($attribute.content.change,'hourly')}selected{/if}>{'hourly'|i18n( 'design/standard/class/datatype' )}</option>
                <option value="daily" {if eq($attribute.content.change,'daily')}selected{/if}>{'daily'|i18n( 'design/standard/class/datatype' )}</option>
                <option value="weekly" {if eq($attribute.content.change,'weekly')}selected{/if}>{'weekly'|i18n( 'design/standard/class/datatype' )}</option>
                <option value="monthly" {if eq($attribute.content.change,'monthly')}selected{/if}>{'monthly'|i18n( 'design/standard/class/datatype' )}</option>
                <option value="yearly" {if eq($attribute.content.change,'yearly')}selected{/if}>{'yearly'|i18n( 'design/standard/class/datatype' )}</option>
                <option value="never" {if eq($attribute.content.change,'never')}selected{/if}>{'never'|i18n( 'design/standard/class/datatype' )}</option>
            </select>
        </div>

        <div class="element">
            <label>{'Priority'|i18n( 'design/standard/class/datatype' )}:</label>
            <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_keywords" class="form-control ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_xrowmetadata_data_array_{$attribute.id}[priority]" size="1">
                <option value="" {if eq($attribute.content.priority,'')}selected{/if}>{'automatic'|i18n( 'design/standard/class/datatype' )}</option>
                <option value="0.0" {if eq($attribute.content.priority,'0.0')}selected{/if}>0.0</option>
                <option value="0.1" {if eq($attribute.content.priority,'0.1')}selected{/if}>0.1</option>
                <option value="0.2" {if eq($attribute.content.priority,'0.2')}selected{/if}>0.2</option>
                <option value="0.3" {if eq($attribute.content.priority,'0.3')}selected{/if}>0.3</option>
                <option value="0.4" {if eq($attribute.content.priority,'0.4')}selected{/if}>0.4</option>
                <option value="0.5" {if eq($attribute.content.priority,'0.5')}selected{/if}>0.5</option>
                <option value="0.6" {if eq($attribute.content.priority,'0.6')}selected{/if}>0.6</option>
                <option value="0.7" {if eq($attribute.content.priority,'0.7')}selected{/if}>0.7</option>
                <option value="0.8" {if eq($attribute.content.priority,'0.8')}selected{/if}>0.8</option>
                <option value="0.9" {if eq($attribute.content.priority,'0.9')}selected{/if}>0.9</option>
                <option value="1.0" {if eq($attribute.content.priority,'1.0')}selected{/if}>1.0</option>
            </select>
        </div>
    </div>

</div>
